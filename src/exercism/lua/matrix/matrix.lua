local function creat_matrix_from_string(s)
    local matrix = {}

    local row_count = 0
    for row in s:gmatch "([^\n]+)" do
        row_count = row_count + 1
        matrix[row_count] = {}

        for number in row:gmatch("%S+") do
            table.insert(matrix[row_count], tonumber(number))
        end
    end

    return matrix
end

return function(s)
    local matrix = creat_matrix_from_string(s)

    local function row(index)
        return matrix[index]
    end

    local function column(index)
        local array = {}

        for _, row_data in pairs(matrix) do
            table.insert(array, row_data[index])
        end

        return array
    end

    return {
        row = row,
        column = column
    }
end
