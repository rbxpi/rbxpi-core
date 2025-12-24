--[[
AsPI internal loader

This module is responsible for initializing and exposing the internal API of AsPI.
It loads core internal systems and binds them to the bootstrap environment,
making internal utilities available before any external package is loaded.

This module is executed during the early bootstrap phase and should not depend
on user-defined or third-party packages.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AsPI = ReplicatedStorage:WaitForChild("AsPI")

local Include = AsPI:WaitForChild("Include")
local Internal = Include:WaitForChild("Internal")

local InternalAPI = require(Internal.InternalAPI)

local InternalLoader = {}

function InternalLoader.init(Bootstrap): ()
    Bootstrap.__internal = InternalAPI
end

return InternalLoader