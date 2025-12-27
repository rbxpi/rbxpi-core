local Module = {}
Module.__index = Module

function Module.new()      
    local self = setmetatable({}, Module)
    print("Hello, World!")
    return self
end

return Module
