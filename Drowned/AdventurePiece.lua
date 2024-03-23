-- Get the expected GameID
local expectedGameID = 9731516308

-- Get the current game ID
local currentGameID = game.GameId

-- Define the init function
function init()
    -- Check if the current game ID matches the expected game ID
    if currentGameID == expectedGameID then
        -- Print a message indicating that the script has loaded
        print("Drowned Hub Has Loaded for Game ID " .. expectedGameID)
    end
end
