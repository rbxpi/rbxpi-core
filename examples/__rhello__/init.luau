--[[
__rhello__ package for Luau. Based on Lua syntax version 5.1 and its comments.
Copyright (C) 2026 BlockGuard Software Foundation. All Rights Reserved.
Licensed under the MIT License. See LICENSE file in the project root for license information.

This package provides a simple "Hello, World!" functionality as an example package for the RbxPI library.
]]

local LICENSE = require(script.LICENSE)

return {
    Name = "__rhello__",
    Version = {1, 0, 0, 'final', 0},
    Description = "A simple example of a package.",
    Main = "Out/Index.luau",
    Author = "RbxPI (https://github.com/rbxpi)",
    License = {LICENSE[1], LICENSE[2]},
    Repository = "https://github.com/rbxpi/rbxpi-core/tree/master/examples/__rhello__",
    Dependencies = {}, -- or {"Package1", "Package2"}
}
