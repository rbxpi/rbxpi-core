--[[
RbxPI Internal PackageAnalyzer
This module provides validation utilities for packages in the Astral Package Index (RbxPI).
It includes functions for validating package metadata, dependencies, and file paths.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local Include = RbxPI:WaitForChild("Include")
local Internal = Include:WaitForChild("Internal")

local ErrorHandler = require(Include.ErrorHandler)
local Versionning = require(Include.Versionning)

local ResolvePath = require(Internal.ResolvePath)
local DependencyValidator = require(Internal.DependencyValidator)

local PackageAnalyzer = {}
PackageAnalyzer.__rootPackages = {}
PackageAnalyzer.__dependentPackages = {}

-- Helper function to load metadata safely
local function loadMetadataSafely(instance: ModuleScript): nil
    if instance:IsA("ModuleScript") then
        local result, metadata = pcall(function()
            return require(instance)
        end)

        if result then return metadata end
    end

    ErrorHandler.AnalyzerException.MetadataLoadingFailed(instance.Name)
    return nil
end

-- Helper function to validate metadata format
local function isValidMetadataFormat(metadata, instance: ModuleScript): boolean
    if type(metadata) ~= "table" then
        ErrorHandler.AnalyzerException.MetadataNotFound(instance.Name)
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
            ErrorHandler.AnalyzerException.MissingMetadataField(instance.Name, field)
            return false
        end
    end

    return true
end

-- Check if the metadata fields have a valid type
local function isValidMetadataSchema(metadata, instance): boolean
    local tableFields = {"Version", "License", "Dependencies"}
    local tableFieldSet = {}
    for _, field in ipairs(tableFields) do
        tableFieldSet[field] = true
    end

    for field, content in pairs(metadata) do
        local isTableField = tableFieldSet[field]
        local expectedType = isTableField and "table" or "string"

        if typeof(content) ~= expectedType then
            ErrorHandler.AnalyzerException.InvalidMetadataFormat(instance.Name, field)
            return false
        end
    end
    return true
end

-- Helper function to validate metadata content
local function isValidMetadataContent(metadata, instance)
    if metadata.Name ~= instance.Name then 
        ErrorHandler.AnalyzerException.InvalidName(instance.Name, metadata.Name)
        return false
    end
    
    if #metadata.License ~= 2 then
        ErrorHandler.AnalyzerException.LicenseFormatInvalid(metadata.Name) 
        return false
    end

    return true
end

-- Helper function to categorize packages
local function ClassifyPackageDependencies(metadata, mainPath)
    local dependencies = metadata.Dependencies
    local content = {mainPath, metadata}

    if #dependencies == 0 then
        PackageAnalyzer.__rootPackages[metadata.Name] = content
        return true
    end

    local isValidDependencies = DependencyValidator.validate(metadata.Name, dependencies)
    if isValidDependencies then
        PackageAnalyzer.__dependentPackages[metadata.Name] = content
        return true
    end

    return false
end

-- Main validate function
function PackageAnalyzer.analyze(packages: {[number]: any})
    for _, instance in pairs(packages) do
        local metadata = loadMetadataSafely(instance)
        if not metadata then continue end

        if not isValidMetadataFormat(metadata, instance) then continue end
        if not isValidMetadataSchema(metadata, instance) then continue end
        if not isValidMetadataContent(metadata, instance) then continue end

        local mainPath = ResolvePath.resolve(metadata.Name, instance, metadata.Main)
        local version = Versionning.getVersion(metadata.Version)

        if not mainPath or not version then
            if not mainPath then 
                ErrorHandler.AnalyzerException.InvalidPath(metadata.Name, metadata.Main) 
            elseif not version then
                ErrorHandler.AnalyzerException.VersionFormatInvalid(metadata.Name) 
            end
            continue
        end
        
        metadata.Version = version
        ClassifyPackageDependencies(metadata, mainPath)
    end

    return PackageAnalyzer.__rootPackages, PackageAnalyzer.__dependentPackages
end

return PackageAnalyzer