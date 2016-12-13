local explosion = love.audio.newSource('assets/sounds/Explosion10.wav')
local fire = love.audio.newSource('assets/sounds/Laser_Shoot48.wav')
local ded = love.audio.newSource('assets/sounds/ShipHit15.wav')
local talk = love.audio.newSource('assets/sounds/Talk41.wav')
local alarm = love.audio.newSource('assets/sounds/alarm.wav')
alarm:setVolume(.2)

local blip = love.audio.newSource('assets/sounds/Blip_Select67.wav')
local failBlip = love.audio.newSource('assets/sounds/Blip_Select72.wav')
local consoleButton = love.audio.newSource('assets/sounds/Blip_Select48.wav')
local spray = love.audio.newSource('assets/sounds/spray.wav')
spray:setLooping(true)
spray:setVolume(1)

local sludge = love.audio.newSource('assets/sounds/sludge.wav')
sludge:setLooping(true)
sludge:setVolume(1)

local loopwoosh = love.audio.newSource('assets/sounds/loopwoosh.wav')
loopwoosh:setLooping(true)
loopwoosh:setVolume(1)

Signal.register('explosion', function ()
    explosion:play()
end)

Signal.register('fire', function ()
    fire:play()
end)

Signal.register('alarm', function ()
    alarm:play()
end)

Signal.register('ded', function ()
    ded:play()
end)

Signal.register('talk', function ()
    talk:play()
end)

Signal.register('blip', function ()
    blip:play()
end)

Signal.register('failBlip', function ()
    failBlip:play()
end)

Signal.register('consoleButton', function ()
    consoleButton:play()
end)

Signal.register('spray', function ()
    print("playing spreay")
    spray:play()
end)

Signal.register('stopspray', function ()
    print("stopping spreay")
    spray:pause()
end)

Signal.register('woosh', function ()
    print("wooshing")
    loopwoosh:play()
end)

Signal.register('stopwoosh', function ()
    print("stopwoosh")
    loopwoosh:pause()
end)

Signal.register('sludge', function ()
    print("playing sludge")
    sludge:play()
end)

Signal.register('stopsludge', function ()
    print("stopping sludge")
    sludge:pause()
end)
