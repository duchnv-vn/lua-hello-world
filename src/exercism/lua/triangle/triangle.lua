local triangle = {}

local triangle_kinds = {
    equilateral = 'equilateral',
    isosceles = 'isosceles',
    scalene = 'scalene'
}

local INVALID_MEASURE_MESSAGE = 'Input Error'

local function validate_triangle_measures(a, b, c)
    local greater_zero = a > 0 and b > 0 and c > 0
    local sum_two_sides_greater_equal_third_side = (a + b) >= c and (b + c) >= a and (c + a) >= b

    return greater_zero and sum_two_sides_greater_equal_third_side
end

function triangle.kind(a, b, c)
    if not validate_triangle_measures(a, b, c) then
        return error(INVALID_MEASURE_MESSAGE)
    end

    local check_a_b = a == b
    local check_b_c = b == c
    local check_a_c = a == c

    if check_a_b and check_a_c and check_b_c then
        return triangle_kinds.equilateral
    end

    if check_a_b or check_a_c or check_b_c then
        return triangle_kinds.isosceles
    end

    return triangle_kinds.scalene
end

return triangle
