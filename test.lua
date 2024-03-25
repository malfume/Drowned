local expectedGameID = 11535401491
local currentGameID = game.GameId

local function init()
    if currentGameID == expectedGameID then
        print("Correct id for Game ID " .. expectedGameID .. ". j!")
    else
        print("different Game ID: " .. currentGameID .. ". Fns!")
    end
end

return init
