--[[
Entry Point of the RbxPI Loading System

This module provides loading utilities for the RbxPI.
It includes function for loading assets, modules, and other resources.

Packages should be placed in `ReplicatedStorage.RbxPI.Packages` for better organization and automatic loading.

Copyright 2026 BlockGuard Software Foundation
Licensed under the Apache License, Version 2.0
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

For more information, visit:
https://github.com/rbxpi/rbxpi-core
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local Include = RbxPI:WaitForChild("Include")
local Internal = Include:WaitForChild("Internal")

local ErrorHandler = require(Include.ErrorHandler)
local InternalLoader = require(Internal.InternalLoader)
local PackageScanner = require(Internal.PackageScanner)
local Validator = require(Internal.Validator)
local LoadPackage = require(Internal.LoadPackage)

local Bootstrap = {}

-- Different states of the bootstrap :
----------------------------------------------
-- init     :   in the initialization phase
-- booting  :   in the process of booting
-- ready    :   the process is complete
Bootstrap.__state = "init"
Bootstrap.__packages = {
    _core = {},         -- Critical system packages (loaded FIRST)
    _stdlib = {},       -- Standard utility packages (loaded SECOND)
    _thirdparty = {}    -- External or optional packages (loaded LAST)
}

setmetatable(Bootstrap, {
    __index = function(_, key: string): string
        return ErrorHandler.BootstrapException.KeyNotExist(key)
    end
})

function Bootstrap.init(): boolean
    if Bootstrap.__state ~= "init" then
        return ErrorHandler.BootstrapException.AlreadyInitialized()
    end

    Bootstrap.__state = "booting"

    Bootstrap.__packages._core = InternalLoader.init()
    local Packages = PackageScanner.scan()
    Bootstrap.__packages._stdlib, Bootstrap.__packages._thirdparty = Validator.check(Packages)

    LoadPackage.load(Bootstrap.__packages)

    Bootstrap.__state = "ready"

    return true
end

return Bootstrap