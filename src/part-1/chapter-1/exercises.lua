-- 1.1 Run the factorial function and also handle case negative number input
local function fact(number)
    if number == 0 then
        return 1
    else
        return number * fact(math.abs(number) - 1)
    end
end

--[[
    print("enter a number:")
    local number = io.read("n")
    print(fact(number))
--]]

-- 1.8 Write a simple script that prints its own name without knowing it in advance
--[[
    print(arg[0])
--]]
