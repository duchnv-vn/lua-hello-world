return {
  ---@param s string
  ---@return string
  encode = function(s)
    local result = ''

    local index = 1
    while index <= #s do
      local originIndex = index
      local character = s:sub(index, index)

      repeat
        index = index + 1
        local nextCharacter = s:sub(index, index)
      until index > #s or character ~= nextCharacter

      local count = index - originIndex
      result = result .. (count > 1 and count or '') .. character
    end

    return result
  end,

  ---@param s string
  ---@return string
  decode = function(s)
    local result = ''

    local index = #s
    while index >= 1 do
      local character = s:sub(index, index)

      local numberStr = ''
      local nextCharacter = ''
      repeat
        numberStr = nextCharacter .. numberStr
        index = index - 1
        nextCharacter = s:sub(index, index)
      until index > #s or not tonumber(nextCharacter)

      local number = tonumber(numberStr) or 1
      result = character:rep(number) .. result
    end

    return result
  end
}
