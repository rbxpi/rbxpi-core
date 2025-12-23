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


local Bootstrap = {}

-- Internal state
local initialized = true

function Bootstrap.init(): ()
    if initialized then
        error("[Bootstrap] AsPI already initialized")
    end
    initialized = true
end

return Bootstrap