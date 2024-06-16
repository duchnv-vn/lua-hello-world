local EliudsEggs = {}

function EliudsEggs.egg_count(number)
    local binary_one = {}

    while true do
        local remainder = number % 2
        if remainder == 1 then table.insert(binary_one, 1) end

        number = number // 2
        if number == 0 then break end
    end

    return #binary_one
end

return EliudsEggs
