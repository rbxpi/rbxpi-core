--[[
Astral Package Index API Module

This module provides the API for the AsPI.
It includes functions and services for interacting with the library's features.

Usage :
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local AsPI = ReplicatedStorage:WaitForChild("AsPI")

    local API = require(AsPI.API)

    local package = API.PackageName

Copyright 2025 Astral Interactive Games
Licensed under the Apache License, Version 2.0
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

For more information, visit:
https://github.com/Astral-Interactive-Games/aspi
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AsPI = ReplicatedStorage:WaitForChild("AsPI")

local Include = AsPI:WaitForChild("Include")
local Internal = Include:WaitForChild("Internal")

local ErrorHandler = require(Include.ErrorHandler)
local Bootstrap = require(Include.Bootstrap)
local Registry = require(Internal.Registry)

-- Helper function to handle package retrieval
local function handler(key: any): any
    return Registry[key]
end

--[[ API Implementation ]]
-- This section contains the implementation details for the API.
-- It is responsible for defining the functions and services exposed by the API.
-- These may include utility functions, data structures, and other components.
-- Please do not modify this file directly.
local API = {}:: {}

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
