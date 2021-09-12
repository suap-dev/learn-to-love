local window = require('window')

function love.load()
    width, height = window.setUp()
    m = height/8
    g = 9.81 * m
    world = love.physics.newWorld(0, g, false)
    love.physics.setMeter(m)
    
    ground = {}
    ground.height = height/10
    ground.color = {185/255, 180/255, 171/255}
    ground.body    = love.physics.newBody(world, width/2, height - height/20)
    ground.shape   = love.physics.newRectangleShape(width, ground.height)
    ground.fixture = love.physics.newFixture(ground.body, ground.shape)
    ground.fixture:setFriction(1)

    ball = {}
    ball.radius = height / 12
    ball.body = love.physics.newBody(world, width/2, height/2, 'dynamic')
    ball.shape = love.physics.newCircleShape(ball.radius)
    ball.fixture = love.physics.newFixture(ball.body, ball.shape)
    ball.fixture:setFriction(0.8)
    ball.fixture:setRestitution(0.4)
    
    infoState = {}
    infoState[true] = "contact!"
    infoState[false] = "no contact :("
end

function love.update(dt)
    world:update(dt)
    contacts = world:getContacts()

    if contacts[1] and love.keyboard.isDown('space') then
        ball.body:applyLinearImpulse(0, -g/5)
    end

    if love.keyboard.isDown('r') then
        love.event.quit("restart")
    end
end

function love.draw()
    love.graphics.setColor(ground.color)
    love.graphics.polygon(
        'fill',
        ground.body:getWorldPoints(ground.shape:getPoints())
    )

    love.graphics.setColor(0.780, 0.156, 0.941)
    love.graphics.circle(
        'fill',
        ball.body:getX(), ball.body:getY(),
        ball.shape:getRadius()
    )

    love.graphics.setColor(1,1,1,0.6)
    for i,contact in pairs(contacts) do
        love.graphics.print(i .. " - " .. infoState[contact:isTouching()], 10, i*12)
    end
end