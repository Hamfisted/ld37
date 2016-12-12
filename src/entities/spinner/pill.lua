local Pill = Class{}

local Utils = require('Utils')

function Pill:init(number, sprite, v, pos, endX, padding, queue)
    self.sprite = sprite
    self.number = number
    self.spinner = true
    self.isPill = true
    self.isSuicidal = false
    self.velocity = v
    self.pos = pos
    self.endX = endX
    self.padding = padding
    self.queue = queue or 1
    printTable(pos)
end

return Pill
