--[[
Roblox Package Index Error Handling

This module provides error handling utilities for the RbxPI.
It includes function for logging errors, displaying error messages, and handling errors gracefully.
]]

local ErrorHandler = {}
ErrorHandler.__runtimeErrors = {
    API = {
        PackageNotFound = 1,
        BootstrapError = 2,
    },

    Bootstrap = {
        KeyNotExist = 101,
        AlreadyInitialized = 102
    }
}

ErrorHandler.__loadingErrors = {
    Registry = {
        DuplicatePackage = 201,
    },

    PackageAnalyzer = {
        MetadataNotFound = 301,
        MissingMetadataField = 302,
        LicenseFormatInvalid = 303,
        InvalidPath = 304,
        MetadataLoadFailed = 305,
        InvalidName = 306,
        InvalidDependency = 307,
        VersionFormatInvalid = 308,
        InvalidMetadataFormat = 309
    },

    Dependencies = {
        InvalidDependency = 401,
    },

    Loader = {
        PackageLoadFailed = 501,
    }
}

export type ErrorCode = number
export type ErrorLevel = "WARN" | "ERROR"

type ErrorContext = {
    Code: ErrorCode,
    Level: ErrorLevel,
    Message: string
}

local function formatMessage(context: ErrorContext): string
    return string.format("[RbxPI:%03d][%s] %s", context.Code, context.Level, context.Message)
end

local function throw(context: ErrorContext)
    local message = formatMessage(context)

    if context.Level == "WARN" then
        warn(message)
    else
        error(message, 2) -- stack level propre
    end
end

ErrorHandler.APIException = {}

function ErrorHandler.APIException.PackageNotFound(packageName: string)
    throw({
        Code=ErrorHandler.__runtimeErrors.API.PackageNotFound,
        Level="WARN",
        Message=("Package '%s' does not exist in the API."):format(packageName)
    })
end

function ErrorHandler.APIException.BootstrapError()
    throw({
        Code=ErrorHandler.__runtimeErrors.API.BootstrapError,
        Level="ERROR",
        Message="An error occurred during API bootstrap."
    })
end

ErrorHandler.BootstrapException = {}

function ErrorHandler.BootstrapException.KeyNotExist(key: string)
    throw({
        Code=ErrorHandler.__runtimeErrors.Bootstrap.KeyNotExist,
        Level="WARN",
        Message=("Missing loader key '%s'."):format(key),
    })
end

function ErrorHandler.BootstrapException.AlreadyInitialized()
    throw({
        Code=ErrorHandler.__runtimeErrors.Bootstrap.KeyNotExist,
        Level="WARN",
        Message="Bootstrap has already been initialized."
    })
end

ErrorHandler.RegistryException = {}

function ErrorHandler.RegistryException.DuplicatePackage(packageName: string)
    throw({
        Code=ErrorHandler.__loadingErrors.Registry.DuplicatePackage,
        Level="WARN",
        Message=("Duplicate package '%s' detected."):format(packageName)
    })
end

ErrorHandler.AnalyzerException = {}

function ErrorHandler.AnalyzerException.MetadataNotFound(packageName: string)
    throw({
        Code=ErrorHandler.__loadingErrors.PackageAnalyzer.MetadataNotFound,
        Level="WARN",
        Message=("Package '%s' does not contain metadata."):format(packageName)
    })
end

function ErrorHandler.AnalyzerException.MissingMetadataField(packageName: string, field: string)
    throw({
        Code=ErrorHandler.__loadingErrors.PackageAnalyzer.MissingMetadataField,
        Level="WARN",
        Message=("Package '%s' is missing metadata field '%s'."):format(packageName, field)
    })
end

function ErrorHandler.AnalyzerException.InvalidMetadataFormat(packageName: string, field: string)
    throw({
        Code=ErrorHandler.__loadingErrors.PackageAnalyzer.InvalidMetadataFormat,
        Level="WARN",
        Message=("Package '%s' has an invalid metadata field : '%s'."):format(packageName, field)
    })
end

function ErrorHandler.AnalyzerException.LicenseFormatInvalid(packageName: string)
    throw({
        Code=ErrorHandler.__loadingErrors.PackageAnalyzer.LicenseFormatInvalid,
        Level="WARN",
        Message=("Package '%s' has an invalid license format."):format(packageName)
    })
end

function ErrorHandler.AnalyzerException.InvalidPath(packageName: string, filePath: string)
    throw({
        Code=ErrorHandler.__loadingErrors.PackageAnalyzer.InvalidPath,
        Level="WARN",
        Message=("Path '%s' is invalid in the package %s."):format(filePath, packageName)
    })
end

function ErrorHandler.AnalyzerException.MetadataLoadingFailed(packageName: string)
    throw({
        Code=ErrorHandler.__loadingErrors.PackageAnalyzer.MetadataLoadFailed,
        Level="WARN",
        Message=("Failed to load metadata for the package %s."):format(packageName)
    })
end

function ErrorHandler.AnalyzerException.InvalidName(packageName: string, metadataName: string)
    throw({
        Code=ErrorHandler.__loadingErrors.PackageAnalyzer.InvalidName,
        Level="WARN",
        Message=("Package name '%s' does not match the metadata name %s."):format(packageName, metadataName)
    })
end

function ErrorHandler.AnalyzerException.InvalidDependency(packageName: string)
    throw({
        Code=ErrorHandler.__loadingErrors.PackageAnalyzer.InvalidDependency,
        Level="WARN",
        Message=("Path '%s' has an invalid dependency."):format(packageName)
    })
end

function ErrorHandler.AnalyzerException.VersionFormatInvalid(packageName: string)
	throw({
        Code=ErrorHandler.__loadingErrors.PackageAnalyzer.VersionFormatInvalid,
        Level="WARN",
        Message=("Path '%s' has an invalid dependency."):format(packageName)
    })
end

ErrorHandler.DependencyException = {}

function ErrorHandler.DependencyException.InvalidDependency(packageName)
    throw({
        Code=ErrorHandler.__loadingErrors.Dependencies.InvalidDependency,
        Level="WARN",
        Message=("Invalid version format in '%s'."):format(packageName)
    })
end

ErrorHandler.LoaderException = {}

function ErrorHandler.LoaderException.PackageLoadFailed(packageName: string)
    throw({
        Code=ErrorHandler.__loadingErrors.Loader.PackageLoadFailed,
        Level="WARN",
        Message=("Failed to load package '%s'."):format(packageName)
    })
end

return ErrorHandler
