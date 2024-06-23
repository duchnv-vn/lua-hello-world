local BankAccount = {}
BankAccount.__index = BankAccount

BankAccount.balance_number = 0
BankAccount.active = true

function BankAccount:new()
    local instance = setmetatable({}, BankAccount)
    return instance
end

function BankAccount:balance()
    return self.balance_number
end

function BankAccount:withdraw(quantity)
    if quantity <= 0 then
        return error()
    end

    if quantity > self.balance_number then
        return error()
    end

    if not self.active then
        return error()
    end

    self.balance_number = self.balance_number - quantity
end

function BankAccount:deposit(quantity)
    if quantity <= 0 then
        return error()
    end

    if not self.active then
        return error()
    end

    self.balance_number = self.balance_number + quantity
end

function BankAccount:close()
    self.active = false
end

return BankAccount
