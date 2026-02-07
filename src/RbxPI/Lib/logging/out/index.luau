--[[
logging package for Luau. Based on Lua syntax version 5.1 and its comments.
Copyright (C) 2026 BlockGuard Software Foundation. All Rights Reserved.
Licensed under the MIT License. See LICENSE file in the project root for license information.
]]

local RunService = game:GetService("RunService")

local Handlers = require(script.Parent:FindFirstChild("handlers"))
local Logger = require(script.Parent:FindFirstChild("logger"))

local Module = {}
Module.__index = Module

-- Parameters for the logging module (you can modify these as needed)
Module.__threshold = Handlers.getLevel("INFO")
Module.__autoDebug = true
Module.__logger = true

Module.__debug = if Module.__autoDebug and RunService:IsStudio() then true else false 
Module.__debugLevel = Handlers.getLevel("DEBUG")

-- Expose Handlers and Logger methods if needed
Module.getLevel = Handlers.getLevel
Module.addLevel = Handlers.addLevel
Module.removeLevel = Handlers.removeLevel
Module.getLogs = Logger.getLogs
Module.clearLogs = Logger.clearLogs

--- Determines the execution context (server or client).
local function __getExecutionContext(): string
    return if RunService:IsServer() then "SERVER" else "CLIENT"
end

local function __processLog(message: string, executionContext: string, logLevel: string, callerInfo: { scriptObject: string, lineNumber: number, rawTrace: string }): string
    return Handlers.__construct(message, executionContext, logLevel, callerInfo) or "Log process failed."
end

--- Generic style logs a message with a specified log level, applying filtering and formatting rules.
--- @param message string The log message to be processed.
--- @param level string The name of the log level.
--- @return nil
function Module.log(message: string, level: string): nil
    local executionContext = __getExecutionContext()
    local logLevel = Handlers.getLevel(level)
    local callerInfo = {
        scriptObject = debug.info(2, "s"),
        lineNumber = debug.info(2, "l"),
        rawTrace = debug.traceback("", 2)
    }

    -- If debugging is disabled and the log level matches the debug level, return false
    if not Module.__debug and logLevel.index == Module.__debugLevel.index then return nil end 
    
    -- Process and print logs if they meet the required threshold
    if logLevel.index >= Module.__threshold.index or logLevel.index == Module.__debugLevel.index then
        local logEntry = __processLog(message, executionContext, level, callerInfo)
        if table.find(logLevel.flags, "canWarn") then 
            warn(logEntry) -- Use warn for warnings and errors
        else
            print(logEntry) -- Use print for other log levels
        end

        if Module.__logger then 
            Logger.__addLog(logEntry)
        end
    end

    return nil
end

--- Configures the logging module with specified settings.
--- @param configTable { threshold: string?, autoDebug: boolean?, logger: boolean? } A table containing configuration options for the logging module.
--- @return nil
function Module.config(configTable: { threshold: string?, autoDebug: boolean?, logger: boolean? }): nil
    if configTable.threshold then
        local newThreshold = Handlers.getLevel(configTable.threshold)
        if newThreshold then
            Module.__threshold = newThreshold
        else
            warn("Invalid log level for threshold: " .. configTable.threshold)
        end
    end

    if configTable.autoDebug ~= nil then
        Module.__autoDebug = configTable.autoDebug
        Module.__debug = if Module.__autoDebug and RunService:IsStudio() then true else false 
    end

    if configTable.logger ~= nil then
        Module.__logger = configTable.logger
    end

    return nil
end

for name, _ in pairs(Handlers.getLevel()) do
    Module[string.lower(name)] = function(message: string): ()
        Module.log(message, name)
    end
end

return Module