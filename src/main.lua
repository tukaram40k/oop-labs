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

-- method to print output to file
function Universe:print()
    local filename = "output/" .. self.name .. ".json"
    local file = io.open(filename, "w")
    if not file then
        print("couldn't create output file")
        return
    end
    local output = {}
    for _, char in ipairs(self.characters) do
        table.insert(output, {
            id = char.id,
            isHumanoid = char.isHumanoid,
            planet = char.planet,
            age = char.age,
            traits = char.traits
        })
    end
    file:write(json.encode({characters = output}))
    file:close()
end

-- sorting logic class
Logic = {}
Logic.__index = Logic

function Logic:new()
    local logic = {
        universes = {
            sw = Universe:new("Star_Wars"),
            mu = Universe:new("Marvel"),
            hh = Universe:new("Hitchhiker"),
            lotr = Universe:new("Lord_of_the_Rings")
        }
    }
    setmetatable(logic, Logic)
    return logic
end

-- character sorting method
function Logic:sort(character)
    self.universes.sw:addChar(character) -- for testing
    -- TODO: add actual logic
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
    local parsed_data = char_data.input
    local logic = Logic:new()

    -- create character objects from json data
    for _, char in ipairs(parsed_data) do
        local character = Character:new(
            char.id,
            char.isHumanoid,
            char.planet,
            char.age,
            char.traits
        )
        logic:sort(character)
    end

    logic.universes.sw:print()

end

main()