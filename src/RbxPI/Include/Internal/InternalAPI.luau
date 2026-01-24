--[[
Internal API for Roblox Package Index
This module provides essential metadata and licensing information for the RbxPI Library.
It includes functions to retrieve the library's version, author, and license details.
Additionally, it serves as a reference for the Apache-2.0 license under which the library is distributed.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local LICENSE = require(RbxPI.LICENSE)

local InternalAPI = {}

InternalAPI.version = RbxPI.Version.Value
InternalAPI.author = "RbxPI"
InternalAPI.license = LICENSE[1]
InternalAPI.copyright = "Copyright 2026 BlockGuard Software Foundation"
InternalAPI.url = "https://github.com/rbxpi/rbxpi-core"
InternalAPI.licenseinfo = LICENSE[2]

return InternalAPI