function love.load()

    width, height = love.graphics.getDimensions()
    centerX = width/2
    centerY = height/2
    OposX = centerX
    OposY = centerY
    radius = 100
    step = 1
    velocityX = 1
    velocityY = 1
    angle1 = 1
    angle2 = 1.5
    
end


function love.update(dt)
    
    -- handle movement keys -- they change the velocity of the ball
    if love.keyboard.isDown("d") then
        velocityX = velocityX + step
    end
    if love.keyboard.isDown('a') then
        velocityX = velocityX - step
    end
    if love.keyboard.isDown('s') then
        velocityY = velocityY + step
    end
    if love.keyboard.isDown('w') then 
        velocityY = velocityY - step
    end

    -- change ball size
    if love.keyboard.isDown("q") and radius > 0 then
        radius = radius - 1
    end
    if love.keyboard.isDown("e") and radius < height and radius < width then
        radius = radius + 1
    end

    -- horizontal velocity
    if velocityX > 0 then
        if OposX + radius < width then
            OposX = OposX + velocityX            
        else
            velocityX = -velocityX
        end
    else
        if OposX - radius > 0 then
            OposX = OposX + velocityX            
        else
            velocityX = -velocityX
        end
    end

    -- vertical velocity
    if velocityY > 0 then
        if OposY + radius < height then
            OposY = OposY + velocityY            
        else
            velocityY = -velocityY
        end
    else
        if OposY - radius > 0 then
            OposY = OposY + velocityY            
        else
            velocityY = -velocityY
        end
    end

    -- angular velocity    
    angle1 = angle1 + 0.01
    angle2 = angle2 + 0.01

    -- exit
    if love.keyboard.isDown('escape') then
        love.event.quit(0)
    end

end


function love.draw()
    love.graphics.circle('line', OposX, OposY, radius)
    love.graphics.arc('fill', OposX, OposY, radius, angle1, angle2, 10)
end