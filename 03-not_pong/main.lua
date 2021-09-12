function love.load()

    -- screen
    width, height = love.graphics.getDimensions()

    -- ball
    ballVelocityX = 2
    ballVelocityY = 2
    ballX = width / 2
    ballY = height / 2
    ballSize = 15
    
    -- rocket
    rocketWidth = 15
    rocketHeight = rocketWidth * 4

    -- player 1
    -- Player1 = {
    --     X = 15,
    --     Y = 15,
    --     left = Player1.X,
    --     right = Player1.X + rocketWidth,
    --     top = Player1.Y,
    --     bottom = Player1.Y + rocketHeight

    -- }
    player1X = 15
    player1Y = 15

    -- player 2
    player2X = width - 15 - rocketWidth
    player2Y = 15
    
end

function love.update()

    -- horizontal velocity
    if ballVelocityX > 0 then
        if ballX + ballSize < width then
            ballX = ballX + ballVelocityX            
        else
            ballVelocityX = -ballVelocityX
        end
    else
        if ballX > 0 then
            ballX = ballX + ballVelocityX            
        else
            ballVelocityX = -ballVelocityX
        end
    end

    -- vertical velocity
    if ballVelocityY > 0 then
        if ballY + ballSize < height then
            ballY = ballY + ballVelocityY            
        else
            ballVelocityY = -ballVelocityY
        end
    else
        if ballY > 0 then
            ballY = ballY + ballVelocityY            
        else
            ballVelocityY = -ballVelocityY
        end
    end

    -- exit
    if love.keyboard.isDown('q') then
        love.event.quit(0)
    end

end

function love.draw()
    -- ball
    love.graphics.rectangle('fill', ballX, ballY, ballSize, ballSize)

    -- player 1
    love.graphics.rectangle('fill', player1X, player1Y, rocketWidth, rocketHeight)

    -- player 2
    love.graphics.rectangle('fill', player2X, player2Y, rocketWidth, rocketHeight)
end