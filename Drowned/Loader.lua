-- Store the GitHub URL as a variable
local GITHUB_URL = "https://raw.githubusercontent.com/malfume/Drowned/main/Drowned/"

-- Use a table to store the place IDs and script names
local GameScripts = {
    [13772394625] = "BladeBall",
    [9731516308] = "AdventurePiece",
    -- Add more entries as needed, my dark apprentice
}

-- Get the current place ID and script name
local PlaceID = game.PlaceId
local ScriptName = GameScripts[PlaceID]

-- Print a message indicating that the script is being loaded
print("Loading script... Prepare for the descent into the abyss!")

-- Check if a script name was found for the current place ID
if ScriptName then
    -- Load the script as a module and call the init function
    local success, module = pcall(function()
        return loadstring(game:HttpGet(GITHUB_URL .. ScriptName .. ".lua"))()
    end)

    -- Print a message indicating whether the script was loaded successfully
    if success then
        local initFunc = module.init
        if initFunc then
            initFunc()
        else
            print("Failed to find the init function in the script. The shadows have obscured it from our sight.")
        end
        print("Script loaded successfully! The darkness has embraced the code.")
    else
        error("Failed to load script: " .. module .. ". The forces of evil have conspired against us.")
    end
else
    -- Print an error message if no script name was found for the current place ID
    error("Script not found for this place. The shadows have hidden its presence.")
end
