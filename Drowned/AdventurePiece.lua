local expectedGameID = 9731516308
local currentGameID = game.GameId

local function init()
    if currentGameID == expectedGameID then
        print("Drowned Hub Has Loaded for Game ID " .. expectedGameID)
    else
        print("Drowned Hub Loaded, but for a different Game ID: " .. currentGameID)
    end
end

return init
