repeat wait() until game:IsLoaded()

local name, version = identifyexecutor()
print("Executor:", name, "Version:", version)

local supportedExecutors = {
    ["Wave"] = true,
    ["Zenith"] = true,
    ["Volcano"] = true,
    ["Hydrogen"] = true,
    ["Macsploit"] = true
}

if supportedExecutors[name] then
    print("✓ Supported Executor detected!")
else
    warn("⚠ This executor (" .. tostring(name) .. ") should be working, but if you experience issues, please contact support for help.")
end
local PlaceIds = {
    [17625359962] = "https://api.luarmor.net/files/v3/loaders/4cc022ded41f6816ba0f7fb8c6dda44f.lua",
    [76558904092080] = "https://api.luarmor.net/files/v3/loaders/34c43d39431b1d16b9934f1122fd6f02.lua",
    [129009554587176] = "https://api.luarmor.net/files/v3/loaders/34c43d39431b1d16b9934f1122fd6f02.lua",
}

local currentPlaceId = game.PlaceId

if not game:IsLoaded() then
    game.Loaded:Wait()
end

if PlaceIds[currentPlaceId] then
    print("Loading script for PlaceID: " .. currentPlaceId)
    
    local success, result = pcall(function()
        loadstring(game:HttpGet(PlaceIds[currentPlaceId]))()
    end)
    
    if success then
        print("✓ Script loaded successfully!")
    else
        warn("✗ Error loading script: " .. tostring(result))
    end
else
    warn("✗ No script found for PlaceID: " .. currentPlaceId)
end
