return function(s)
    local letter_count_array = {}

    for letter in string.gmatch(s, "%a") do
        local lowercase_letter = string.lower(letter)
        local new_count = (letter_count_array[lowercase_letter] or 0) + 1

        if new_count > 1 then
            return false
        end

        letter_count_array[lowercase_letter] = new_count
    end

    return true
end
