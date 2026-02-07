---
title: Import Package
createTime: 2026/01/24 12:58:20
permalink: /guide/essentials/import-package/
---

Importing a package into your code is done in two main steps:

- Importing the RbxPI API into the target script.
- Importing the desired package using this API.

## API Import

The RbxPI API import mechanism has been designed to be simple, intuitive, and accessible to all developers.
It allows for a quick start, regardless of experience level.

```luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local API = require(RbxPI.API)
```

::: details Single-line import

In order to limit code clutter, it is possible to use a more compact form of import, as illustrated below:

```luau
local API = require(game:GetService("ReplicatedStorage"):WaitForChild("RbxPI").API)
```

::: warning

Excessive code reduction can harm optimization and reliability.
The method presented above constitutes the most reliable approach.

:::

## Package Import

To import a package directly into your script, simply call the variable interacting with the API in your code and specify the name of the desired package.

```luau
local VersionRbxPI = API.version
print(VersionRbxPI)
```

## Code Structure

::: tabs
@tab Rojo & GitHub

If you installed RbxPI via [Rojo & GitHub](../quick-start.md#install-via-rojo--github) or [rbxmanager](../quick-start.md#roblox-install-manager), you should obtain a structure similar to the following:

::: code-tree title="RbxPI" height="400px" entry="src/ServerScriptService/script.server.luau"
```luau title="src/ReplicatedStorage/RbxPI/API.luau"
-- RbxPI API Content
```

```luau title="src/ServerScriptService/script.server.luau"
-- Importing the RbxPI API 
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local API = require(RbxPI.API)

-- Importing the Package
local VersionRbxPI = API.version
print(VersionRbxPI)

```

```luau title="src/ServerScriptService/script2.server.luau"
-- Single-line RbxPI API import
local RbxPI = require(game:GetService("ReplicatedStorage"):WaitForChild("RbxPI").API)

-- Importing the Package
local VersionRbxPI = RbxPI.version
print(VersionRbxPI)
```

```json title="default.project.json"
{
    "name": "your-project-name",
    "tree": {
        "$className": "DataModel",
    
        "ReplicatedStorage": {
            "$className": "ReplicatedStorage",
            "$path": "src/ReplicatedStorage/"
        },

        "ServerScriptService": {
            "$className": "ServerScriptService",
            "$path": "src/ServerScriptService/"
        }
    }
}
```

@tab Roblox Studio

If you installed RbxPI via [Roblox Studio](../quick-start.md#install-via-roblox-studio), you should obtain a slightly lighter structure:

::: code-tree title="RbxPI" height="400px" entry="ServerScriptService/script"
```luau title="ReplicatedStorage/RbxPI/API"
-- RbxPI API Content
```

```luau title="ServerScriptService/script"
-- Importing the RbxPI API 
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local API = require(RbxPI.API)

-- Importing the Package
local VersionRbxPI = API.version
print(VersionRbxPI)

```

```luau title="ServerScriptService/script2"
-- Single-line RbxPI API import
local RbxPI = require(game:GetService("ReplicatedStorage"):WaitForChild("RbxPI").API)

-- Importing the Package
local VersionRbxPI = RbxPI.version
print(VersionRbxPI)
```

:::

