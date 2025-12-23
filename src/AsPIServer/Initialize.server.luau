local ReplicatedStorage = game:GetService("ReplicatedStorage")

local AsPI = ReplicatedStorage:WaitForChild("AsPI")
local Bootstrap = require(AsPI.Include.Bootstrap)

Bootstrap.init()
