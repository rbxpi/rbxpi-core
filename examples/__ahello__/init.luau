--[[
__ahello__ package for Luau. Based on Lua syntax version 5.1 and its comments.
Copyright (C) 2025 Astral Interactive Games. All Rights Reserved.
Licensed under the MIT License. See LICENSE file in the project root for license information.

This package provides a simple "Hello, World!" functionality as an example package for the AsPI library.
]]

local LICENSE = require(script.LICENSE)

return {
    Name = "__ahello__",
    Version = "1.0.0",
    Description = "A simple example of a package.",
    Main = "Out/Index.luau",
    Author = "Astral Interactive Games (https://github.com/Astral-Interactive-Games)",
    License = {LICENSE[1], LICENSE[2]},
    Repository = "https://github.com/Astral-Interactive-Games/aspi/tree/master/examples/__ahello__",
    Dependencies = {}, -- or {"Package1", "Package2"}
}
