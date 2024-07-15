local function benchmark(f)
    local start = os.clock()
    f()
    return os.clock() - start
end

local array = {}

local ListNode = {}
function ListNode:new(data, next)
    local instance = setmetatable({ data = data, next = next }, ListNode)
    -- table.move(data, 1, #data, 1, instance)
    return instance
end

local linkedList = { _head = nil }
function linkedList:insert(data)
    local node = ListNode:new(data, nil)

    if not self._head then
        self._head = node
    else
        local current = self._head

        while current.next do
            current = current.next
        end

        current.next = node
    end
end

function linkedList:unshift(data)
    local node = ListNode:new(data, nil)

    if not self._head then
        self._head = node
    else
        node.next = self._head
        self._head = node
    end
end

for i = 1, 2000, 1 do
    array[i] = i
    linkedList:insert(i)
end



local tocal_action = 1000

-- update action in array
local array_execution_time = benchmark(function()
    for i = tocal_action, 0, -1 do
        print("array: " .. i)
        table.insert(array, 1, i)
    end
end)
local array_actions_per_second = tocal_action / array_execution_time

-- update action in linkedList
local linkedlist_execution_time = benchmark(function()
    for i = tocal_action, 0, -1 do
        print("linkedlist: " .. i)
        linkedList:unshift(i)
    end
end)
local linkedlist_actions_per_second = tocal_action / linkedlist_execution_time

print("array_actions_per_second: " .. array_actions_per_second)           --1754.3859649123 (actions/second)
print("linkedlist_actions_per_second: " .. linkedlist_actions_per_second) --3215.4340836013 (actions/second)
