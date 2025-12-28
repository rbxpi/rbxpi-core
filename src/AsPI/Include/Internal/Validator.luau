--[[
AsPI Internal Validator
This module provides validation utilities for packages in the Astral Package Index (AsPI).
It includes functions for validating package metadata, dependencies, and file paths.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AsPI = ReplicatedStorage:WaitForChild("AsPI")

local Include = AsPI:WaitForChild("Include")
local Internal = Include:WaitForChild("Internal")

local ErrorHandler = require(Include.ErrorHandler)
local ResolvePath = require(Internal.ResolvePath)
local Dependencies = require(Internal.Dependencies)

local Validator = {}
Validator.__stdlib = {}
Validator.__thirdparty = {}

local function isValidMetadata(instance: Instance): {[any]: any} | false
    local metadata = require(instance)
    if type(metadata) ~= "table" then
        ErrorHandler.ValidatorException.MetadataNotFound(instance.Name)
        return false
    end

    local requiredFields = {
        "Name",
        "Version",
        "Description",
        "Main",
        "Author",
        "License",
        "Repository",
        "Dependencies"
    }

    for _, field in ipairs(requiredFields) do
        if metadata[field] == nil or metadata[field] == "" then
            ErrorHandler.ValidatorException.MissingMetadataField(instance.Name, field)
            return false
        end
    end

    return metadata
end

function Validator.check(packages: {[number]: any})
    for _name, instance in pairs(packages) do
        local metadata = isValidMetadata(instance)
        if not metadata then
            continue
        end

        if #metadata.License ~= 2 then
            ErrorHandler.ValidatorException.LicenseFormatInvalid(instance.Name)
            return false
        end

        local mainPath = ResolvePath.resolve(instance.Name, instance, metadata.Main)
        if not mainPath then
            return false
        end

        if metadata.Dependencies == nil or #metadata.Dependencies == 0 then
            Validator.__stdlib[metadata.Name] = mainPath
        elseif Dependencies.check(instance.Name, metadata.Dependencies) then
            Validator.__thirdparty[metadata.Name] = mainPath
        else
            return false
        end
    end

    return Validator.__stdlib, Validator.__thirdparty
end

return Validator