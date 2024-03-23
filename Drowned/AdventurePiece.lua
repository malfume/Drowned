-- Define the expected GameID
local expectedGameID = 9731516308

-- Get the current game ID
local currentGameID = game.GameId

-- Define the init function
local function init()
    if currentGameID == expectedGameID then
        -- Print a message indicating that the script has loaded
        print("Drowned Hub Has Loaded for Game ID " .. expectedGameID)
    else
        -- Print a message indicating that the script has loaded but for a different game ID
        print("Drowned Hub Loaded, but for a different Game ID: " .. currentGameID)
    end
end

-- Return the init function
return init
