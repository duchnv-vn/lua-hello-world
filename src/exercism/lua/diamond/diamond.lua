return function(which)
    local function generate_line(byte, outer_space_number, inner_space_number)
        local inner_content

        if inner_space_number == 0 then
            inner_content = string.char(byte)
        else
            inner_content = string.char(byte) ..
                string.rep(' ', inner_space_number) ..
                string.char(byte)
        end

        return string.rep(' ', outer_space_number) ..
            inner_content ..
            string.rep(' ', outer_space_number) ..
            '\n'
    end

    local startBye = 65
    local stringByte = string.byte(which)
    local vertical_half_length = stringByte - startBye

    if vertical_half_length == 0 then
        return 'A\n'
    end

    local top_half
    local bottom_half

    for i = startBye, stringByte, 1 do
        local vertical_position = i - startBye

        if vertical_position == 0 then
            top_half = generate_line(i, vertical_half_length, 0)
            bottom_half = top_half
        else
            local current_vertical_half_length = vertical_half_length - vertical_position
            local inner_length = vertical_position + (vertical_position - 1)

            top_half = top_half ..
                generate_line(i, current_vertical_half_length, inner_length)

            if i < stringByte then
                bottom_half = generate_line(i, current_vertical_half_length, inner_length) .. bottom_half
            end
        end
    end

    return top_half .. bottom_half
end
