function love.load()
    width=600
    height = 600
    cycloid = {}
    r = width / (2*math.pi)
    i = 1
    for angle=0,2*math.pi,(2*math.pi)/64 do
        cycloid[i]      = r*(angle - math.sin(angle))
        cycloid[i+1]    = r*(1 - math.cos(angle))+100
        i = i+2
    end 
    cycloid[i] = width
    cycloid[i+1] = 2*r+100
    i = i+2
    cycloid[i] = 0
    cycloid[i+1] = 2*r+100+2
    shape = love.physics.newChainShape(false, cycloid)
end


function love.draw()
    love.graphics.polygon('line', cycloid)

end
