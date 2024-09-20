local Account = {
    username = "",
    email = ""
}

---@param data table
function Account:new(data)
    return setmetatable(data, { __index = self })
end

---@return string
function Account:getUsername()
    return self.username
end

---@return string
function Account:getEmail()
    return self.email
end

return Account
