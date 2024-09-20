local Person = require "person"
local Account = require "account"
local Job = require "job"

--[[ Multiple inheritance ]]

local ChildClass = {}

---@param key string
---@param superClasses table
local function searchProps(key, superClasses)
    for i = 1, #superClasses do
        local prop = superClasses[i][key]

        if prop then
            return prop
        end
    end
end

ChildClass = setmetatable(ChildClass, {
    __index = function(t, k)
        local prop = searchProps(k, { Account, Person, Job })
        t[k] = prop
        return prop
    end
})


---@param data table
function ChildClass:new(data)
    return setmetatable(data, { __index = ChildClass })
end

return ChildClass
