--[[

]]

local Versionning = {}

local function getCompleteVersion(version)
    -- Return a tuple of the package version. 
    -- If version argument is non-empty, check for correctness of the tuple provided.
    if version ~= nil then
        assert(#version == 5, "Version must contain 5 elements")
        assert(
            version[4] == "alpha"
            or version[4] == "beta"
            or version[4] == "rc"
            or version[4] == "final"
            , "Version type must be one of: alpha, beta, rc, final"
        )
    end
    return version
end

local function getMainVersion(version)
    -- Return main version (X.Y[.Z]) from VERSION.
    version = getCompleteVersion(version)
    local parts = if version[3] == 0 then 2 else 3
    local result = {}
    for i = 1, parts do
        table.insert(result, tostring(version[i]))
    end
    return table.concat(result, ".")
end

function Versionning.getVersion(version)
    version = getCompleteVersion(version)

    -- Now build the two parts of the version number:
    -- main = X.Y[.Z]
    -- sub = .devN - for pre-alpha releases
    --   | {a|b|rc}N - for alpha, beta and release-candidate releases
    local main = getMainVersion(version)
    local sub = ""

    if version[4] ~= "final" then
        local mapping = {["alpha"] = "a", ["beta"] = "b", ["rc"] = "rc"}
        sub = mapping[version[4]] .. tostring(version[5])
    end
    return main .. sub
end

return Versionning