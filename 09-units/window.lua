window = {}

local width  = 1200
local height = 600

function window.setUp()
    window.width =  width
    window.height = height
    love.window.setMode(width, height, {msaa=8})
    love.graphics.setBackgroundColor( 56/255, 40/255, 92/255)

    return width, height
end

return window
