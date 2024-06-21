local NOT_FOUND_VALUE = -1

local function cal_array_length(start_index, end_index)
    return end_index - start_index + 1
end

local function cal_middle_index(array_len)
    return math.ceil(array_len / 2)
end

local function cal_original_middle_index(start_index, current_middle_index)
    return start_index + current_middle_index
end

local function recursion(array, target, start_index, end_index)
    local middle_index_value;

    local remained_array_len = cal_array_length(start_index, end_index)

    if remained_array_len == 1 then
        middle_index_value = array[start_index]
        if middle_index_value == target then
            return start_index
        else
            return NOT_FOUND_VALUE
        end
    end

    local middle_index = cal_middle_index(remained_array_len)
    local original_middle_index;
    if start_index == 1 then
        original_middle_index = middle_index
    else
        original_middle_index = cal_original_middle_index(start_index, middle_index)
    end

    middle_index_value = array[original_middle_index]

    if middle_index_value == target then
        return original_middle_index
    end

    if target > middle_index_value then
        start_index = original_middle_index + 1
    elseif target < middle_index_value then
        end_index = original_middle_index - 1
    end

    if (start_index == 0) or (end_index == 0) then
        return NOT_FOUND_VALUE
    end

    return recursion(array, target, start_index, end_index)
end

return function(array, target)
    if #array == 0 then
        return NOT_FOUND_VALUE
    end

    return recursion(array, target, 1, #array)
end
