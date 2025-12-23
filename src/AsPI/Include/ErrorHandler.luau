--[[
AsPI error handling

This module provides error handling utilities for the AsPI.
It includes function for logging errors, displaying error messages, and handling errors gracefully.
]]

-- ErrorHandler
local ErrorHandler = {}

-- Main category of exceptions
ErrorHandler.BootstrapException = {}

function ErrorHandler.BootstrapException.KeyNotExist(key: string): ()
    return warn ("The key '" .. key .. "' does not exist in the Loader.")
end

function ErrorHandler.BootstrapException.AlreadyInitialized(): ()
    return error ("The AsPI bootstrap has already been initialized.")
end

return ErrorHandler