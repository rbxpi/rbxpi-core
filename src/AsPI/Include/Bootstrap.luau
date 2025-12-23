--[[
Entry Point of the AsPI Loading System

This module provides loading utilities for the AsPI.
It includes function for loading assets, modules, and other resources.

Packages should be placed in `ReplicatedStorage.AsPI.Packages` for better organization and automatic loading.

Copyright 2025 Astral Interactive Games
Licensed under the Apache License, Version 2.0
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

For more information, visit:
https://github.com/Astral-Interactive-Games/aspi
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AsPI = ReplicatedStorage:WaitForChild("AsPI")

local Include = AsPI:WaitForChild("Include")

local ErrorHandler = require(Include.ErrorHandler)

local Bootstrap = {}

-- Different states of the bootstrap :
----------------------------------------------
-- init     :   in the initialization phase
-- booting  :   in the process of booting
-- ready    :   the process is complete

Bootstrap.__state = "init"
Bootstrap.__packages = {}

setmetatable(Bootstrap, {
    __index = function(_, key: string): string
        return ErrorHandler.BootstrapException.KeyNotExist(key)
    end
})

function Bootstrap.init()
    if Bootstrap.__state ~= "init" then
        ErrorHandler.BootstrapException.AlreadyInitialized()
    end

    Bootstrap.__state = "booting"
end

return Bootstrap