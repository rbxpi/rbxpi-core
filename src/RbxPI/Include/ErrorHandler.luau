--[[
Roblox Package Index Error Handling

This module provides error handling utilities for the RbxPI.
It includes function for logging errors, displaying error messages, and handling errors gracefully.
]]

local ErrorHandler = {}

ErrorHandler.APIException = {}
function ErrorHandler.APIException.PackageNotFound(PackageName: string): any
    return error("Error 001: The package '" .. PackageName .. "' does not exist in the API.")
end

function ErrorHandler.APIException.BootstrapError(): any
    return error("Error 002: An error occurred while initializing the bootstrap.")
end

ErrorHandler.BootstrapException = {}
function ErrorHandler.BootstrapException.KeyNotExist(key: string): ()
    return warn ("Error 101: The key '" .. key .. "' does not exist in the Loader.")
end

function ErrorHandler.BootstrapException.AlreadyInitialized(): ()
    return error ("Error 102: The RbxPI bootstrap has already been initialized.")
end

ErrorHandler.ScannerException = {}
function ErrorHandler.ScannerException.DuplicatePackage(PackageName: string): ()
    return warn ("Error 201: The package '" .. PackageName .. "' is already registered in the Package Scanner.")
end

ErrorHandler.ValidatorException = {}
function ErrorHandler.ValidatorException.MetadataNotFound(PackageName: string): ()
    return warn ("Error 301: The package '" .. PackageName .. "' does not contain valid metadata.")
end

function ErrorHandler.ValidatorException.MissingMetadataField(PackageName: string, FieldName: string): ()
    return warn ("Error 302: The package '" .. PackageName .. "' is missing the required metadata field: '" .. FieldName .. "'.")
end

function ErrorHandler.ValidatorException.LicenseFormatInvalid(PackageName: string): ()
    return warn ("Error 303: The package '" .. PackageName .. "' has an invalid license format in its metadata.")
end

function ErrorHandler.ValidatorException.InvalidPathError(PackageName: string, FilePath: string): ()
    return warn ("Error 304: The path '" .. FilePath .. "' is invalid in the package '" .. PackageName .. "'.")
end

function ErrorHandler.ValidatorException.MetadataLoadingFailed(PackageName: string): ()
    return warn ("Error 305: Failed to load metadata for the package '" .. PackageName .. "'.")
end

function ErrorHandler.ValidatorException.InvalidName(PackageName: string, MetadataName: string): ()
    return warn ("Error 306: The package name '" .. PackageName .. "' does not match the metadata name '" .. MetadataName .. "'.")
end

function ErrorHandler.ValidatorException.InvalidDependency(PackageName: string): ()
    return warn ("Error 307: The package '" .. PackageName .. "' has an invalid dependency.")
end

ErrorHandler.DependenciesExceptions = {}
function ErrorHandler.DependenciesExceptions.InvalidDependency(PackageName: string, DependencyName: string): ()
    return warn ("Error 401: The package '" .. PackageName .. "' has an invalid or missing dependency: '" .. DependencyName .. "'.")
end

ErrorHandler.LoaderException = {}
function ErrorHandler.LoaderException.PackageLoadFailed(PackageName: string): ()
    return error("Error 501: Failed to load the package '" .. PackageName .. "'.")
end

return ErrorHandler