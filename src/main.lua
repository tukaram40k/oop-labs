local json = require 'src.json'

-- character class
Character = {}
Character.__index = Character

function Character:new(id, isHumanoid, planet, age, traits)
    local char = {
        id = id,
        isHumanoid = isHumanoid,
        planet = planet,
        age = age,
        traits = traits
    }
    setmetatable(char, Character) -- object constructor
    return char
end

-- temp function to turn object into table
function Character:table()
    return {
        id = self.id,
        isHumanoid = self.isHumanoid,
        planet = self.planet,
        age = self.age,
        traits = self.traits
    }
end

local function main()
    local file = io.open("input/test-input.json", "r")
    if not file then
        print("couldn't open input file")
        return
    end
    local data = file:read("*a")
    file:close()

    local char_data = json.decode(data)
    local characters = {}

    for _, char in ipairs(char_data.input) do
        local character = Character:new(
            char.id, char.isHumanoid or nil, char.planet or nil, char.age or nil, char.traits or {}
        )
        table.insert(characters, character:table())
    end

    local test_output = json.encode(characters)
    print(test_output)
end

main()