local Set = require('set')



local s1 = Set.new { 4, 10, 2 }
local s2 = Set.new { 2, 4 }
local s3 = Set.new { 2, 5 }

local result1 = s2 <= s1 --> true
print('result1', result1)

local result2 = s3 < s1 --> false
print('result2', result2)
