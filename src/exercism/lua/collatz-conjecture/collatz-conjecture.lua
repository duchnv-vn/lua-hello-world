local INVALID_NUMBER_ERROR_MESSAGE = 'Only positive numbers are allowed'

local function handle_even_number(n)
    return n / 2
end

local function handle_odd_number(n)
    return 3 * n + 1
end

return function(n)
    if n <= 0 then
        return error(INVALID_NUMBER_ERROR_MESSAGE)
    end

    local step_count = 0
    while n ~= 1 do
        step_count = step_count + 1
        n = n % 2 == 0
            and handle_even_number(n)
            or handle_odd_number(n)
    end

    return step_count
end
