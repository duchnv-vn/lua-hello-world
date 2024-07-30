---High order function
---comment
---@param f function
---@param delta? number
---@return function
local function derivative(f, delta)
    delta = delta or 1e-4

    ---Closure
    ---@param x number
    ---@return number
    return function(x)
        return (f(x + delta) - f(x)) / delta
    end
end

local f = derivative(math.sin)
local value = f(90)
-- print(value)
