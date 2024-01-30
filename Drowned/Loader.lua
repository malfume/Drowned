if not Flux then
    game:GetService("Players").LocalPlayer:Kick("Your exploit is not supported!")
end

local GameIDs = {
    [13772394625] = "Blade Ball",
    [9731516308] = "Adventure Piece"
};

if GameIDs[game.GameId] then
    loadstring(game:HttpGet(("https://github.com/malfume/Drowned/tree/main/Drowned" .. GameIDs[game.GameId] .. ".lua")))()
end
