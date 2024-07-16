local function exercise_6_1(list)
    for _, value in ipairs(list) do
        print(value)
    end
end

local function exercise_6_2(...)
    return select(2, ...)
end
-- exercise_6_2(1, 2, 3, 4, 5, 6, nil, 7)

local function exercise_6_3(...)
    local list = { ... }

    table.remove(list, #list)
    return list
end
-- exercise_6_3(1, 2, 3, 4, 5, 6, nil, 7, 8)
