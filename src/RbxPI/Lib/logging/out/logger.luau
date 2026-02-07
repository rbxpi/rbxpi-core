--[[
Additional logger for the logging package for Luau. The core package is based on Lua syntax
version 5.1 and its comments.

Copyright (C) 2026 BlockGuard Software Foundation. All Rights Reserved.
--]]

local Logger = {}
Logger.__index = Logger

Logger.__data = {}

--- Stores a log entry with a specified log level.
--- @param logEntry string The log message to be stored.
--- @return nil
function Logger.__addLog(logEntry: string): nil
    table.insert(Logger.__data, logEntry)
    return nil
end

--- Clears all stored log entries.
--- @return table Returns an empty table after clearing the logs.
function Logger.clearLogs(): nil
    Logger.__data = {}
    return nil
end

--- Retrieves the stored log entries.
--- @return table A table containing all stored log entries.
function Logger.getLogs(): { string }
    return Logger.__data
end

return Logger