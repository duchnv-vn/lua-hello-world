local Hamming = {}

function Hamming.compute(a, b)
    if #a ~= #b then return -math.abs(#a - #b) end

    local hamming_distance = 0;

    for i = 1, #a do
        local a_letter = string.sub(a, i, i)
        local b_letter = string.sub(b, i, i)

        if a_letter ~= b_letter then
            hamming_distance = hamming_distance + 1
        end
    end

    return hamming_distance
end

return Hamming
