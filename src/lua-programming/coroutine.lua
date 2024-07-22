local Wheel = require 'timerwheel'

local wheel = Wheel.new({
    now = function()
        return os.date().sec
    end
})




local function cb(arg)
    print("do some async tasks...")
end

local id = wheel:set(2, cb, "")
wheel:cancel(id)

-- local function do_async_task(jobId)
--     local id = wheel:set(2, function()
--         wheel:step()
--         print("do some async tasks..." .. jobId)
--     end)
--     wheel:cancel(id)
-- end

-- local job1 = coroutine.create(function()
--     do_async_task()
--     print("First job")
-- end)

-- print(coroutine.status(job1))
-- coroutine.resume(job1)
-- print(coroutine.status(job1))
