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