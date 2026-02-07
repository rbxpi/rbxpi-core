--[[
Additional handlers for the logging package for Luau. The core package is based on Lua syntax
version 5.1 and its comments.

Copyright (C) 2026 BlockGuard Software Foundation. All Rights Reserved.
--]]

local Handlers = {}
Handlers.__index = Handlers
Handlers.__levels = {
    ["DEBUG"] = {index = 1, flags = {}},
    ["INFO"] = {index = 2, flags = {}},
    ["WARN"] = {index = 4, flags = {"canWarn"}},
    ["ERROR"] = {index = 5, flags = {"canWarn", "advancedOutput"}},
}
Handlers.__internal = {
    timestamp = os.date,
    formatString = string.format
}

-- IDK why I did this but whatever?
local function __autoFixIndex(): number
    local index = {}
    for _, arg in pairs(Handlers.__levels) do 
        table.insert(index, arg.index)
    end

    table.sort(index)
    for i = 1, #index do 
        if index[i] + 1 ~= index[i + 1] then 
            return index[i] + 1
        end
    end
    return index[#index] + 1
end

local function __isValidLevel(name: string, index: number, autoFixIndex: boolean): { }
    local ValidatedArguments = {}
    for levelName, details in pairs(Handlers.__levels) do
        if levelName == name then 
            warn("Log level name '" .. tostring(name) .. "' already exists.")
            return {nil}
        end

        if details.index == index or index == 0 then
            if autoFixIndex then 
                index = __autoFixIndex()
                ValidatedArguments.index = index
            else 
                warn("Log level index '" .. tostring(index) .. "' already exists.")
                return {nil}
            end
            
        end
    end
    if not ValidatedArguments.index then
        ValidatedArguments.index = index 
    end
    return ValidatedArguments
end

--- Retrieves the details of a specified log level or returns the complete list of log __levels.
--- @param levelName string? The name of the log level to retrieve. If nil, returns all log __levels.
--- @return table The details of the specified log level or the complete list of __levels if no specific level is provided.
function Handlers.getLevel(levelName: string?): { index: number, flags: { string } } | { [string]: { index: number, flags: { string } } }
    if levelName then 
        levelName = string.upper(levelName)
        if type(levelName) == "string" and Handlers.__levels[levelName] then
            return Handlers.__levels[levelName]
        else
            error("Invalid log level: " .. tostring(levelName))
        end
    end
    return Handlers.__levels
end

--- Constructs a formatted log message based on the provided details.
--- @param message string The log message to be formatted.
--- @param executionContext string The origin of the log (e.g., "SERVER" or "CLIENT").
--- @param logLevel string The name of the log level.
--- @param callerInfo table Contains details about the caller, such as scriptObject, lineNumber, and rawTrace.
--- @return string The formatted log message.
function Handlers.__construct(message: string, executionContext: string, logLevel: string, callerInfo: { scriptObject: string, lineNumber: number, rawTrace: string }): string
    local timestamp = Handlers.__internal.timestamp("%Y-%m-%d %H:%M:%S")
    local level = Handlers.getLevel(logLevel)

    if table.find(level.flags, "advancedOutput") then 
        executionContext = if executionContext == "SERVER" then "Script" else "LocalScript"
        return Handlers.__internal.formatString("[%s] %s - %s: \"%s.luau\", Line: %s\n		Message: \"%s\"\n		Stack Trace: %s", 
            logLevel, tostring(timestamp), executionContext, callerInfo.scriptObject, callerInfo.lineNumber, message, callerInfo.rawTrace
        )
    end
    return Handlers.__internal.formatString("[%s] [%s] - %s", tostring(timestamp), executionContext, message)
end

--- Adds a new log level with a specified name, index, and optional settings.
--- @param name string The name of the log level to be added.
--- @param index number The priority index of the log level.
--- @param flags table? A table of optional settings for the log level (e.g., {"canWarn", "advancedOutput"}).
--- @param autoFixIndex boolean Determines whether to automatically adjust invalid __levels (default: true).
--- @return boolean Returns true if the log level was added successfully, false otherwise.
function Handlers.addLevel(name: string, index: number, flags: {string}?, autoFixIndex: boolean?): boolean
    local success, err = pcall(function(): boolean
        name = string.upper(tostring(name))
        autoFixIndex = if autoFixIndex == nil then true else autoFixIndex

        local validated = __isValidLevel(name, index, autoFixIndex)
        if validated[1] ~= nil then 
            Handlers.__levels[name] = { index = validated.index, flags = flags or {} }
            return true
        end
        return false
    end)
    
    if not success then 
        warn("Failed to add log level: " .. tostring(err))
        return false
    end
    return true
end

--- Removes an existing log level by its name.
--- @param name string The name of the log level to be removed.
--- @return table The updated list of log levels after removal.
function Handlers.removeLevel(name: string): nil
    name = string.upper(tostring(name))
    if Handlers.getLevel(name) then 
        Handlers.__levels[name] = nil
    end
    return nil
end

return Handlers