--[[
PackageScanner Module
Scans the Lib folder for valid packages and stores them in a table.
This module is used internally by the Bootstrap process to identify
and register available packages.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local Lib = RbxPI:WaitForChild("Lib")
local Include = RbxPI:WaitForChild("Include")

local ErrorHandler = require(Include.ErrorHandler)

local PackageRegistry = {}
PackageRegistry.__packages = {}

local function isValidPackage(instance: any): boolean
    if not instance:IsA("ModuleScript") or not instance.Name:match("^[A-Za-z_]+$") then
        return false
    end
    return true
end

function PackageRegistry.scan(): ()
    for _, child in pairs(Lib:GetChildren()) do
        if not isValidPackage(child) then
            continue
        end

        -- Check for duplicate packages
        if PackageRegistry.__packages[child.Name] == child then
            ErrorHandler.RegistryException.DuplicatePackage(child.Name)
            continue
        end

        PackageRegistry.__packages[child.Name] = child
    end
    return PackageRegistry.__packages
end

return PackageRegistry