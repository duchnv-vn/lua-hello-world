local Person = {
    firstName = "",
    lastName = "",
    address = "",
    dob = "",
    gender = ""
}

---@return string
function Person:getFullName()
    return self.firstName .. " " .. self.lastName
end

---@return string
function Person:getFirstName()
    return self.firstName
end

---@param data string
function Person:setFirstName(data)
    self.firstName = data
end

---@return string
function Person:getLastName()
    return self.lastName
end

---@return string
function Person:getAddress()
    return self.address
end

---@return string
function Person:getDOB()
    return self.dob
end

---@return string
function Person:getGender()
    return self.dob
end

return Person
