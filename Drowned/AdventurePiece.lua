local expectedGameID = 3608730484
local currentGameID = game.GameId

local function init()
    if currentGameID == expectedGameID then
        print("test for Game ID " .. expectedGameID .. ". j!")
    else
        print("test different Game ID: " .. currentGameID .. ". Fns!")
    end
end

return init
