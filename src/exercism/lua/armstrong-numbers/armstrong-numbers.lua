local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
    local numberStr = tostring(number)
    local power_number = #numberStr
    if power_number == 1 then return true end

    local armsstrong_number = 0
    for i = 1, power_number do
        local number_unit = numberStr:sub(i, i)
        armsstrong_number = armsstrong_number + (tonumber(number_unit) ^ power_number)
    end

    return armsstrong_number == number
end

ArmstrongNumbers.is_armstrong_number(153)

return ArmstrongNumbers
