if getgenv().executed1 then
    return
end

getgenv().executed1 = true

print("Loaded")


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
        Text = "Fluxus Executor Detected",
    })
else
    game:GetService("Players").LocalPlayer:Kick("Your exploit is not supported!")
    return -- This will exit the script
end

local GameScripts = {
    [13772394625] = "BladeBall",
    [9731516308] = "AdventurePiece"
}

local GameID = game.GameId
local ScriptName = GameScripts[GameID]
if ScriptName then
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/malfume/Drowned/main/Drowned/" .. ScriptName .. ".lua")))()
end
