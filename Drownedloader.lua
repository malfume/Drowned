local links = {
    BladeBall = "https://raw.githubusercontent.com/malfume/Drowned/main/BladeBall.lua",
    AdventurePiece = "https://raw.githubusercontent.com/malfume/Drowned/main/AdventurePiece.lua",
    Test = "https://raw.githubusercontent.com/malfume/Drowned/main/Test.lua",
    LegacyPiece = "https://paste.fo/raw/dc93a945549e",
    CrusedSea = "https://raw.githubusercontent.com/malfume/Drowned/main/CursedSea.lua",
    Default = "https://raw.githubusercontent.com/malfume/Kindo/main/Default.lua", -- Default script
}

local GAME_SCRIPTS = {
    [13772394625] = links.BladeBall,
    [9731516308] = links.AdventurePiece,
    [4543734972] = links.Test,
    [8501406566] = links.LegacyPiece,
    [14426444782] = links.CrusedSea,
}

local place_id = game.PlaceId

local function loadGameScript(link)
    local success, scriptOrError = pcall(function()
        local script = loadstring(game:HttpGet(link))
        if type(script) == "function" then
            return script()
        else
            error("Script at " .. link .. " is not a function")
        end
    end)
    if success then
        return true, scriptOrError
    else
        warn("Failed to load game script:", scriptOrError)
        return false, nil
    end
end

if GAME_SCRIPTS[place_id] then
    local supported, loadFunction = loadGameScript(GAME_SCRIPTS[place_id])
    print("loadFunction: ", loadFunction)
    if supported then
        if loadFunction and type(loadFunction) == "function" then
            loadFunction()
        else
            print("Game is supported, but no valid loading function found.")
        end
    else
        print("Game is supported, but script loading failed.")
    end
else
    print("Game is not supported. Loading default script.")
    local supported, loadFunction = loadGameScript(links.Default)
    if supported then
        if loadFunction and type(loadFunction) == "function" then
            loadFunction()
        else
            print("Default script loaded, but no valid loading function found.")
        end
    else
        print("Default script loading failed.")
    end
end
