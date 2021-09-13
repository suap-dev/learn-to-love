Class = require "class"

Person = Class{
    init = function(self, name, age)
        self.name = name
        self.age = age
    end,

    __tostring = function(self)
        return "My name is " .. self.name ..". I'm " .. self.age .. " years old."
    end,
}

return Person