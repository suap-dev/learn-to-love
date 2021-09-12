local window = require('window')
local stuff = require('stuff')

function love.load()
    w, h = window.setUp()
    -- 1 meter
    m = h/20
    g = 9.81*m
    love.physics.setMeter(m)
    world = love.physics.newWorld(0, g, false)
    stuff.populate(world, m, w, h)
end

function love.update(dt)
    world:update(dt)

    stuff.ball.movement()
    stuff.box.movement()
    stuff.metricObject.movement()

    if love.keyboard.isDown("escape") then
        love.event.quit()
    elseif love.keyboard.isDown("r") then
        love.event.quit('restart')
    end
    
end

function love.draw()
    stuff.ground.draw()
    stuff.leftWall.draw()
    stuff.rightWall.draw()

    stuff.metricObject.draw()
    stuff.ball.draw()
    stuff.box.draw()

    local vx, vy = stuff.metricObject.body:getLinearVelocity()

    love.graphics.setColor(1,1,1)
    local textCoordX = 25
    local textCoordY = 15
    local textDeltaCoord = 12
    love.graphics.print(m, textCoordX, textCoordY)
    love.graphics.print("vx = " .. string.format("%.1f", vx/m), textCoordX, textCoordY + textDeltaCoord)
    love.graphics.print("vy = " .. string.format("%.1f", vy/m), textCoordX, textCoordY + 2*textDeltaCoord)
end
