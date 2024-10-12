-- main 
Class = {}
Class.__index = Class -- metatable
-- Class["__index"] = Class

function Class:new(id, name)
    local obj = {}
    setmetatable(obj, Class) -- object constructor
    obj.id = id
    obj.name = name
    return obj
end

-- method
function Class:method()
    print("id: " .. self.id)
    print("Name: " .. self.name)
end

local function main()
    -- test
    local object1 = Class:new(123, "hdjdfkd")
    local object2 = Class:new("456", "wfevwej")

    object1:method()
    object2:method()
end

main()