--[[
logging package for Luau. Based on Lua syntax version 5.1 and its comments.
Copyright (C) 2026 BlockGuard Software Foundation. All Rights Reserved.
Licensed under the MIT License. See LICENSE file in the project root for license information.
]]

local LICENSE = require(script.LICENSE)

return {
    Name = "logging",
    Version = {2, 1, 0, 'final', 0},
    Description = "Logging Description",
    Main = "out/index.luau",
    Author = "BlockGuard Software Foundation (https://github.com/blockguard-sf)",
    License = {LICENSE[1], LICENSE[2]},
    Repository = "https://github.com/rbxpi/rbxpi-core/tree/master/src/RbxPI/Lib/logging",
    Dependencies = {}, -- or {"Package1", "Package2"}
}
