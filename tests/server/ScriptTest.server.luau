local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RbxPI = ReplicatedStorage:WaitForChild("RbxPI")

local API = require(RbxPI.API) 

local __rhello__ = API.__rhello__

print(__rhello__.Version)