-- local gamestate = require "lib.gamestate"
local anim8 = require 'vendor/anim8'
local Utils = (require 'utils')()

local Missile = Class{}
-- Missile.SPEED = 50

function Missile:init(src_x, src_y, dest_x, dest_y)
    self.misslowcommand = true
    self.isMissile = true
    self.isCollidable = true
    self.destination = {x = dest_x, y = dest_y}
    self.isDead = false


    self.speed = 50 -- default
    if Global and Global.currentLevelDefinition.misslowcommand then
        self.speed = Global.currentLevelDefinition.misslowcommand.speed
    end

    local offset_x = dest_x - src_x
    local offset_y = dest_y - src_y
    self.rot = math.atan2(offset_y, offset_x)

    self.velocity = {
        x = math.cos(self.rot) * self.speed,
        y = math.sin(self.rot) * self.speed,
    }
    self.pos = {x = src_x, y = src_y}
    self.sprite = love.graphics.newImage('assets/images/missile_sheet.png')
    local g = anim8.newGrid(35, 15, self.sprite:getWidth(), self.sprite:getHeight())
    self.animation = anim8.newAnimation(g(1, '1-2'), 0.1)
    self.offset = {
        x = 35 / 2,
        y = 15 / 2,
    }
end

function Missile:process(dt)
    local ox = self.pos.x - self.destination.x
    local oy = self.pos.y - self.destination.y
    if Utils.isInCircle(ox, oy, dt * self.speed) then
        self.isDead = true
        Signal.emit('gameover', 'misslowcommand')
    end
end

return Missile
