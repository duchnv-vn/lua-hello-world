--- OOP
local Account1 = require "account"

local account1 = Account1:new({ email = "duc.huynh@gmail.com", username = "duc-huynh" })
local account2 = Account1:new({ email = "duc.huynh.2@gmail.com", username = "duc-huynh-2" })

-- print("account1", account1:getUsername())
-- print("account2", account2:getUsername())

--- Single inheritance
local Account2 = require "inheritance"
local account3 = Account2:new({
    email = "duc.huynh.3@gmail.com",
    username = "duc-huynh-3",
    firstName = "Duc 3",
    lastName = "Huynh 3"
})
local account5 = Account2:new({
    email = "duc.huynh.5@gmail.com",
    username = "duc-huynh-5",
    firstName = "Duc 5",
    lastName = "Huynh 5"
})


-- print("account3", account3:getFullName())
-- print("account5", account5:getFullName())

--- Multiple inheritance
local Account3 = require "multi-inheritance"

local account6 = Account3:new({
    email = "duc.huynh.6@gmail.com",
    username = "duc-huynh-6",
    firstName = "Duc 6",
    lastName = "Huynh 6",
    title = "Software Engineer",
    companyName = "SICK"
})
local account7 = Account3:new({
    email = "duc.huynh.7@gmail.com",
    username = "duc-huynh-7",
    firstName = "Duc 7",
    lastName = "Huynh 7",
    title = "Fullstack Engineer",
    companyName = "SICK Vietnam"
})

-- print("account6", account6:getFullName())
-- print("account6", account6:getCompanyName())
-- print("account7", account7:getCompanyName())

--[[ Encapsulation ]]
local Account5 = require "encapsulation"

local account8 = Account5({ email = "duc.huynh.8@gmail.com", username = "duc-huynh-8" })
local account9 = Account5({ email = "duc.huynh.9@gmail.com", username = "duc-huynh-9" })

-- print("account8", account8.getUsername())
-- print("account9", account9.getUsername())
