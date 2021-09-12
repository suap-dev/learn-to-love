stuff = {}
stuff.ground = {}
stuff.leftWall = {}
stuff.rightWall = {}
stuff.ball = {}
stuff.box = {}
stuff.metricObject = {}

function stuff.populate(world, meter, width, height)

    local meterTickLength = 10
    local cm = meter/100
    local m = meter
    local kg = 1
    local waterDensity = 100
    local _, g = world:getGravity()
    local N = kg

    local wallThickness = 15
    local groundHeight = height/10

    
    -- GROUND --
    local groundColor = {185/255, 180/255, 171/255}
    stuff.ground.body    = love.physics.newBody(world, width/2, height - height/20)
    stuff.ground.shape   = love.physics.newRectangleShape(width, groundHeight)
    stuff.ground.fixture = love.physics.newFixture(
        stuff.ground.body,
        stuff.ground.shape
    )
    stuff.ground.fixture:setFriction(1)

    function stuff.ground.draw()
        love.graphics.setColor(groundColor)
        love.graphics.polygon(
            'fill',
            stuff.ground.body:getWorldPoints(stuff.ground.shape:getPoints())
        )
        love.graphics.setColor(0,0,0)
        for i=wallThickness, width-wallThickness, meter do
            love.graphics.line(i, height - groundHeight, i, height - groundHeight + meterTickLength)
        end
    end
    -- /ground

    -- LEFT WALL --
    stuff.leftWall.body    = love.physics.newBody(world, wallThickness/2, height/2)
    stuff.leftWall.shape   = love.physics.newRectangleShape(wallThickness, height)
    stuff.leftWall.fixture = love.physics.newFixture(
        stuff.leftWall.body, stuff.leftWall.shape
    )
    stuff.leftWall.fixture:setFriction(1)

    function stuff.leftWall.draw()
        love.graphics.setColor(groundColor)
        love.graphics.polygon(
            'fill',
            stuff.leftWall.body:getWorldPoints(stuff.leftWall.shape:getPoints())
        )
        love.graphics.setColor(0,0,0)
        for i=width-groundHeight, 0, -meter do
            love.graphics.line(wallThickness, i, wallThickness-meterTickLength, i)
        end
    end
    -- /left wall

    -- RIGHT WALL --
    stuff.rightWall.body    = love.physics.newBody(world, width-(wallThickness/2), height/2)
    stuff.rightWall.shape   = love.physics.newRectangleShape(wallThickness, height)
    stuff.rightWall.fixture = love.physics.newFixture(
        stuff.rightWall.body, stuff.rightWall.shape
    )
    stuff.rightWall.fixture:setFriction(1)

    function stuff.rightWall.draw()
        love.graphics.setColor(groundColor)
        love.graphics.polygon(
            'fill',
            stuff.rightWall.body:getWorldPoints(stuff.rightWall.shape:getPoints())
        )
    end
    -- /right wall

    -- METRIC OBJECT --
    stuff.metricObject.body    = love.physics.newBody(world, width/2, height-groundHeight-(5*cm), 'dynamic')
    stuff.metricObject.shape   = love.physics.newRectangleShape(10*cm, 10*cm)
    stuff.metricObject.fixture = love.physics.newFixture(
        stuff.metricObject.body, stuff.metricObject.shape,
        waterDensity
    )
    stuff.metricObject.fixture:setFriction(0.01)
    stuff.metricObject.fixture:setRestitution(0.9)

    function stuff.metricObject.draw()
        love.graphics.setColor(160/256,176/256,178/256)
        love.graphics.polygon(
            'fill',
            stuff.metricObject.body:getWorldPoints(stuff.metricObject.shape:getPoints())
        )
    end

    function stuff.metricObject:movement()
        if love.keyboard.isDown("i") then
            stuff.metricObject.body:applyForce(0, -g*N*4)
            -- stuff.metricObject.body:applyLinearImpulse(0,-0.015*kg)
        end
        if love.keyboard.isDown("j") then
            stuff.metricObject.body:applyForce(-8*m*N, 0)
            -- stuff.metricObject.body:applyLinearImpulse(0,-0.015*kg)
        end
        if love.keyboard.isDown("l") then
            stuff.metricObject.body:applyForce(8*m*N, 0)
            -- stuff.metricObject.body:applyLinearImpulse(0,-0.015*kg)
        end

    end



    -- BALL --
    stuff.ball.body    = love.physics.newBody(world, width/3, height/2, 'dynamic')
    local ballRadius   = 50*cm
    stuff.ball.shape   = love.physics.newCircleShape(ballRadius)
    stuff.ball.fixture = love.physics.newFixture(
        stuff.ball.body, stuff.ball.shape,
        waterDensity/1000   -- density
    )
    stuff.ball.fixture:setRestitution(0.85)
    stuff.ball.fixture:setFriction(0.3)
    
    function stuff.ball.draw()
        love.graphics.setColor(0.780, 0.156, 0.941)
        love.graphics.circle(
            'fill',
            stuff.ball.body:getX(), stuff.ball.body:getY(),
            stuff.ball.shape:getRadius()
        )
        -- a line that shows if the ball is rolling
        local x, y = stuff.ball.body:getX(), stuff.ball.body:getY()
        local angle = stuff.ball.body:getAngle()
        local dx = math.cos(angle) * ballRadius
        local dy = math.sin(angle) * ballRadius
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.line(
            x, y,
            x + dx, y + dy
        )
    end

    local ballDefaultForce = 3*N
    function stuff.ball.movement()

        if love.keyboard.isDown('w') then
            stuff.ball.body:applyForce(0, -1.2*ballDefaultForce*meter)
        end

        if love.keyboard.isDown('a') then
            stuff.ball.body:applyForce(-ballDefaultForce*meter, 0)
        end
        if love.keyboard.isDown('d') then
            stuff.ball.body:applyForce(ballDefaultForce*meter, 0)
        end
    end
    -- /ball

    -- BOX --
    stuff.box.body = love.physics.newBody(world, 2*width/3, height/2, 'dynamic')
    stuff.box.shape = love.physics.newRectangleShape(m, m) -- ball radius was defined in ball
    stuff.box.fixture = love.physics.newFixture(
        stuff.box.body, stuff.box.shape,
        waterDensity/200  -- density
    )
    stuff.box.fixture:setRestitution(0.15)
    stuff.box.fixture:setFriction(1)

    function stuff.box.draw()
        love.graphics.setColor(186/255, 140/255, 99/255, 1)
        love.graphics.polygon(
            'fill',
            stuff.box.body:getWorldPoints(stuff.box.shape:getPoints())
        )
    end

    local boxDefaultForce = N*m*10
    function stuff.box.movement()
        if love.keyboard.isDown('up') then
            stuff.box.body:applyForce(0, -1.5*boxDefaultForce)
        end
        if love.keyboard.isDown('left') then
            stuff.box.body:applyForce(-boxDefaultForce, 0)
        end
        if love.keyboard.isDown('right') then
            stuff.box.body:applyForce(boxDefaultForce, 0)
        end
    end
    -- /box
end

return stuff
