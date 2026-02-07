---
title: Métadonnée
createTime: 2026/01/19 19:03:04
permalink: /fr/examples/metadata
---

::: code-tree title="Structure du Paquet" height="600px" entry="votrepaquet/init.luau"

```luau title="votrepaquet/init.luau"
--[[
__rhello__ package for Luau. Based on Lua syntax version 5.1 and its comments.
Copyright (C) 2025 RbxPI. All Rights Reserved.
Licensed under the MIT License. See LICENSE file in the project root for license information.

This package provides a simple "Hello, World!" functionality as an example package for the RbxPI library.
]]

local LICENSE = require(script.LICENSE)

return {
    Name = "__rhello__",
    Version = {1, 0, 0, 'final', 0},
    Description = "A simple example of a package.",
    Main = "out/index.luau",
    Author = "BlockGuard Software Foundation (https://github.com/blockguard-sf)",
    License = {LICENSE[1], LICENSE[2]},
    Repository = "https://github.com/rbxpi/rbxpi-core/tree/master/examples/__rhello__",
    Dependencies = {}, -- or {"Package1", "Package2"}
}

```

:::