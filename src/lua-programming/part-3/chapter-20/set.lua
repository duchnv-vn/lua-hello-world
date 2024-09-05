local Set = {}

local mt = {}

mt.__le = function(a, b) -- subset
    for k in pairs(a) do
        if not b[k] then return false end
    end
    return true
end

mt.__lt = function(a, b) -- proper subset
    print('a', a)
    print('b', b)
    return a <= b and not (b <= a)
end

mt.__eq = function(a, b)
    return a <= b and b <= a
end

function Set.union(a, b)
    local res = Set.new {}
    for k in pairs(a) do res[k] = true end
    for k in pairs(b) do res[k] = true end
    return res
end

mt.__add = Set.union

function Set.intersection(a, b)
    local res = Set.new {}
    for k in pairs(a) do
        res[k] = b[k]
    end
    return res
end

mt.__mul = Set.intersection

-- presents a set as a string
function Set.tostring(set)
    local l = {} -- list to put all elements from the set
    for e in pairs(set) do
        l[#l + 1] = tostring(e)
    end
    return "{" .. table.concat(l, ", ") .. "}"
end

-- create a new set with the values of a given list
function Set.new(l)
    local set = {}
    setmetatable(set, mt)
    for _, v in ipairs(l) do set[v] = true end
    return set
end

return Set
