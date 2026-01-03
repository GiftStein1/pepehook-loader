local place, universe = game.PlaceId or 0, game.GameId or 0
local service = game:GetService('MarketplaceService')
local isMarket, market = pcall(service.GetProductInfo, service, place)

local supported = {
    ['Wave'] = true,
    ['Zenith'] = true,
    ['Volcano'] = true,
    ['Hydrogen'] = true,
    ['Macsploit'] = true,
    ['Seliware'] = true,
    ['Potassium'] = true,
    ['Volt'] = true,
    ['ChocoSploit'] = true,
    ['Bunni'] = true,
    ['Delta'] = true,
    ['Velocity'] = true,
}

local ids = { -- scripts
    { -- rivals
        display = 'Rivals',
        uuid = '0dcb55226cdc9c555276db48ae35021f', 
        find = {
            universe = 6035872082,
        }
    },

    { -- the forge
        display = 'The Forge',
        uuid = '34c43d39431b1d16b9934f1122fd6f02',
        find = {
            place = { 76558904092080, 129009554587176, 131884594917121 }
        },
    },

    { -- fish it
        display = 'Fish It!',
        uuid = 'b65dd9431e917a54cc84ed933242a95c',
        find = {
            place = 121864768012064
        }
    },

    { -- fisch
        display = 'Fisch',
        uuid = 'f1e4e99ff97a9037ec469416c3333172',
        find = {
            name = 'fisch',
            universe = 5750914919
        }
    }
}

repeat task.wait() until game:IsLoaded()

local name, version = identifyexecutor and identifyexecutor()
local baseURL = 'https://api.luarmor.net/files/v4/loaders'
name, version = name or '?', version or '?'

local isSupported = not not supported[name]
print(isSupported and '✓ Supported Executor detected!' or string.format('⚠ This executor (%s) should be working, but if you experience issues, please contact support for help.', name))
local parsed, script = { }, nil

local function parse(this)
    if type(this) == 'number' then
        return { this }
    end
    return this
end

for _, scriptData in ids do
    parsed[_] = {
        uuid = scriptData.uuid,
        find = {
            universe = parse(scriptData.find.universe) or { },
            place = parse(scriptData.find.place) or { },
            name = scriptData.find.name,
            fn = scriptData.find.fn
        }
    }
    parsed[_].display = scriptData.display or scriptData.find.name or scriptData.uuid or '?'
end

for _, data in parsed do
    if type(data.fn) == 'function' then
        local success, status = pcall(data.fn, data)
        if success and status then
            script = data
            break
        end
    end

    if table.find(data.find.universe, universe) then
        script = data
        break
    end

    if table.find(data.find.place, place) then
        script = data
        break
    end

    if isMarket and market and data.find.name and market.Name:find(data.find.name) then
        script = data
        break
    end
end

local debugData = string.format('PLACE: %d | UNIVERSE: %d | MARKET: %s', tonumber(place), tonumber(universe), (isMarket and (market or { Name = 'Fail'}).Name or 'Nil'))

if script and script.uuid then
    warn('[ .. ]: Loading:', script.display)
    task.spawn(function()
        local ok, _ = pcall(function()
            local url = string.format('%s/%s.lua', baseURL, script.uuid or '?')
            local src = game:HttpGet(url)
            return loadstring(src)()
        end)

        if not ok then
            warn('[FAIL]:', _)
        end
    end)

    local t = tick()
    repeat task.wait() until tick() - t > 3 or ((getgenv and getgenv() or _G).Library ~= nil and tick() - t > 1)
    print('[ OK ]: Join us: discord.gg/pepehook | pepehook.xyz')
else
    warn('[FAIL]: No script?', debugData)
end
