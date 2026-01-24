---
title: Hello World
createTime: 2026/01/19 19:20:46
permalink: /fr/examples/hello-world
---

::: code-tree title="Structure du Paquet" height="675px" entry="votrepaquet/Out/Index.luau"

```luau title="votrepaquet/Out/Index.luau"
local Module = {}
Module.__index = Module

function Module.new()      
    local self = setmetatable({}, Module)
    print("Hello, World!")
    return self
end

return Module

```

:::
