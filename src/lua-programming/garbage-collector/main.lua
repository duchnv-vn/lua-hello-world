-- WEAK TABLE
if false then
    local weakTableA = {}
    setmetatable(weakTableA, {
        __mode = "kv"
    })

    key = {
        a = 1
    }
    weakTableA[key] = 2

    key = {
        b = 3
    }
    weakTableA[key] = 4

    weakTableA[{
        c = 5
    }] = 6
    weakTableA[7] = {
        d = 8
    }

    for k, v in pairs(weakTableA) do
        print("1", k, v)
    end

    collectgarbage() -- remove object { a = 1 } linking to value 4 & { c = 5 } linking to value 6 & { d = 7 } corresponding to key 7

    for k, v in pairs(weakTableA) do
        print("2", k, v)
    end
end

-- MEMORIZE FUNCTION
if false then
    local results = {}
    setmetatable(results, {
        __mode = 'v'
    })
    local function createRGB(r, g, b)
        local key = string.format("%d-%d-%d", r, g, b)
        local color = results[key]

        if color then
            print("reuse")
            return color
        else
            print("create new")
            local newColor = {
                red = r,
                green = g,
                blue = b
            }
            results[key] = newColor
            return newColor
        end
    end

    local color1 = createRGB(1, 2, 3) -- create new
    local color2 = createRGB(2, 3, 4) -- create new
    local color11 = createRGB(1, 2, 3) -- reuse
    createRGB(3, 4, 5) -- removed by garbage collector when no used by any variable
    collectgarbage()
end

-- TABLES WITH DEFAULT VALUES
if false then
    local defaults = setmetatable({}, {
        __mode = "k"
    })

    local function setDefault(t, d)
        defaults[t] = d
        setmetatable(t, {
            __index = function(k)
                return defaults[k]
            end
        })
    end

    ------------------------------------------
    local metas = setmetatable({}, {
        __mode = "v"
    })

    ---@param t table
    ---@param d table
    local function setDefault2(t, d)
        local mt = metas[d]
        if mt == nil then
            mt = {
                __index = function()
                    return d
                end
            }
            metas[d] = mt -- memorize
        end
        setmetatable(t, mt)
    end
end
