local shapes = {}

function shapes.move(shape, vector)
    local movedShape = {}
    for i=1, #shape, 2 do
        movedShape[i] = shape[i] + vector[1]
        movedShape[i+1] = shape[i+1] + vector[2]
    end

    return movedShape    
end


function shapes.rotate(angle, shape, center)
    local shapeLen = #shape
    -- local hackedShape = hackIt(shape, center)
    local rotatedShape = {}

    for i=1, shapeLen, 2 do
        rotatedShape[i]      = shape[i]*math.cos(angle) - shape[i+1]*math.sin(angle)
        rotatedShape[i+1]    = shape[i]*math.sin(angle) + shape[i+1]*math.cos(angle)
    end

    -- return unHackIt(hackedShape, center)
    return rotatedShape
end

return shapes


-- local function hackIt(shape, center)
--     local hackedShape = {}
--     for i=1, #shape, 2 do
--         hackedShape[i] = shape[i] - center[1]
--         hackedShape[i+1] = shape[i+1] - center[2]
--     end
--     return hackedShape
-- end

-- local function unHackIt(shape, center)
--     local unHackedShape = {}
--     for i=1, #shape, 2 do
--         unHackedShape[i] = shape[i] + center[1]
--         unHackedShape[i+1] = shape[i+1] + center[2]
--     end

--     return unHackedShape    
-- end
