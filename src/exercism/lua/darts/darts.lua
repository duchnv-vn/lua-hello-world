local Darts = {}

local Circle_radius = {
    outer = 10,
    middle = 5,
    inner = 1
}

local Scores = {
    out = 0,
    outer = 1,
    middle = 5,
    inner = 10
}

local function define_position(radius)
    if radius > Circle_radius.outer then
        return 'out'
    end

    if radius > Circle_radius.middle then
        return 'outer'
    end

    if radius > Circle_radius.inner then
        return 'middle'
    end

    return 'inner'
end

local function cal_circle_radius(x, y)
    local radius = (math.abs(x) ^ 2 + math.abs(y) ^ 2) ^ (1 / 2)
    return radius
end

function Darts.score(x, y)
    if x == 0 and y == 0 then
        return Scores.inner
    elseif x > 10 or y > 10 then
        return Scores.out
    end

    local radius_of_target = cal_circle_radius(x, y)
    local position = define_position(radius_of_target)

    return Scores[position]
end

return Darts
