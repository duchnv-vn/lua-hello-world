local weakTableA = {}
setmetatable(weakTableA, { __mode = "kv" })

key = { a = 1 }
weakTableA[key] = 2

key = { b = 3 }
weakTableA[key] = 4

weakTableA[{ c = 5 }] = 6
weakTableA[7] = { d = 8 }

collectgarbage() -- remove object { a = 1 } linking to value 4 & { c = 5 } linking to value 6 & { d = 7 } corresponding to key 7

for k, v in pairs(weakTableA) do print(k, v) end
