---
title: Hello World
createTime: 2026/01/19 19:20:46
permalink: /examples/hello-world
---

::: code-tree title="Package Structure" height="675px" entry="yourpackage/Out/Index.luau"

```luau title="yourpackage/Out/Index.luau"
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
