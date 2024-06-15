-- Numerals
local integerNumber = 4
local floatNumber = 4.0
local shouldEqual = integerNumber == floatNumber --> true

local hexaDecimalNumber = 0xff                   --> 255

local intAddOp = 3 + 3                           --> 6
local floatAddOp = 2.0 + 2.0                     --> 4.0
local intFloatAddOp = 3 + 3.0                    --> 6.0
local intSubtractOp = 6 - 4
local floatSubtractOp = 5.5 - 2.5
local intMultiOp = 2 * 4
local floatMultiOp = 2.0 * 5.5
local floorDivisionNumber = 2 // 2 --> 1
local moduloDivisionNumber = 2 % 2 --> 0
local angleToRadian = 30 * 2 * math.pi

local stringLength = #"hello"

local longString = [[
    hello
    world
    !
]]

local namesArray = { "Duc", "Duc2", "Duc3" }
local firstName = namesArray[1]

local studentInfo = { nation = "Vietnam", class = "DT1" }
studentInfo["id"] = 1
local fieldName = "name"
studentInfo[fieldName] = "Duc"
studentInfo.age = 27

print("" .. studentInfo)
