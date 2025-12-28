--[[
This module provides a function for checking package dependencies.
It returns true if all dependencies are met, and false otherwise.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AsPI = ReplicatedStorage:WaitForChild("AsPI")

local Lib = AsPI:WaitForChild("Lib")
local Include = AsPI:WaitForChild("Include")

local ErrorHandler = require(Include.ErrorHandler)

local Dependencies = {}

function Dependencies.check(packageName: string, packageDependencies)
    local notFound = packageDependencies
    for _, dependency in pairs(packageDependencies) do
        for index, package in pairs(Lib:GetChildren()) do
            if package.Name == dependency then
                table.remove(notFound, index)
                break
            end
        end
    end

    if #notFound > 0 then
        for _, dependency in ipairs(packageDependencies) do
            ErrorHandler.DependenciesExceptions.InvalidDependency(packageName, dependency)
        end
        return false
    end
    
    return true
end

return Dependencies