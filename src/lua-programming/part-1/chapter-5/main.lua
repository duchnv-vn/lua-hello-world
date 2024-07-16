local function excercise_5_3()
    local text = "hello world"
    local letter_table = {}

    for i = 1, #text, 1 do
        letter_table[i] = text:sub(i, i)
    end
end
-- excercise_5_3()

local function excercise_5_4()
    local function calculate_polynomial_value(polynomial_list, x)
        local result

        for key, value in ipairs(polynomial_list) do
            local current_value = value * x ^ (key - 1)

            if result == nil then
                result = current_value
            else
                result = result + current_value
            end
        end

        return result
    end

    local result = calculate_polynomial_value({ 1, 2, 3, 4, 5 }, 2)
    print("5.4 result: " .. result) -- 129.0 = 1*2^0 + 2*2^1 + 3*2^2 + 4*2^3 + 5*2^4
end
-- excercise_5_4()

local function excercise_5_6(sequence)
    local is_valid_sequence = true



    local count = 0
    for key in pairs(sequence) do
        if type(key) ~= 'number' then
            is_valid_sequence = false
            break
        end

        count = count + 1
    end

    if count ~= #sequence then
        is_valid_sequence = false
    end

    print("5.6 result: " .. is_valid_sequence)
    return is_valid_sequence
end
-- excercise_5_6({ 1, 2, 3, 4, 5 })
