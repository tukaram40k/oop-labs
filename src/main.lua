local json = require 'src.json'

-- character class
Character = {}
Character.__index = Character

-- new() method
function Character:new(id, isHumanoid, planet, age, traits)
    local char = {
        id = id,
        isHumanoid = isHumanoid,
        planet = planet,
        age = age,
        traits = traits
    }
    setmetatable(char, Character)
    return char
end

-- universe class
Universe = {}
Universe.__index = Universe

-- new() method
function Universe:new(name)
    local universe = {
        name = name,
        characters = {}
    }
    setmetatable(universe, Universe)
    return universe
end

-- add character method
function Universe:addChar(char)
    table.insert(self.characters, char)
end

-- TODO: add universe:print method and test it

local function main()
    local file = io.open("input/test-input.json", "r")
    if not file then
        print("couldn't open input file")
        return
    end
    local data = file:read("*a")
    file:close()

    local char_data = json.decode(data)
    local parsed_data = char_data.input
    
end

main()