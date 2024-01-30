local function identifyExecutor()
    if fluxus or Fluxus then
        return "Fluxus"
    else
        return "Unknown"
    end
end

local executor = identifyExecutor()

if executor == "Fluxus" then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "EXPLOIT DETECTION",
        Text = "Executor: " .. executor,
    })
else
    game:GetService("Players").LocalPlayer:Kick("Your exploit is not supported! (Executor: " .. executor .. ")")
    return -- This will exit the script
end

local GameIDs = {
    [13772394625] = "BladeBall",
    [9731516308] = "AdventurePiece"
};

if GameIDs[game.GameId] then
    loadstring(game:HttpGet(("https://github.com/malfume/Drowned/tree/main/Drowned/" .. GameIDs[game.GameId] .. ".lua")))()
end
