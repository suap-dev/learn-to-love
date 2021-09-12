function love.draw()
    -- głowa
    love.graphics.circle('line', 380, 120, 40, 80)
    -- ciałko
    love.graphics.line(380, 120+40, 380, 260)
    -- łapki
    love.graphics.line(380, 120+40+30, 380-50, 120+30+40+50)
    love.graphics.line(380, 120+40+30, 380+50, 120+30+40+50)
    -- nóżki
    love.graphics.line(380, 260, 380-50, 260+65)
    love.graphics.line(380, 260, 380+50, 260+65)
end