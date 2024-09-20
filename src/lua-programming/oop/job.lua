local Job = {
    title = "",
    companyName = "",
    companyAddress = ""
}

function Job:getTitle()
    return self.title
end

function Job:getCompanyName()
    return self.companyName
end

function Job:getCompanyAddress()
    return self.companyAddress
end

return Job
