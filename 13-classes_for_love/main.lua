require 'Rectangle'

function love.load()
    -- setup window
    window_width, window_height = love.graphics.getDimensions()
    top, bottom = 0, window_height
    left, right = 0, window_width
    center_x, center_y = window_width/2, window_height/2

    -- setup world and physics
    m = window_height/10
    cm = m/100
    g = 9.81*m

    love.physics.setMeter(m)
    world1 = love.physics.newWorld(0, g, false)

    -- prepare some shapes
    rec1 = Rectangle(
        world1,
        center_x, top + m,
        m, m,
        false,
        0.7, 0.4, 0.2
    )

    ground = Rectangle(
        world1,
        center_x, bottom-(0.15*m),
        window_width, 0.3*m,
        true
    )
end

function love.update(dt)
    world1:update(dt)
    if love.keyboard.isDown('r') then
        love.event.quit('restart')
    end
end

function love.draw()
    ground:draw()
    rec1:draw()
end