--[[
Internal API for Roblox Package Index
This module provides essential metadata and licensing information for the RbxPI Library.
It includes functions to retrieve the library's version, author, and license details.
Additionally, it serves as a reference for the Apache-2.0 license under which the library is distributed.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local Version = RbxPI:WaitForChild("Version")
local LICENSE = require(RbxPI.LICENSE)

local InternalAPI = {
    version = Version.Value,
    author = "BlockGuard Software Foundation",
    license = LICENSE[1],
    copyright = "Copyright 2026 BlockGuard Software Foundation",
    url = "https://github.com/rbxpi/rbxpi-core",
    licenseinfo = LICENSE[1]
}

return InternalAPI