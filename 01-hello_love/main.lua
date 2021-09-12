function Steer (PosX, PosY, SizeX, SizeY)
    if love.keyboard.isDown("s") and (PosY + SizeY <= H - 2) then
        PosY = PosY + 1
    end
    
    if love.keyboard.isDown("w") and (PosY >= 2) then
        PosY = PosY - 1
    end
    
    if love.keyboard.isDown("a") and (PosX >= 2) then
        PosX = PosX - 1
    end
    
    if love.keyboard.isDown("d") and (PosX + SizeX <= W - 2) then
        PosX = PosX + 1
    end

    if love.keyboard.isDown("e") then
        SizeX = SizeX + 1
        SizeY = SizeY + 1
    end

    if love.keyboard.isDown("q") then
        SizeX = SizeX - 1
        SizeY = SizeY - 1
    end
    
    return PosX, PosY, SizeX, SizeY
end

-- Load some default values for our rectangle.
function love.load()
    W, H = love.graphics.getDimensions()
    PosX = W / 4
    PosY = H / 4
    SizeX = W / 2
    SizeY = H / 2
    -- dofile("lib.lua")
end

-- Increase the size of the rectangle every frame.
function love.update(dt)
    PosX, PosY, SizeX, SizeY = Steer(PosX, PosY, SizeX, SizeY)
    -- if love.keyboard.isDown("s") and (PosY + SizeY <= H - 2) then
    --     PosY = PosY + 1
    -- end
    
    -- if love.keyboard.isDown("w") and (PosY >= 2) then
    --     PosY = PosY - 1
    -- end
    
    -- if love.keyboard.isDown("a") and (PosX >= 2) then
    --     PosX = PosX - 1
    -- end
    
    -- if love.keyboard.isDown("d") and (PosX + SizeX <= W - 2) then
    --     PosX = PosX + 1
    -- end

    -- if love.keyboard.isDown("e") then
    --     SizeX = SizeX + 1
    --     SizeY = SizeY + 1
    -- end

    -- if love.keyboard.isDown("q") then
    --     SizeX = SizeX - 1
    --     SizeY = SizeY - 1
    -- end
end

-- Draw a coloured rectangle.
function love.draw()
    love.graphics.rectangle('line', PosX, PosY, SizeX, SizeY)
end