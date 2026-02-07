--[[
RbxPI Registry

This module provides the internal registry system for RbxPI.
It is responsible for storing, indexing, and managing registered packages,
their metadata, and their current state during the bootstrap process.

The registry acts as a central source of truth for the internal loader,
package scanner, and validator. It is not part of the public API and must
only be used by internal RbxPI components.
]]

local InternalPackageRegistry = {}

return InternalPackageRegistry
