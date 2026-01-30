--[[
LoadPackage Module
Responsible for loading and merging package modules into the Registry.
It ensures that core packages are loaded first, followed by standard libraries and third-party packages.
Packages are merged into the Registry to provide a unified interface for accessing package functionalities.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local Include = RbxPI:WaitForChild("Include")
local Internal = Include:WaitForChild("Internal")

local InternalPackageRegistry = require(Internal.InternalPackageRegistry)
local ErrorHandler = require(Include.ErrorHandler)

local LoadPackage = {}

-- Helper function to merge tables
local function mergeInto(target, source)
    for key, value in pairs(source) do
        target[key] = value
    end
end

-- Load packages into the Registry
function LoadPackage.load(packages)
    local function loadFrom(container)
        for index, value in pairs(container) do
            if container == packages._core then
                InternalPackageRegistry[index] = value
            else
                InternalPackageRegistry[index] = {}
                for _, category in pairs(value) do
                    if type(category) == "table" then
                        mergeInto(InternalPackageRegistry[index], category)
                    else
                        mergeInto(InternalPackageRegistry[index], require(category))
                    end
                end
            end
        end
    end

    local result, err = pcall(function()
        for _, container in pairs(packages) do
            loadFrom(container)
        end
    end)

    if not result then
        ErrorHandler.LoaderException.PackageLoadFailed(err)
    end
end

return LoadPackage