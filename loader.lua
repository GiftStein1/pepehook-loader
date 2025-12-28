repeat wait() until game:IsLoaded()

local name, version = identifyexecutor()
print("Executor: " .. name .. " Version: " .. tostring(version))

local supportedExecutors = {
    ["Wave"] = true,
    ["Zenith"] = true,
    ["Volcano"] = true,
    ["Hydrogen"] = true,
    ["Macsploit"] = true,
    ["Seliware"] = true,
    ["Potassium"] = true,
    ["Volt"] = true,
    ["ChocoSploit"] = true,
    ["Bunni"] = true,
    ["Delta"] = true,
    ["Velocity"] = true,
}

if supportedExecutors[name] then
    print("✓ Supported Executor detected!")
else
    warn("⚠ This executor (" .. tostring(name) .. ") should be working, but if you experience issues, please contact support for help.")
end

local PlaceIds = {
    -- Rivals
    [129604661913557] = "https://api.luarmor.net/files/v3/loaders/4cc022ded41f6816ba0f7fb8c6dda44f.lua",
    [133215910299950] = "https://api.luarmor.net/files/v3/loaders/4cc022ded41f6816ba0f7fb8c6dda44f.lua",
    [71874690745115] = "https://api.luarmor.net/files/v3/loaders/4cc022ded41f6816ba0f7fb8c6dda44f.lua",
    [117398147513099] = "https://api.luarmor.net/files/v3/loaders/4cc022ded41f6816ba0f7fb8c6dda44f.lua",
    [18126510175] = "https://api.luarmor.net/files/v3/loaders/4cc022ded41f6816ba0f7fb8c6dda44f.lua",
    [17625359962] = "https://api.luarmor.net/files/v3/loaders/4cc022ded41f6816ba0f7fb8c6dda44f.lua",
    
    -- The Forge (World 1, 2, 3)
    [76558904092080] = "https://api.luarmor.net/files/v3/loaders/34c43d39431b1d16b9934f1122fd6f02.lua",
    [129009554587176] = "https://api.luarmor.net/files/v3/loaders/34c43d39431b1d16b9934f1122fd6f02.lua",
    [131884594917121] = "https://api.luarmor.net/files/v3/loaders/34c43d39431b1d16b9934f1122fd6f02.lua",
    
    -- Fish It
    [121864768012064] = "https://api.luarmor.net/files/v3/loaders/b65dd9431e917a54cc84ed933242a95c.lua",
    
    -- Fisch
    [17800150007] = "https://api.luarmor.net/files/v3/loaders/f1e4e99ff97a9037ec469416c3333172.lua",
    [70451556031302] = "https://api.luarmor.net/files/v3/loaders/f1e4e99ff97a9037ec469416c3333172.lua",
    [70527388434806] = "https://api.luarmor.net/files/v3/loaders/f1e4e99ff97a9037ec469416c3333172.lua",
    [72907489978215] = "https://api.luarmor.net/files/v3/loaders/f1e4e99ff97a9037ec469416c3333172.lua",
    [85537329004957] = "https://api.luarmor.net/files/v3/loaders/f1e4e99ff97a9037ec469416c3333172.lua",
    [111674521372264] = "https://api.luarmor.net/files/v3/loaders/f1e4e99ff97a9037ec469416c3333172.lua",
    [106011698424775] = "https://api.luarmor.net/files/v3/loaders/f1e4e99ff97a9037ec469416c3333172.lua",
    [105044186406168] = "https://api.luarmor.net/files/v3/loaders/f1e4e99ff97a9037ec469416c3333172.lua",
    [99519129453387] = "https://api.luarmor.net/files/v3/loaders/f1e4e99ff97a9037ec469416c3333172.lua",
    [93179100126310] = "https://api.luarmor.net/files/v3/loaders/f1e4e99ff97a9037ec469416c3333172.lua",
    [112780263016678] = "https://api.luarmor.net/files/v3/loaders/f1e4e99ff97a9037ec469416c3333172.lua",
    [128543442402268] = "https://api.luarmor.net/files/v3/loaders/f1e4e99ff97a9037ec469416c3333172.lua",
    [131716211654599] = "https://api.luarmor.net/files/v3/loaders/f1e4e99ff97a9037ec469416c3333172.lua",
}

local currentPlaceId = game.PlaceId
if not game:IsLoaded() then
    print("Awaiting Game Load...")
    game.Loaded:Wait()
    print("Game Loaded! Initiating...")
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
