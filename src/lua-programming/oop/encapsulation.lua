---@param data table
return function(data)
    local function getUsername()
        return data.username
    end

    local function getEmail()
        return data.email
    end

    return {
        getUsername = getUsername,
        getEmail = getEmail
    }
end
