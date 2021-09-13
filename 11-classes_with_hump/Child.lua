require 'Person'

Child = Class{
    __includes = Person,
    init = function(self, name, age, parent_name)
        Person.init(self, name, age)
        self.parent_name = parent_name
    end,
    __tostring = function(self)
        return Person.__tostring(self) .. " I'm a child of " .. self.parent_name .. "."
    end

}