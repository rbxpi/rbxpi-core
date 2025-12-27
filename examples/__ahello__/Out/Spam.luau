local Spam = {}
Spam.__index = Spam

function Spam.new()      
    local self = setmetatable({}, Spam)
    print("Hello, World!")
    return self
end

return Spam