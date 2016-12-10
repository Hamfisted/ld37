local bump = require('vendor/bump')
local Player = require 'entities/player'
local Met = require 'entities/met'
local CollisionBox = require 'entities/collisionbox'
local Panel = require 'entities/panel'

local Level = Class{}
function Level:init()
end

function Level:load()
    local bumpWorld = bump.newWorld(32)

    -- globals: i'll fix this, don't worry bout it
    world = tiny.world(
        require ("systems/playercontrolsystem")(),
        require ("systems/projectilephysicssystem")(),
        require ("systems/bumpphysicssystem")(bumpWorld),
        require ("systems/spritesystem")(),
        require ("systems/panelsystem")(),
        require ("systems/debughitboxsystem")()
    )

    local player = Player()

    local panel = Panel()
    -- fixme
    Global.map = tileMap

    world:addEntity(player)
    world:addEntity(Met(700, 500))
    world:addEntity(panel)

end

return Level
