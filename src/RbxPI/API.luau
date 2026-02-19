--[[
Roblox Package Index API Module

This module provides the API for the RbxPI.
It includes functions and services for interacting with the library's features.

Usage :
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

    local API = require(RbxPI.API)

    local package = API.PackageName

Copyright 2026 BlockGuard Software Foundation
Licensed under the Apache License, Version 2.0
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

For more information, visit:
https://github.com/rbxpi/rbxpi-core
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local Include = RbxPI:WaitForChild("Include")
local Internal = Include:WaitForChild("Internal")

local ErrorHandler = require(Include.ErrorHandler)
local Bootstrap = require(Include.Bootstrap)
local InternalPackageRegistry = require(Internal.InternalPackageRegistry)

-- Helper function to handle package retrieval
local function handler(key: any): any
    return InternalPackageRegistry[key]
end

--[[ API Implementation ]]
-- This section contains the implementation details for the API.
-- It is responsible for defining the functions and services exposed by the API.
-- These may include utility functions, data structures, and other components.
-- Please do not modify this file directly.
local API = {}:: {
    --[Internal API Metadata]----------
    version: string,
    author: string,
    license: string,
    copyright: string,
    url: string,
    licenseinfo: string,

    --[logging API]--------------------
    logging: {
        config: (configTable: { threshold: string?, autoDebug: boolean?, logger: boolean? }) -> nil,
        log: (message: string, level: string) -> nil,
        getLevel: (name: string?) -> { index: number, flags: { string } } | { [string]: { index: number, flags: { string } } },
        addLevel: (name: string, index: number, flags: { string }?, autoFixIndex: boolean?) -> boolean,
        removeLevel: (name: string) -> nil,
        getLogs: () -> { string },
        clearLogs: () -> nil,

        -- Additional logging methods can be added here
        info: (message: string) -> nil,
        warn: (message: string) -> nil,
        error: (message: string) -> nil,
        debug: (message: string) -> nil
        -- ...
    },

    --[versionning API]------------------
    versionning: {
        getVersion: (version: { major: number, minor: number, patch: number, type: string, build: number? }) -> string
    },
}

setmetatable(API, {
    __index = function(_, key: string): any
        if Bootstrap.__state == "init" then 
            local BootstrapResult = Bootstrap.init()
            if not BootstrapResult then
                return ErrorHandler.APIException.BootstrapError()
            end
        end
        return handler(key) or ErrorHandler.APIException.PackageNotFound(key)
    end    
})

return API
