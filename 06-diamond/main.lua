    local shapes = require "shapes"

    ---[[
    function love.load()
        Tau = 2*math.pi
        DefaultAlpha = Tau/(2^8)
        Width, Height = 1024, 768
        love.window.setMode( Width, Height, {vsync=0, msaa=4} )
        -- Width, Height, _ = love.window.getMode()
        CenterX = Width/2
        CenterY = Height/2
        Center = {CenterX, CenterY}
        TDiamond = 
            {
                0,        75,
                -100,    -100+75,
                -50,     -150+75,
                50,     -150+75,
                100,    -100+75
            }
    end
    
    function love.update()
        TDiamond = shapes.rotate(DefaultAlpha/2, TDiamond)
        PositionedDiamond = shapes.move(TDiamond, Center)
        FPS = tostring(love.timer.getFPS())

        -- Diamond = shapes.move(Diamond, Center)
    end
    
    function love.draw()
        love.graphics.print("Current FPS: " .. FPS, 10, 10)
        love.graphics.polygon('fill', PositionedDiamond)
    end

    --]]
    
    --[[
    CenterX = 0
    CenterY = 0
    Diamond = 
        {CenterX,        CenterY+75,
        CenterX-100,    CenterY-100+75,
        CenterX-50,     CenterY-150+75,
        CenterX+50,     CenterY-150+75,
        CenterX+100,    CenterY-100+75}
    
    shape = shapes.rotate(2, Diamond)
    for i=1, #shape, 2 do
        print(shape[i], shape[i+1])
    end
    --]]