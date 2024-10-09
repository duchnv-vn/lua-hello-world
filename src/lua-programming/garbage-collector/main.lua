-- WEAK TABLE
local weakTableA = {}
setmetatable(weakTableA, { __mode = "kv" })

key = { a = 1 }
weakTableA[key] = 2

key = { b = 3 }
weakTableA[key] = 4

weakTableA[{ c = 5 }] = 6
weakTableA[7] = { d = 8 }

collectgarbage() -- remove object { a = 1 } linking to value 4 & { c = 5 } linking to value 6 & { d = 7 } corresponding to key 7

-- for k, v in pairs(weakTableA) do print(k, v) end

-- MEMORIZE FUNCTION
local results = {}
setmetatable(results, { __mode = 'v' })
local function createRGB(r, g, b)
    local key = string.format("%d-%d-%d", r, g, b)
    local color = results[key]

    if color then
        print("reuse")
        return color
    else
        print("create new")
        local newColor = { red = r, green = g, blue = b }
        results[key] = newColor
        return newColor
    end
end

local color1 = createRGB(1, 2, 3)  -- create new
local color2 = createRGB(2, 3, 4)  -- create new
local color11 = createRGB(1, 2, 3) -- reuse
createRGB(3, 4, 5)                 -- removed by garbage collector when no used by any variable
collectgarbage()
