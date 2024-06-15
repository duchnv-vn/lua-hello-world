-- lua -e "sin=math.sin" script a b
-- arg[-3] --> "lua"
-- arg[-2] --> "-e"
-- arg[-1] --> "sin=math.sin"
-- arg[0]  --> "script"
-- arg[1]  --> "a"
-- arg[2]  --> "b"

-- Run: lua src/part-1/chapter-1/standalone-interpreter.lua company1 employee2
print("Argument 1: " .. arg[1])
print("Argument 2: " .. arg[2])
