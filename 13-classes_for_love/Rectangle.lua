local class = require 'class'

Rectangle = class{
    init = function(self,
        world,
        center_x, center_y,
        width, height,
        static,
        r, g, b, opacity,
        friction, restitution
    )
        self.world = world
        self.center_x = center_x
        self.center_y = center_y
        self.width = width
        self.height = height
        self.static = static or false
        self.friction = friction or 0.7
        self.restitution = restitution or 0.4

        if self.static then self.body = love.physics.newBody(world, center_x, center_y)
        else self.body = love.physics.newBody(world, center_x, center_y, 'dynamic')
        end
        self.shape = love.physics.newRectangleShape(width, height)
        self.fixture = love.physics.newFixture(self.body, self.shape)
        self.fixture:setRestitution(self.restitution)
        self.fixture:setFriction(self.friction)

        self.r = r or 1
        self.g = g or 1
        self.b = b or 1
        self.opacity = opacity or 1
    end,

    draw = function(self)
        love.graphics.setColor(self.r, self.g, self.b, self.opacity)
        love.graphics.polygon(
            'fill',
            self.body:getWorldPoints(self.shape:getPoints())
        )
    end
}

return Rectangle