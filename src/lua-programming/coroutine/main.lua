--************ Consumer-driven design ************
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

-- When the consumer needs an item, it resumes the producer
-- CDD_Module.consumer()

--************ Producer-driven design ************
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

PDD_Module.consumer(PDD_Module.filter(PDD_Module.producer()))
