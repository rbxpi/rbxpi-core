--[[
Resolve a path within a given package.
This function takes a package name and a path string, and returns the resolved object if found.
If the package or path is invalid, it returns nil.
]]--

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local Include = RbxPI:WaitForChild("Include")
local ErrorHandler = require(Include:WaitForChild("ErrorHandler"))

local ResolvePath = {}

function ResolvePath.resolve(packageName: string, package: Instance, filePath: string): Instance?
    local pathSegments = {}

    filePath = filePath:gsub("%.luau$", ""):gsub("/", "."):gsub("\\", ".")
    for segment in filePath:gmatch("[^.]+") do
        table.insert(pathSegments, segment)
    end

    local currentObject = package
    for _, part in ipairs(pathSegments) do
        currentObject = currentObject:FindFirstChild(part)
        if not currentObject then
            ErrorHandler.ValidatorException.InvalidPathError(packageName, filePath)
            return nil
        end
    end

    return currentObject
end

return ResolvePath
