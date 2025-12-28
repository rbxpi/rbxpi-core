--[[
RbxPI internal loader

This module is responsible for initializing and exposing the internal API of RbxPI.
It loads core internal systems and binds them to the bootstrap environment,
making internal utilities available before any external package is loaded.

This module is executed during the early bootstrap phase and should not depend
on user-defined or third-party packages.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local Include = RbxPI:WaitForChild("Include")
local Internal = Include:WaitForChild("Internal")

local InternalAPI = require(Internal.InternalAPI)

local InternalLoader = {}

function InternalLoader.init(): ()
    return InternalAPI
end

return InternalLoader