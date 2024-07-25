---@param fileName string
---@param content table
---@param writeMode? openmode
local function writeFile(fileName, content, writeMode)
    local file = assert(io.open(fileName, writeMode or "w"), "File open failed")

    for _, line in ipairs(content) do
        file:write(line .. "\n")
    end

    file:close()
end
-- writeFile("test-1.txt", { "2 3.5 5", "-99 100001 45" })

---@param sourceFileName string
---@param destFileName string
local function copyFileByChunk(sourceFileName, destFileName)
    local destFile = assert(io.open(destFileName, "w"), "Dest file open failed")
    local sourceFile = assert(io.open(sourceFileName, "r"), "Source file open failed")

    while sourceFile:read(0) ~= nil do
        local block = sourceFile:read(2 ^ 4)
        destFile:write(block)
    end

    destFile:close()
    sourceFile:close()
end
-- copyFileByChunk("test-1.txt", "test-1.copy.txt")


---@param fileName string
local function readFile(fileName)
    local file = assert(io.open(fileName, 'r'), "File not found")

    local firstLine = file:read("l")

    local n1, n2, n3 = file:read("n", "n", "n")

    file:close()
end
-- readFile("test-1.txt")

---@param fileName string
local function getFileContent(fileName)
    local file = assert(io.open(fileName, 'r'), "File not found")
    local content = file:read('a')
    file:close()

    return content
end
-- print(getFileContent("test-1.txt"))

local function IOReadStream()
    io.input("test-1.txt")

    local l1 = io.read("l")
    print("\n1:\n" .. l1)

    local l2 = io.read("l")
    print("\n2:\n" .. l2)

    io.input():close()
end
-- IOReadStream()
