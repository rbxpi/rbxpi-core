--[[
Roblox Package Index Error Handling

This module provides error handling utilities for the RbxPI.
It includes function for logging errors, displaying error messages, and handling errors gracefully.
]]

local ErrorHandler = {}

ErrorHandler.APIException = {}
function ErrorHandler.APIException.PackageNotFound(PackageName: string): any
    return error("The package '" .. PackageName .. "' does not exist in the API.")
end

function ErrorHandler.APIException.BootstrapError(): any
    return error("An error occurred while initializing the bootstrap.")
end

ErrorHandler.BootstrapException = {}
function ErrorHandler.BootstrapException.KeyNotExist(key: string): ()
    return warn ("The key '" .. key .. "' does not exist in the Loader.")
end

function ErrorHandler.BootstrapException.AlreadyInitialized(): ()
    return error ("The AsPI bootstrap has already been initialized.")
end

ErrorHandler.ScannerException = {}
function ErrorHandler.ScannerException.DuplicatePackage(PackageName: string): ()
    return warn ("The package '" .. PackageName .. "' is already registered in the Package Scanner.")
end

ErrorHandler.ValidatorException = {}
function ErrorHandler.ValidatorException.MetadataNotFound(PackageName: string): ()
    return warn ("The package '" .. PackageName .. "' does not contain valid metadata.")
end

function ErrorHandler.ValidatorException.MissingMetadataField(PackageName: string, FieldName: string): ()
    return warn ("The package '" .. PackageName .. "' is missing the required metadata field: '" .. FieldName .. "'.")
end

function ErrorHandler.ValidatorException.LicenseFormatInvalid(PackageName: string): ()
    return warn ("The package '" .. PackageName .. "' has an invalid license format in its metadata.")
end

function ErrorHandler.ValidatorException.InvalidPathError(PackageName: string, FilePath: string): ()
    return warn ("The path '" .. FilePath .. "' is invalid in the package '" .. PackageName .. "'.")
end

function ErrorHandler.ValidatorException.MetadataLoadingFailed(PackageName: string): ()
    return warn ("Failed to load metadata for the package '" .. PackageName .. "'.")
end

function ErrorHandler.ValidatorException.InvalidName(PackageName: string, MetadataName: string): ()
    return warn ("The package name '" .. PackageName .. "' does not match the metadata name '" .. MetadataName .. "'.")
end

function ErrorHandler.ValidatorException.InvalidDependency(PackageName: string): ()
    return warn ("The package '" .. PackageName .. "' has an invalid dependency.")
end

ErrorHandler.DependenciesExceptions = {}
function ErrorHandler.DependenciesExceptions.InvalidDependency(PackageName: string, DependencyName: string): ()
    return warn ("The package '" .. PackageName .. "' has an invalid or missing dependency: '" .. DependencyName .. "'.")
end

ErrorHandler.LoaderException = {}
function ErrorHandler.LoaderException.PackageLoadFailed(PackageName: string): ()
    return error("Failed to load the package '" .. PackageName .. "'.")
end

return ErrorHandler