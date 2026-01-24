---
title: Auto-Completion
createTime: 2026/01/24 13:11:30
permalink: /guide/features/autocomplete/
---

## Overview

Auto-completion is a key feature of RbxPI.
Without it, you would be forced to browse through every package to find the functions that might be useful to you.
Thanks to auto-completion, every package, function, and variable is indexed, allowing for considerable time savings.

::: warning

Only packages present in the RbxPI [standard library](/api/intro#standard-library) are indexed in the API and can, therefore, benefit from auto-completion.

:::

## Usage

To benefit from auto-completion, simply [import the RbxPI API](/guide/essentials/import-package#api-import) into your code.
This feature is available regardless of the installation method used.

::: note This feature works equally well on both the server and client sides.
:::


::: code-tabs

@tab script.server.luau
```luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local API = require(RbxPI.API)
```

:::

After importing the API, simply call it to benefit from auto-completion.

::: code-tabs

@tab script.server.luau
```luau
local versionInfo = API.version
```

:::

## Configuration

::: warning

This API is not representative of the actual RbxPI API; it is provided for example purposes only.

:::

::: code-tabs

@tab ReplicatedStorage/RbxPI/API.luau
```luau
local API = {}:: {
    --[[
    This format indicates the export of a variable:

    `version` is the variable name
    `string` indicates the value type

    API.version
    ]]
    version: string,
    --[[
    Package Export

    API.__rhello__
    ]]
    __rhello__: {
        --[[
        This format indicates the export of a function containing arguments but returning no value:

        `helloworld`: name of the function
        `message: string`: expected string argument
        `nil`: returned value

        API.__rhello__.helloworld("Hello World!")
        ]]
        helloworld: (message: string) -> nil,

        --[[
        This format indicates the export of a function that does not expect any arguments but returns a value

        `eggs` : name of the function
        `()` : expected arguments, none in this case
        `string` : returned value

        local contenu = API.__rhello__.eggs()
        ]]
        eggs: () -> { string },
    }
}
```
:::

## Notes

If you use packages that are not part of the RbxPI standard library, you can extend your API by exposing the functions and variables defined by their creators.

::: caution

If a package requires more than a simple API extension, such as code modification, file deletion, or any other intrusive action, it is strongly discouraged to proceed with its installation.

:::