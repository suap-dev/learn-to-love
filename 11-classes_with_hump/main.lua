position = 0
function print(string)
    if type(string) == "string" then        
    else
        string = string:__tostring()
    end
    love.graphics.print(string, 2, 14*position)
    position = position + 1
end

require 'Person'
require 'Child'

function love.load()
    s = Person("b", 33)
    k = Child("A", 12, "X")
end

function love.draw()
    -- love.graphics.setColor(1,1,1)
    print(s)
    print(k)
    position = 0
end