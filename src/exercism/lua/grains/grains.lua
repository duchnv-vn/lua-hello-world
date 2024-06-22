local grains = {}

function grains.square(n)
    local result = 1.0

    for _ = 2, n do
        result = result * 2
    end

    return result
end

function grains.total()
    local CHESSBOARD_SQUARE_NUMBER = 64
    local result = 1.0

    for _ = 1, CHESSBOARD_SQUARE_NUMBER do
        result = result * 2
    end

    return result
end

return grains
