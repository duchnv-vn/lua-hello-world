local function task_may_fail(n)
    print("argument: " .. n)
    local number = math.random(10)

    if number % 2 ~= 0 then
        error({ message = "This is error" })
    end

    print("Execute successfully...")
    return { message = "This is result" }
end

-- local result = task_may_fail(2) --- not cover exception

local status, result = pcall(task_may_fail, 1)
print("status: " .. tostring(status))
print(result.message)

local function handle_error(error)
    print(error.message)
end
xpcall(task_may_fail, handle_error, 2)

print("Execute next tasks...")