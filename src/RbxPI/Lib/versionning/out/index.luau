--[[
versionning package for Luau. Based on Lua syntax version 5.1 and its comments.
Copyright (C) 2026 BlockGuard Software Foundation. All Rights Reserved.
Licensed under the MIT License. See LICENSE file in the project root for license information.
]]

local Module = {}
Module.__index = Module

-- Return a tuple of the package version. 
-- If version argument is non-empty, check for correctness of the tuple provided.
local function getCompleteVersion(version)
    if version ~= nil then
        assert(#version == 5, "Version must contain 5 elements")
        assert(
            version[4] == "alpha"
            or version[4] == "beta"
            or version[4] == "rc"
            or version[4] == "final"
            , "Version type must be one of: alpha, beta, rc, final"
        )
    end
    return version
end

-- Return main version (X.Y[.Z]) from VERSION.
local function getMainVersion(version)
    version = getCompleteVersion(version)
    local parts = if version[3] == 0 then 2 else 3
    local result = {}
    for i = 1, parts do
        table.insert(result, tostring(version[i]))
    end
    return table.concat(result, ".")
end

function Module.getVersion(version: {major: number, minor: number, patch: number, type: string, build: number?}): string
    version = getCompleteVersion(version)

    -- Now build the two parts of the version number:
    -- main = X.Y[.Z]
    -- sub = {a|b|rc}N - for alpha, beta and release-candidate releases
    local main = getMainVersion(version)
    local sub = ""

    if version[4] ~= "final" then
        local mapping = {["alpha"] = "a", ["beta"] = "b", ["rc"] = "rc"}
        sub = mapping[version[4]] .. tostring(version[5])
    end
    return main .. sub
end

return Module
