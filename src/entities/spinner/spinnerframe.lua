local SpinnerFrame = Class{}

function SpinnerFrame:init(pos)
    self.spinner = true
    self.pos = pos
    self.sprite = love.graphics.newImage('assets/images/edittedspinnerframe.png')
    self.offset = {
        x = self.sprite:getWidth() / 2 + 1,
        y = self.sprite:getHeight() / 2
    }
    self.isDead = false
    self.angle = 0
    self.pauseTimer = 0
    self.colors = {
        love.graphics.newImage('assets/images/pills/green.png'),
        love.graphics.newImage('assets/images/pills/indigo.png'),
        love.graphics.newImage('assets/images/pills/purple.png'),
        love.graphics.newImage('assets/images/pills/aqua.png'),
        love.graphics.newImage('assets/images/pills/grey.png'),
        love.graphics.newImage('assets/images/pills/yellow.png')
    }

    self.isSpinnerFrame = true

end

function SpinnerFrame:getSelected()
    return math.ceil((table.getn(self.colors) * (math.pi * 2 - self.angle)) / (math.pi * 2))
end

function SpinnerFrame:pause(t)
    self.pauseTimer = t
end

function SpinnerFrame:process(dt)
    self.pauseTimer = self.pauseTimer - dt
    if(self.pauseTimer < 0) then
        self.pauseTimer = 0
    end

    if (not (self.pauseTimer == 0)) then return end

    self.angle = (self.angle + math.pi * 2 * dt) % (math.pi * 2)
    self.rot = (math.pi * 2) - self.angle
end

return SpinnerFrame
