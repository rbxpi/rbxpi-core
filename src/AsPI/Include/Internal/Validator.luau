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

-- Helper function to load metadata safely
local function loadMetadataSafely(instance: Instance)
    local result, metadata = pcall(function()
        return require(instance)
    end)

    if not result then
        ErrorHandler.ValidatorException.MetadataLoadingFailed(instance.Name)
        return nil
    end

    return metadata
end

-- Helper function to validate metadata format
local function isValidMetadataFormat(metadata, instance: Instance): boolean
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

    return true
end

-- Helper function to validate package name
local function isValidName(name: string, instance: Instance): boolean
    if type(name) ~= "string" or name ~= instance.Name then
        ErrorHandler.ValidatorException.InvalidName(instance.Name, name)
        return false
    end
    return true
end

-- Helper function to validate license format
local function isValidLicenseFormat(license, name): boolean
    if type(license) ~= "table" or #license ~= 2 then
        ErrorHandler.ValidatorException.LicenseFormatInvalid(name)
        return false
    end
    return true
end

-- Helper function to validate file paths
local function isValidPath(instance: Instance, path: string): any
    return ResolvePath.resolve(instance.Name, instance, path)
end

-- Helper function to validate metadata content
local function isValidMetadataContent(metadata, instance)
    -- Validate package name
    if not isValidName(metadata.Name, instance) then
        return false
    end

    -- Validate license format
    if not isValidLicenseFormat(metadata.License, metadata.Name) then
        return false
    end

    -- Validate main file path
    if type(metadata.Main) ~= "string" or metadata.Main == "" then
        ErrorHandler.ValidatorException.InvalidPathError(instance.Name, tostring(metadata.Main))
        return false
    end

    local mainPath = isValidPath(instance, metadata.Main)
    if not mainPath then
        return false
    end

    -- Validate dependencies format
    if type(metadata.Dependencies) ~= "table" then
        ErrorHandler.ValidatorException.InvalidDependency(instance.Name)
        return false
    end

    return true, mainPath
end

-- Helper function to categorize packages
local function packageCategorization(metadata, mainPath, instance): boolean
    if #metadata.Dependencies == 0 then
        Validator.__stdlib[metadata.Name] = {mainPath, metadata}
        return true
    elseif Dependencies.check(instance.Name, metadata.Dependencies) then
        Validator.__thirdparty[metadata.Name] = {mainPath, metadata}
        return true
    else
        return false
    end
end

-- Main validation function
function Validator.check(packages: {[number]: any})
    -- Iterate through each package and validate its metadata
    for _, instance in pairs(packages) do
        -- Load metadata safely
        local metadata = loadMetadataSafely(instance)
        if not metadata then
            continue
        end

        -- Validate metadata format
        if not isValidMetadataFormat(metadata, instance) then 
            continue
        end

        -- Validate metadata content
        local metadataContentValid, mainPath = isValidMetadataContent(metadata, instance)
        if not metadataContentValid then
            continue
        end

        -- Categorize package based on dependencies
        if not packageCategorization(metadata, mainPath, instance) then
            continue
        end
    end

    return Validator.__stdlib, Validator.__thirdparty
end

return Validator