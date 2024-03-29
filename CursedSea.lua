local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "[OPE-OPE] Cursed Sea ",
    SubTitle = "by NTR",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    ScriptInfo = Window:AddTab({ Title = "Script-Info", Icon = "scroll-text" }),
    Main = Window:AddTab({ Title = "Main", Icon = "box" }),
    Map = Window:AddTab({ Title = "Teleport", Icon = "map-pin" }),
    Npc = Window:AddTab({ Title = "Npc", Icon = "bot" }),
    AutoStats = Window:AddTab({ Title = "Stats", Icon = "bar-chart" }),
    Quest = Window:AddTab({ Title = "Quest", Icon = "book-down" }),




    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

-- Notification
Fluent:Notify({
    Title = "Drowned Hub",
    Content = "The Script has loaded",
    Duration = 5
})

-- Script Information
Tabs.ScriptInfo:AddParagraph({
    Title = "Script currently Version 2.1",
    Content = ""
})

Tabs.ScriptInfo:AddParagraph({
    Title = "Supported Devices",
    Content = "-Mobile -Pc -Emulator"
})

Tabs.ScriptInfo:AddParagraph({
    Title = "Executor Supported",
    Content = "1.Krampus 2.Fluxus 3.Arceus/Codex"
})

Tabs.ScriptInfo:AddParagraph({
    Title = "Credit to @VMNTR @Texchy ",
    Content = "https://discord.gg/FkUnuQARwr"
})

-- Toggle
local autoM1ToggleState = false

local AutoM1Toggle = Tabs.Main:AddToggle("AutoM1Toggle", { Title = "Auto M1 Sword", Default = false })

AutoM1Toggle:OnChanged(function()
    autoM1ToggleState = Options.AutoM1Toggle.Value
end)

Options.AutoM1Toggle:SetValue(false)

local function PerformM1Sword()
    local args = {
        [1] = "M1"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("combat"):FireServer(unpack(args))
end

coroutine.wrap(function()
    while true do
        if autoM1ToggleState then
            PerformM1Sword()
        end
        wait(0.1)  -- Adjust the time interval between actions
    end
end)()


local MyToggle = Tabs.Main:AddToggle("MyToggle", { Title = "Auto jump (Quest)", Default = false })

MyToggle:OnChanged(function()
    print("Toggle changed:", Options.MyToggle.Value)
end)

Options.MyToggle:SetValue(false)

local MyToggle = Tabs.Main:AddToggle("MyToggle", { Title = "Auto Dash (Quest)", Default = false })

MyToggle:OnChanged(function()
    print("Toggle changed:", Options.MyToggle.Value)
end)

Options.MyToggle:SetValue(false)


-- Button
Tabs.Main:AddButton({
    Title = "Redeem Codes",
    Description = "Redeem multiple codes",
    Callback = function()
        -- Define the list of codes to redeem
        local codes = {
            "oops",
            "7.5k likes",
            "level 100",
            "level 250",
            "up all night",
            "pinto my binto",
            "5k likes",
            "mobile!",
            "lets progress"
        }
        
        -- Iterate over the list of codes and redeem each one
        for _, code in ipairs(codes) do
            local args = {
                [1] = code,
                [2] = {}
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("codes"):FireServer(unpack(args))
            wait(1) -- Adjust the delay between redeeming each code if necessary
        end
    end
})



-- Button
Tabs.Map:AddButton({
    Title = "Starter Island",
    Description = "Teleport to Starter Island",
    Callback = function()
        -- Check if the NPC folder exists in the workspace
        local npcFolder = workspace:FindFirstChild("npcs")
        if npcFolder then
            -- Check if the spawns folder exists inside the NPC folder
            local spawnsFolder = npcFolder:FindFirstChild("spawns")
            if spawnsFolder then
                -- Check if the Maple Island spawn location exists inside the spawns folder
                local mapleIslandSpawn = spawnsFolder:FindFirstChild("Maple Island")
                if mapleIslandSpawn then
                    -- Find a part within the Maple Island model to get its position
                    local islandPart = mapleIslandSpawn:FindFirstChildWhichIsA("BasePart")
                    if islandPart then
                        -- Teleport the player to the Maple Island spawn location
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(islandPart.Position))
                        print("Teleported to Starter Island")
                    else
                        print("Error: No BasePart found inside 'Maple Island' spawn location.")
                    end
                else
                    print("Error: 'Maple Island' spawn location not found.")
                end
            else
                print("Error: 'spawns' folder not found inside 'NPC' folder.")
            end
        else
            print("Error: 'npcs' folder not found in the workspace.")
        end
    end
})

-- Button
Tabs.Map:AddButton({
    Title = "Baratie",
    Description = "Teleport to Bartia",
    Callback = function()
        -- Check if the NPC folder exists in the workspace
        local npcFolder = workspace:FindFirstChild("npcs")
        if npcFolder then
            -- Check if the spawns folder exists inside the NPC folder
            local spawnsFolder = npcFolder:FindFirstChild("spawns")
            if spawnsFolder then
                -- Check if the Maple Island spawn location exists inside the spawns folder
                local mapleIslandSpawn = spawnsFolder:FindFirstChild("Baratie")
                if mapleIslandSpawn then
                    -- Find a part within the Maple Island model to get its position
                    local islandPart = mapleIslandSpawn:FindFirstChildWhichIsA("BasePart")
                    if islandPart then
                        -- Teleport the player to the Maple Island spawn location
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(islandPart.Position))
                        print("Teleported to bartia Island")
                    else
                        print("Error: No BasePart found inside 'Bartia' spawn location.")
                    end
                else
                    print("Error: 'Bartia' spawn location not found.")
                end
            else
                print("Error: 'spawns' folder not found inside 'NPC' folder.")
            end
        else
            print("Error: 'npcs' folder not found in the workspace.")
        end
    end
})


-- Button
Tabs.Map:AddButton({
    Title = "Bank island",
    Description = "Teleport to Bank island",
    Callback = function()
        -- Check if the NPC folder exists in the workspace
        local npcFolder = workspace:FindFirstChild("npcs")
        if npcFolder then
            -- Check if the spawns folder exists inside the NPC folder
            local spawnsFolder = npcFolder:FindFirstChild("spawns")
            if spawnsFolder then
                -- Check if the Maple Island spawn location exists inside the spawns folder
                local mapleIslandSpawn = spawnsFolder:FindFirstChild("Bank Island")
                if mapleIslandSpawn then
                    -- Find a part within the Maple Island model to get its position
                    local islandPart = mapleIslandSpawn:FindFirstChildWhichIsA("BasePart")
                    if islandPart then
                        -- Teleport the player to the Maple Island spawn location
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(islandPart.Position))
                        print("Teleported to  Bank Island")
                    else
                        print("Error: No BasePart found inside 'Bank Island' spawn location.")
                    end
                else
                    print("Error: 'Bank Island' spawn location not found.")
                end
            else
                print("Error: 'spawns' folder not found inside 'NPC' folder.")
            end
        else
            print("Error: 'npcs' folder not found in the workspace.")
        end
    end
})


-- Button
Tabs.Map:AddButton({
    Title = "Lighthouse Island",
    Description = "Teleport to Lighthouse Island",
    Callback = function()
        -- Check if the NPC folder exists in the workspace
        local npcFolder = workspace:FindFirstChild("npcs")
        if npcFolder then
            -- Check if the spawns folder exists inside the NPC folder
            local spawnsFolder = npcFolder:FindFirstChild("spawns")
            if spawnsFolder then
                -- Check if the Maple Island spawn location exists inside the spawns folder
                local mapleIslandSpawn = spawnsFolder:FindFirstChild("Lighthouse Island")
                if mapleIslandSpawn then
                    -- Find a part within the Maple Island model to get its position
                    local islandPart = mapleIslandSpawn:FindFirstChildWhichIsA("BasePart")
                    if islandPart then
                        -- Teleport the player to the Maple Island spawn location
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(islandPart.Position))
                        print("Teleported to Lighthouse Island")
                    else
                        print("Error: No BasePart found inside 'Lighthouse Island' spawn location.")
                    end
                else
                    print("Error: 'Lighthouse Island' spawn location not found.")
                end
            else
                print("Error: 'spawns' folder not found inside 'NPC' folder.")
            end
        else
            print("Error: 'npcs' folder not found in the workspace.")
        end
    end
})


-- Button
Tabs.Map:AddButton({
    Title = "Marine Base",
    Description = "Teleport to Marine Base",
    Callback = function()
        -- Check if the NPC folder exists in the workspace
        local npcFolder = workspace:FindFirstChild("npcs")
        if npcFolder then
            -- Check if the spawns folder exists inside the NPC folder
            local spawnsFolder = npcFolder:FindFirstChild("spawns")
            if spawnsFolder then
                -- Check if the Maple Island spawn location exists inside the spawns folder
                local mapleIslandSpawn = spawnsFolder:FindFirstChild("Marine Base")
                if mapleIslandSpawn then
                    -- Find a part within the Maple Island model to get its position
                    local islandPart = mapleIslandSpawn:FindFirstChildWhichIsA("BasePart")
                    if islandPart then
                        -- Teleport the player to the Maple Island spawn location
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(islandPart.Position))
                        print("Teleported to Starter Island")
                    else
                        print("Error: No BasePart found inside 'Marine Base' spawn location.")
                    end
                else
                    print("Error: 'Marine Base' spawn location not found.")
                end
            else
                print("Error: 'spawns' folder not found inside 'NPC' folder.")
            end
        else
            print("Error: 'npcs' folder not found in the workspace.")
        end
    end
})


-- Button
Tabs.Map:AddButton({
    Title = "Samurai Island",
    Description = "Teleport to Samurai Island",
    Callback = function()
        -- Check if the NPC folder exists in the workspace
        local npcFolder = workspace:FindFirstChild("npcs")
        if npcFolder then
            -- Check if the spawns folder exists inside the NPC folder
            local spawnsFolder = npcFolder:FindFirstChild("spawns")
            if spawnsFolder then
                -- Check if the Maple Island spawn location exists inside the spawns folder
                local mapleIslandSpawn = spawnsFolder:FindFirstChild("Samurai Island")
                if mapleIslandSpawn then
                    -- Find a part within the Maple Island model to get its position
                    local islandPart = mapleIslandSpawn:FindFirstChildWhichIsA("BasePart")
                    if islandPart then
                        -- Teleport the player to the Maple Island spawn location
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(islandPart.Position))
                        print("Teleported to Samurai Island")
                    else
                        print("Error: No BasePart found inside 'Samurai Island' spawn location.")
                    end
                else
                    print("Error: 'Samurai Island' spawn location not found.")
                end
            else
                print("Error: 'spawns' folder not found inside 'NPC' folder.")
            end
        else
            print("Error: 'npcs' folder not found in the workspace.")
        end
    end
})


-- Button
Tabs.Map:AddButton({
    Title = "Spawn 0",
    Description = "Teleport to Spawn 0",
    Callback = function()
        -- Check if the NPC folder exists in the workspace
        local npcFolder = workspace:FindFirstChild("npcs")
        if npcFolder then
            -- Check if the spawns folder exists inside the NPC folder
            local spawnsFolder = npcFolder:FindFirstChild("spawns")
            if spawnsFolder then
                -- Check if the Maple Island spawn location exists inside the spawns folder
                local mapleIslandSpawn = spawnsFolder:FindFirstChild("Spawn 0")
                if mapleIslandSpawn then
                    -- Find a part within the Maple Island model to get its position
                    local islandPart = mapleIslandSpawn:FindFirstChildWhichIsA("BasePart")
                    if islandPart then
                        -- Teleport the player to the Maple Island spawn location
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(islandPart.Position))
                        print("Teleported to Spawn 0")
                    else
                        print("Error: No BasePart found inside 'Spawn 0' spawn location.")
                    end
                else
                    print("Error: 'Spawn 0' spawn location not found.")
                end
            else
                print("Error: 'spawns' folder not found inside 'NPC' folder.")
            end
        else
            print("Error: 'npcs' folder not found in the workspace.")
        end
    end
})


-- Button
Tabs.Map:AddButton({
    Title = "The Jungle",
    Description = "Teleport to The Jungle",
    Callback = function()
        -- Check if the NPC folder exists in the workspace
        local npcFolder = workspace:FindFirstChild("npcs")
        if npcFolder then
            -- Check if the spawns folder exists inside the NPC folder
            local spawnsFolder = npcFolder:FindFirstChild("spawns")
            if spawnsFolder then
                -- Check if the Maple Island spawn location exists inside the spawns folder
                local mapleIslandSpawn = spawnsFolder:FindFirstChild("The Jungle")
                if mapleIslandSpawn then
                    -- Find a part within the Maple Island model to get its position
                    local islandPart = mapleIslandSpawn:FindFirstChildWhichIsA("BasePart")
                    if islandPart then
                        -- Teleport the player to the Maple Island spawn location
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(islandPart.Position))
                        print("Teleported to The Jungle")
                    else
                        print("Error: No BasePart found inside 'Maple Island' The Jungle")
                    end
                else
                    print("Error: 'The Jungle' spawn location not found.")
                end
            else
                print("Error: 'spawns' folder not found inside 'NPC' folder.")
            end
        else
            print("Error: 'npcs' folder not found in the workspace.")
        end
    end
})



-- Button
Tabs.Npc:AddButton({
    Title = "Blackleg Master",
    Description = "Teleport to The Blackleg Master",
    Callback = function()
        -- Check if the NPC folder exists in the workspace
        local npcFolder = workspace:FindFirstChild("npcs")
        if npcFolder then
            -- Check if the trainers folder exists inside the NPC folder
            local trainersFolder = npcFolder:FindFirstChild("trainers")
            if trainersFolder then
                -- Check if the Blackleg Master spawn location exists inside the trainers folder
                local blacklegMasterSpawn = trainersFolder:FindFirstChild("Blackleg Master")
                if blacklegMasterSpawn then
                    -- Find a part within the Blackleg Master model to get its position
                    local blacklegPart = blacklegMasterSpawn:FindFirstChildWhichIsA("BasePart")
                    if blacklegPart then
                        -- Teleport the player to the Blackleg Master NPC
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(blacklegPart.Position))
                        print("Teleported to The Blackleg Master")
                    else
                        print("Error: No BasePart found inside 'Blackleg Master' NPC.")
                    end
                else
                    print("Error: 'Blackleg Master' NPC not found.")
                end
            else
                print("Error: 'trainers' folder not found inside 'NPC' folder.")
            end
        else
            print("Error: 'npcs' folder not found in the workspace.")
        end
    end
})


-- Button
Tabs.Npc:AddButton({
    Title = "Curse Remover",
    Description = "Teleport to The Curse Remover",
    Callback = function()
        -- Check if the NPC folder exists in the workspace
        local npcFolder = workspace:FindFirstChild("npcs")
        if npcFolder then
            -- Check if the trainers folder exists inside the NPC folder
            local trainersFolder = npcFolder:FindFirstChild("trainers")
            if trainersFolder then
                -- Check if the Blackleg Master spawn location exists inside the trainers folder
                local blacklegMasterSpawn = trainersFolder:FindFirstChild("Curse Remover")
                if blacklegMasterSpawn then
                    -- Find a part within the Blackleg Master model to get its position
                    local blacklegPart = blacklegMasterSpawn:FindFirstChildWhichIsA("BasePart")
                    if blacklegPart then
                        -- Teleport the player to the Blackleg Master NPC
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(blacklegPart.Position))
                        print("Teleported to The Blackleg Master")
                    else
                        print("Error: No BasePart found inside 'Curse Remover' NPC.")
                    end
                else
                    print("Error: 'Curse Remover' NPC not found.")
                end
            else
                print("Error: 'trainers' folder not found inside 'NPC' folder.")
            end
        else
            print("Error: 'npcs' folder not found in the workspace.")
        end
    end
})


-- Button
Tabs.Npc:AddButton({
    Title = "Dagger Master",
    Description = "Teleport to The Dagger Master",
    Callback = function()
        -- Check if the NPC folder exists in the workspace
        local npcFolder = workspace:FindFirstChild("npcs")
        if npcFolder then
            -- Check if the trainers folder exists inside the NPC folder
            local trainersFolder = npcFolder:FindFirstChild("trainers")
            if trainersFolder then
                -- Check if the Blackleg Master spawn location exists inside the trainers folder
                local blacklegMasterSpawn = trainersFolder:FindFirstChild("Dagger Master")
                if blacklegMasterSpawn then
                    -- Find a part within the Blackleg Master model to get its position
                    local blacklegPart = blacklegMasterSpawn:FindFirstChildWhichIsA("BasePart")
                    if blacklegPart then
                        -- Teleport the player to the Blackleg Master NPC
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(blacklegPart.Position))
                        print("Teleported to The Blackleg Master")
                    else
                        print("Error: No BasePart found inside 'Dagger Master' NPC.")
                    end
                else
                    print("Error: 'Dagger Master' NPC not found.")
                end
            else
                print("Error: 'trainers' folder not found inside 'NPC' folder.")
            end
        else
            print("Error: 'npcs' folder not found in the workspace.")
        end
    end
})



-- Button
Tabs.Npc:AddButton({
    Title = "Six Powers Master",
    Description = "Teleport to The Six Powers Master",
    Callback = function()
        -- Check if the NPC folder exists in the workspace
        local npcFolder = workspace:FindFirstChild("npcs")
        if npcFolder then
            -- Check if the trainers folder exists inside the NPC folder
            local trainersFolder = npcFolder:FindFirstChild("trainers")
            if trainersFolder then
                -- Check if the Blackleg Master spawn location exists inside the trainers folder
                local blacklegMasterSpawn = trainersFolder:FindFirstChild("Six Powers Master")
                if blacklegMasterSpawn then
                    -- Find a part within the Blackleg Master model to get its position
                    local blacklegPart = blacklegMasterSpawn:FindFirstChildWhichIsA("BasePart")
                    if blacklegPart then
                        -- Teleport the player to the Blackleg Master NPC
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(blacklegPart.Position))
                        print("Teleported to The Blackleg Master")
                    else
                        print("Error: No BasePart found inside 'Six Powers Master' NPC.")
                    end
                else
                    print("Error: 'Six Powers Master' NPC not found.")
                end
            else
                print("Error: 'trainers' folder not found inside 'NPC' folder.")
            end
        else
            print("Error: 'npcs' folder not found in the workspace.")
        end
    end
})



-- Button
Tabs.Npc:AddButton({
    Title = "Soul Master",
    Description = "Teleport to The Soul Master",
    Callback = function()
        -- Check if the NPC folder exists in the workspace
        local npcFolder = workspace:FindFirstChild("npcs")
        if npcFolder then
            -- Check if the trainers folder exists inside the NPC folder
            local trainersFolder = npcFolder:FindFirstChild("trainers")
            if trainersFolder then
                -- Check if the Blackleg Master spawn location exists inside the trainers folder
                local blacklegMasterSpawn = trainersFolder:FindFirstChild("Soul Master")
                if blacklegMasterSpawn then
                    -- Find a part within the Blackleg Master model to get its position
                    local blacklegPart = blacklegMasterSpawn:FindFirstChildWhichIsA("BasePart")
                    if blacklegPart then
                        -- Teleport the player to the Blackleg Master NPC
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(blacklegPart.Position))
                        print("Teleported to The Blackleg Master")
                    else
                        print("Error: No BasePart found inside 'Soul Master' NPC.")
                    end
                else
                    print("Error: 'Soul Master' NPC not found.")
                end
            else
                print("Error: 'trainers' folder not found inside 'NPC' folder.")
            end
        else
            print("Error: 'npcs' folder not found in the workspace.")
        end
    end
})


-- Toggle
local autoStrengthToggleState = false

local AutoStrengthToggle = Tabs.AutoStats:AddToggle("Strength", { Title = "Auto Strength", Default = false })

AutoStrengthToggle:OnChanged(function(value)
    autoStrengthToggleState = value
end)

-- Set the initial value of the toggle
Options.AutoStrengthToggle = Options.AutoStrengthToggle or {}
Options.AutoStrengthToggle.Value = false

-- Function to perform auto allocation of strength points
local function PerformAutoStrength()
    local args = {
        [1] = "strength",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("addStats"):FireServer(unpack(args))
end

coroutine.wrap(function()
    while true do
        if autoStrengthToggleState then
            PerformAutoStrength()
        end
        wait(0.1)  -- Adjust the time interval between actions
    end
end)()


-- Toggle
local autoDefenseToggleState = false

local AutoDefenseToggle = Tabs.AutoStats:AddToggle("Defense", { Title = "Auto Defense", Default = false })

AutoDefenseToggle:OnChanged(function(value)
    autoDefenseToggleState = value
end)

-- Set the initial value of the toggle
Options.AutoDefenseToggle = Options.AutoDefenseToggle or {}
Options.AutoDefenseToggle.Value = false

-- Function to perform auto allocation of defense points
local function PerformAutoDefense()
    local args = {
        [1] = "defense",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("addStats"):FireServer(unpack(args))
end

coroutine.wrap(function()
    while true do
        if autoDefenseToggleState then
            PerformAutoDefense()
        end
        wait(0.1)  -- Adjust the time interval between actions
    end
end)()


-- Toggle
local autoStaminaToggleState = false

local AutoStaminaToggle = Tabs.AutoStats:AddToggle("Stamina", { Title = "Auto Stamina", Default = false })

AutoStaminaToggle:OnChanged(function(value)
    autoStaminaToggleState = value
end)

-- Set the initial value of the toggle
Options.AutoStaminaToggle = Options.AutoStaminaToggle or {}
Options.AutoStaminaToggle.Value = false

-- Function to perform auto allocation of stamina points
local function PerformAutoStamina()
    local args = {
        [1] = "stamina",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("addStats"):FireServer(unpack(args))
end

coroutine.wrap(function()
    while true do
        if autoStaminaToggleState then
            PerformAutoStamina()
        end
        wait(0.1)  -- Adjust the time interval between actions
    end
end)()


-- Toggle
local autoCurseToggleState = false

local AutoCurseToggle = Tabs.AutoStats:AddToggle("Curse", { Title = "Auto Curse", Default = false })

AutoCurseToggle:OnChanged(function(value)
    autoCurseToggleState = value
end)

-- Set the initial value of the toggle
Options.AutoCurseToggle = Options.AutoCurseToggle or {}
Options.AutoCurseToggle.Value = false

-- Function to perform auto allocation of curse points
local function PerformAutoCurse()
    local args = {
        [1] = "curse",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("addStats"):FireServer(unpack(args))
end

coroutine.wrap(function()
    while true do
        if autoCurseToggleState then
            PerformAutoCurse()
        end
        wait(0.1)  -- Adjust the time interval between actions
    end
end)()


-- Toggle
local autoSwordToggleState = false

local AutoSwordToggle = Tabs.AutoStats:AddToggle("Sword", { Title = "Auto Sword", Default = false })

AutoSwordToggle:OnChanged(function(value)
    autoSwordToggleState = value
end)

-- Set the initial value of the toggle
Options.AutoSwordToggle = Options.AutoSwordToggle or {}
Options.AutoSwordToggle.Value = false

-- Function to perform auto allocation of sword points
local function PerformAutoSword()
    local args = {
        [1] = "sword",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("addStats"):FireServer(unpack(args))
end

coroutine.wrap(function()
    while true do
        if autoSwordToggleState then
            PerformAutoSword()
        end
        wait(0.1)  -- Adjust the time interval between actions
    end
end)()


-- Toggle
local autoDaggerToggleState = false

local AutoDaggerToggle = Tabs.AutoStats:AddToggle("Dagger", { Title = "Auto Dagger", Default = false })

AutoDaggerToggle:OnChanged(function(value)
    autoDaggerToggleState = value
end)

-- Set the initial value of the toggle
Options.AutoDaggerToggle = Options.AutoDaggerToggle or {}
Options.AutoDaggerToggle.Value = false

-- Function to perform auto allocation of dagger points
local function PerformAutoDagger()
    local args = {
        [1] = "dagger",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("addStats"):FireServer(unpack(args))
end

coroutine.wrap(function()
    while true do
        if autoDaggerToggleState then
            PerformAutoDagger()
        end
        wait(0.1)  -- Adjust the time interval between actions
    end
end)()


-- Toggle
local autoGunsToggleState = false

local AutoGunsToggle = Tabs.AutoStats:AddToggle("Guns", { Title = "Auto Guns", Default = false })

AutoGunsToggle:OnChanged(function(value)
    autoGunsToggleState = value
end)

-- Set the initial value of the toggle
Options.AutoGunsToggle = Options.AutoGunsToggle or {}
Options.AutoGunsToggle.Value = false

-- Function to perform auto allocation of guns points
local function PerformAutoGuns()
    local args = {
        [1] = "guns",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("addStats"):FireServer(unpack(args))
end

coroutine.wrap(function()
    while true do
        if autoGunsToggleState then
            PerformAutoGuns()
        end
        wait(0.1)  -- Adjust the time interval between actions
    end
end)()






-- Addons
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("DrownedHub")
SaveManager:SetFolder("DrownedHub/CursedSea")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

SaveManager:LoadAutoloadConfig()
