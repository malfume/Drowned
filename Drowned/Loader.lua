-- Function to dynamically identify the executor
local function identifyExecutor()
    if fluxus or Fluxus then
        return "Fluxus"
    else
        return "Unknown"
    end
end

local executor = identifyExecutor()

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "EXPLOIT DETECTION",
    Text = "Executor: " .. executor,
})

-- Kick player if the executor is not Fluxus
if executor ~= "Fluxus" then
    game:GetService("Players").LocalPlayer:Kick("Your exploit is not supported! (Executor: " .. executor .. ")")
end

-- Rest of your script
local GameIDs = {
    [13772394625] = "Blade Ball",
    [9731516308] = "Adventure Piece"
};

if GameIDs[game.GameId] then
    loadstring(game:HttpGet(("https://github.com/malfume/Drowned/tree/main/Drowned" .. GameIDs[game.GameId] .. ".lua")))()
end
