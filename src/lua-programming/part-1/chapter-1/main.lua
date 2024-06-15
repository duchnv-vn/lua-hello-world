-- define function
print("--- Part 1 - Chapter 1 - Main ---")
local function isEven(number)
    return number % 2 == 0
end

local function isOdd(number)
    do return (not isEven(number)) end
end

---[[
while true do
    print("Enter a number:")
    local number = io.read("n")
    local result = isOdd(number)
    print("Is odd:", result)
end
-- ]]


-- print(4 and 5)       --> 5
-- print(nil and 13)    --> nil
-- print(false and 13)  --> false
-- print(0 or 5)        --> 0
-- print(false or "hi") --> "hi"
-- print(nil or false)  --> false
