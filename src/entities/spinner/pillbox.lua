local Pillbox = Class{}

local Utils = require('utils')
local Pill = require('entities/spinner/pill')

function Pillbox:init(pos, maxPills, padding)
    self.spinner = true
    self.pos = pos
    self.isDead = false
    self.isDraw = true
    self.pills = {}
    self.sprite = love.graphics.newImage('assets/images/pills/tube.png')
    self.alpha = 0.5
    self.maxPills = maxPills
    self.padding = padding
    -- self.initialPills = 2
    self.initialPills = Global.currentLevelDefinition.spinner.initialPills
end

function Pillbox:startingPills(colors)
    for i=1, self.initialPills do
        local pillNumber = math.random(table.getn(colors))
        local pillColor = colors[pillNumber]
        self:addPill(pillNumber, pillColor, true)
    end
end

function Pillbox:process(dt)
end

function Pillbox:isFull(dt)
    return table.getn(self.pills) == self.maxPills
end

function Pillbox:addPill(pillNumber, pillColor, isEnd)

    local pillWidth = (self.pos.w)/self.maxPills

    local pillStartX = self.pos.x - pillWidth + 10

    if (isEnd) then
        pillStartX = self.pos.x + self.pos.w - pillWidth;
    end


    local pill = Pill(
        pillNumber,
        pillColor,
        50,
        {
            x = pillStartX,
            y = self.pos.y+4,
            w = pillWidth - 2 * self.padding,
            h = self.pos.h
        },
        self.pos.x + self.pos.w - pillWidth,
        self.padding,
        table.getn(self.pills) + 1)
    lume.push(self.pills, pill)
    return pill
end

function Pillbox:removePill()
    self.pills = lume.map(self.pills, function(pill)
        pill.queue = pill.queue - 1
        return pill
    end)
    return table.remove(self.pills, 1)
end

return Pillbox
