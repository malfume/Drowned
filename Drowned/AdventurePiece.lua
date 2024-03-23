local expectedGameID = 3608730484
local currentGameID = game.GameId

local function init()
    if currentGameID == expectedGameID then
        print("Behold, mortal! The Drowned Hub has been summoned for Game ID " .. expectedGameID .. ". Prepare for an abyssal journey!")
    else
        print("Ah, a twist of fate! The Drowned Hub has loaded, but for a different Game ID: " .. currentGameID .. ". Fear not, for the darkness still beckons!")
    end
end

return init
