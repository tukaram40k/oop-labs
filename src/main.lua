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

-- character sorting method, see sorting_logic.png
function Logic:sort(character)
    -- helper to check if traits not null
    local function hasVals(tbl)
        return tbl ~= nil and #tbl > 0
    end

    if character.planet ~= nil then
        if character.planet == "Kashyyyk" or character.planet == "Endor" then
            self.universes.sw:addChar(character)
        elseif character.planet == "Asgard" then
            self.universes.mu:addChar(character)
        elseif character.planet == "Betelgeuse" or character.planet == "Vogsphere" then
            self.universes.hh:addChar(character)
        elseif character.planet == "Earth" then
            self.universes.lotr:addChar(character)
        end
    elseif not hasVals(character.traits) then
        if character.isHumanoid ~= nil then
            if character.isHumanoid then
                if character.age ~= nil then
                    if character.age > 5000 then
                        self.universes.lotr:addChar(character)
                    elseif character.age > 400 then
                        self.universes.mu:addChar(character)
                    elseif character.age > 200 then
                        self.universes.sw:addChar(character)
                    end
                end
            elseif character.age ~= nil then
                if character.age > 200 then
                    self.universes.sw:addChar(character)
                else
                    self.universes.hh:addChar(character)
                end
            end
        elseif character.age ~= nil then
            if character.age > 5000 then
                self.universes.lotr:addChar(character)
            elseif character.age > 400 then
                self.universes.mu:addChar(character)
            elseif character.age > 200 then
                self.universes.sw:addChar(character)
            end
        end
    elseif table.has(character.traits, "POINTY_EARS") then
        self.universes.lotr:addChar(character)
    elseif table.has(character.traits, "HAIRY") then
        self.universes.sw:addChar(character)
    elseif table.has(character.traits, "EXTRA_ARMS") or table.has(character.traits, "EXTRA_HEAD") then
        self.universes.hh:addChar(character)
    elseif table.has(character.traits, "GREEN") then
        self.universes.hh:addChar(character)
    elseif table.has(character.traits, "BULKY") then
        if character.isHumanoid ~= nil then
            if character.isHumanoid then
                self.universes.lotr:addChar(character)
            else
                self.universes.hh:addChar(character)
            end
        end
    elseif table.has(character.traits, "TALL") then
        if character.age ~= nil then
            if character.age > 5000 then
                self.universes.lotr:addChar(character)
            else
                self.universes.mu:addChar(character)
            end
        end
    end
end

-- check if value is in table
function table.has(tbl, val)
    for _, v in ipairs(tbl) do
        if v == val then
            return true
        end
    end
    return false
end

local function main()
    local file = io.open("input/input.json", "r")
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

    -- print output
    logic.universes.sw:print()
    logic.universes.mu:print()
    logic.universes.hh:print()
    logic.universes.lotr:print()

end

main()