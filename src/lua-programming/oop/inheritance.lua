local Person = require "person"
local Account = require "account"

--[[ Single inheritance ]]
local ChildClass = Account:new({})

---@param data table
function ChildClass:new(data)
    return setmetatable(data, { __index = Person })
end

return ChildClass
