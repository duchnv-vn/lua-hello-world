--************ Consumer-driven design ************
local function main1()
    local CDD_Module = {}

    function CDD_Module.send(x)
        coroutine.yield(x)
    end

    local function producer()
        while true do
            print("Enter value:")
            local x = io.read() -- produce new value
            CDD_Module.send(x)  -- send it to consumer
        end
    end
    CDD_Module.producerHandler = coroutine.create(producer)

    function CDD_Module.receive()
        local status, value = coroutine.resume(CDD_Module.producerHandler)
        return value
    end

    function CDD_Module.consumer()
        while true do
            local value = CDD_Module.receive() -- receive value from producer
            print("Consume value")
            print('value', value)              -- consume it
        end
    end
end

-- When the consumer needs an item, it resumes the producer
-- CDD_Module.consumer()

--************ Producer-driven design ************
local function main2()
    local PDD_Module = {}

    function PDD_Module.receive(prod)
        local status, value = coroutine.resume(prod)
        return value
    end

    function PDD_Module.send(x)
        coroutine.yield(x)
    end

    function PDD_Module.filter(prod)
        return coroutine.create(function()
            for line = 1, math.huge do
                local x = PDD_Module.receive(prod) -- get new value
                x = x * 2
                print("Line:", line)
                print("Filted value:", x)
                PDD_Module.send(x) -- send it to consumer
            end
        end)
    end

    function PDD_Module.consumer(prod)
        while true do
            local x = PDD_Module.receive(prod) -- get new value
            print("Receive value:", x)         -- consume new value
        end
    end

    function PDD_Module.producer()
        return coroutine.create(function()
            while true do
                print("Enter value:")
                local x = io.read() -- produce new value
                print("Init value:", x)
                PDD_Module.send(x)
            end
        end)
    end
end

-- PDD_Module.consumer(PDD_Module.filter(PDD_Module.producer()))

--************ Coroutine iterator ************
local function main3()
    local function printResult(a)
        for i = 1, #a do io.write(a[i], " ") end
        io.write("\n")
    end
    local function permgen(a, n)
        n = n or #a    -- default for 'n' is size of 'a'
        if n <= 1 then -- nothing to change?
            printResult(a)
        else
            for i = 1, n do
                -- put i-th element as the last one
                a[n], a[i] = a[i], a[n]

                -- generate all permutations of the other elements
                permgen(a, n - 1)

                -- restore i-th element
                a[n], a[i] = a[i], a[n]
            end
        end
    end
    -- permgen({ 1, 2, 3, 4 })

    local arr = { 1, 2, 3, 4 }
    local num = 2

    local function testFunctionEffectSide(item)
        if type(item) == 'table' then
            table.insert(item, 5)
        else
            item = item * 2
        end
    end

    for _, v in ipairs(arr) do
        print(v)
    end

    print("--------------")

    testFunctionEffectSide(arr)
    for _, v in ipairs(arr) do -- arr = { 1, 2, 3, 4, 5 }
        print(v)
    end

    print(1, num) -- num = 2
    testFunctionEffectSide(num)
    print(2, num) -- num = 2
end

--************ Event-driven programming ************
local function main4()
    local lib = require "async-lib"

    local function run(code)
        local co = coroutine.wrap(function()
            code()
            lib.stop() -- finish event loop when done
        end)
        co()           -- start coroutine
        lib.runloop()  -- start event loop
    end

    local function putline(stream, line)
        local co = coroutine.running() -- calling coroutine
        local callback = (function() coroutine.resume(co) end)
        lib.writeline(stream, line, callback)
        coroutine.yield()
    end

    local function getline(stream, line)
        local co = coroutine.running() -- calling coroutine
        local callback = (function(l) coroutine.resume(co, l) end)
        lib.readline(stream, callback)
        line = coroutine.yield()
        return line
    end
end
