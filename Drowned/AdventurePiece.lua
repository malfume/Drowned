if game.PlaceId ~= 9731516308 or shared.AdventurePiece then return end;

shared.AdventurePiece = true;

local repo = 'https://raw.githubusercontent.com/malfume/Linoria/main/'

-- Load libraries
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'SaveManager.lua'))()

-- Create Window and Tabs
local Window = Library:CreateWindow({
    Title = 'Drowned||HUB-  -Adventure||piece .gg/Z3FU9gabKX',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Main = Window:AddTab('Main'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

-- Main Tab - Movement
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Movement')

local StarterGui = game:GetService("StarterGui")  -- Initialize StarterGui
local Players = game:GetService("Players")  -- Initialize Players service

local function findFruits()
    local fruits = {}
    for _, object in pairs(workspace:GetDescendants()) do
        if object:IsA("BasePart") and string.find(object.Name:lower(), "fruit", 1, true) then
            table.insert(fruits, object)
        end
    end
    return fruits
end

local function teleportAndCollectFruits()
    local function checkGlobalFruitSpawn()
        while true do
            local fruits = findFruits()
    
            if #fruits > 0 then
                -- Display global notification when a fruit spawns
                StarterGui:SetCore("SendNotification", {
                    Title = "Fruit Spawned",
                    Text = "A fruit has spawned in the server!",
                    Duration = 3
                })
            end
    
            wait(60) -- Check for fruit spawn every 60 seconds
        end
    end
    
    -- Start the global fruit spawn notification loop
    coroutine.wrap(checkGlobalFruitSpawn)()
    
    local collectedFruits = {}  -- Track collected fruits to avoid duplicate notifications

    while true do
        if LeftGroupBox['Collect Fruits'] == true then  -- Check if the toggle is enabled  -- Check if the toggle is enabled
            local fruits = findFruits()

            if #fruits > 0 then
                for _, fruit in pairs(fruits) do
                    if not table.find(collectedFruits, fruit) then  -- Check if the fruit has not been collected
                        local character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
                        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                        humanoidRootPart.CFrame = fruit.CFrame

                        -- Optionally add code here to interact with the fruit (e.g., hold "E" key)
                        if fruit:IsA("BasePart") then
                            -- Teleport to the fruit
                            humanoidRootPart.CFrame = fruit.CFrame

                            wait(1) -- Delay before interacting with the fruit

                            -- Interact with the fruit (e.g., hold "E" key)
                            game:GetService("UserInputService").InputBegan:Connect(function(input)
                                if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.E then
                                    print("Holding E key")
                                    wait(3)  -- Hold "E" key for 3 seconds
                                    print("Releasing E key")
                                end
                            end)

                            wait(1) -- Delay between collecting each fruit

                            -- Remove the fruit once it's collected
                            fruit:Destroy()

                            -- Display notification when a fruit is collected
                            StarterGui:SetCore("SendNotification", {
                                Title = "Fruit Collected",
                                Text = "You collected a fruit!",
                                Duration = 3
                            })

                            table.insert(collectedFruits, fruit)  -- Add the collected fruit to the list
                        end
                    end
                end
            end
        end

        wait(5) -- Check for fruits again after 5 seconds
    end
end

local function teleportAndCollectFruits()
    local function checkGlobalFruitSpawn()
        while true do
            local fruits = findFruits()

            if #fruits > 0 then
                for _, fruit in pairs(fruits) do
                    -- Check if the fruit has not been collected
                    if not table.find(collectedFruits, fruit) then
                        -- Display global notification when a fruit spawns
                        StarterGui:SetCore("SendNotification", {
                            Title = "Fruit Spawned",
                            Text = "A " .. fruit.Name .. " has spawned in the server!",
                            Duration = 3
                        })
                    end
                end
            end

            wait(60) -- Check for fruit spawn every 60 seconds
        end
    end

    -- Start the global fruit spawn notification loop
    coroutine.wrap(checkGlobalFruitSpawn)()

    local collectedFruits = {}  -- Track collected fruits to avoid duplicate notifications

    while true do
        if LeftGroupBox['Collect Fruits'] == true then
            local fruits = findFruits()

            if #fruits > 0 then
                for _, fruit in pairs(fruits) do
                    -- Check if the fruit has not been collected
                    if not table.find(collectedFruits, fruit) then
                        local character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
                        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                        humanoidRootPart.CFrame = fruit.CFrame

                        if fruit:IsA("BasePart") then
                            humanoidRootPart.CFrame = fruit.CFrame
                            wait(1) -- Delay before interacting with the fruit

                            game:GetService("UserInputService").InputBegan:Connect(function(input)
                                if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.E then
                                    print("Holding E key")
                                    wait(3)  -- Hold "E" key for 3 seconds
                                    print("Releasing E key")

                                    -- Check if the fruit is already collected
                                    if not table.find(collectedFruits, fruit) then
                                        -- Display notification when a fruit is collected
                                        StarterGui:SetCore("SendNotification", {
                                            Title = "Fruit Collected",
                                            Text = "You collected a " .. fruit.Name,
                                            Duration = 3
                                        })

                                        table.insert(collectedFruits, fruit)  -- Add the collected fruit to the list
                                    else
                                        -- Display notification if you already have that fruit
                                        StarterGui:SetCore("SendNotification", {
                                            Title = "Already Have",
                                            Text = "You already have a " .. fruit.Name,
                                            Duration = 3
                                        })
                                    end

                                    -- Remove the fruit once it's collected
                                    fruit:Destroy()
                                end
                            end)

                            wait(1) -- Delay between collecting each fruit
                        end
                    end
                end
            end
        end

        wait(5) -- Check for fruits again after 5 seconds
    end
end


LeftGroupBox:AddToggle('Auto M1 Sword', { Text = 'Auto M1 Sword', Callback = function(value)
    if value then
        -- Function to perform M1 Sword action
        local function performM1Sword()
            local args = {
                [1] = "WeaponCombat",
                [2] = "WeaponSlice",
                [3] = "Begin"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SignalRequest"):InvokeServer(unpack(args))
        end

        -- Loop to perform M1 Sword action every 0.1 second
        while value do
            performM1Sword()
            wait(0.1)  -- Adjust the time interval between actions
        end
    end
end })


LeftGroupBox:AddToggle('Auto M1 Fist', { Text = 'Auto M1 Fist', Callback = function(value)
    if value then
        -- Function to perform M1 Fist action
        local function performM1Fist()
            local args = {
                [1] = "StyleCombat",
                [2] = "CombatPunch",
                [3] = "Begin"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SignalRequest"):InvokeServer(unpack(args))
        end

        -- Repeat-until loop to perform M1 Fist action continuously
        repeat
            performM1Fist()
            wait(0.1)  -- Adjust the time interval between actions
        until not value  -- Continue the loop as long as the toggle is enabled
    end
end })


local noCdToggleState = false
local noCdToggle = LeftGroupBox:AddToggle('no cd flashStep', { Text = 'no cd flashStep', Callback = function(value) 
    noCdToggleState = value
end })

local function mainLoop()
    while true do
        if noCdToggleState then
            local args = {
                [1] = "GeppoDash",
                [2] = "Dash",
                [3] = "Begin"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SignalRequest"):InvokeServer(unpack(args))

            wait(1)  -- Adjust the wait time (in seconds) between each invocation of the server
        else
            wait(0.1) -- Adjust the wait time if the toggle is not enabled
        end
    end
end

-- Run the main loop using RunService.Heartbeat
game:GetService("RunService").Heartbeat:Connect(mainLoop)


-- Main Tab - World Esp
local TabBox = Tabs.Main:AddRightTabbox()
local Tab2 = TabBox:AddTab('World')

Tab2:AddToggle('Auto m1 sword ', { Text = 'Auto m1 sword', Callback = function(value) print('Auto m1 sword Toggled:', value) end })


Tab2:AddToggle('Auto Collect chest', { Text = 'Auto Collect chest', Callback = function(value) 
    if value then
        local workspace = game:GetService("Workspace")
        local Players = game:GetService("Players")
        local StarterGui = game:GetService("StarterGui")
        local chestsFolder = workspace:WaitForChild("Chests") -- Assuming chests are in a folder named "Chests"

        local hasNotified = false

        local function checkForChests()
            local chests = chestsFolder:GetChildren()

            if #chests > 0 then
                return true
            elseif not hasNotified then
                hasNotified = true
                StarterGui:SetCore("SendNotification", {
                    Title = "No Chests Found",
                    Text = "No chests found in the map!",
                    Duration = 3  -- Adjust the duration of the notification
                })
            end

            return false
        end

        local function teleportToChests()
            while true do
                if checkForChests() then
                    for _, chest in pairs(chestsFolder:GetChildren()) do
                        if chest:IsA("BasePart") then -- Check if it's a part-based chest
                            local character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
                            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                            humanoidRootPart.CFrame = chest.CFrame
                            chest:Destroy()  -- Remove the chest once it's collected

                            -- Display notification when a chest is collected
                            StarterGui:SetCore("SendNotification", {
                                Title = "Chest Collected",
                                Text = "You collected a chest!",
                                Icon = "",
                                Duration = 3  -- Adjust the duration of the notification
                            })
                        end
                    end
                end

                wait(1) -- Adjust the wait time between checks
            end
        end

        coroutine.wrap(teleportToChests)() -- Wrap the function in a coroutine to avoid blocking the UI
    end
end })

Tab2:AddToggle('Suicide', { Text = 'Suicide', Callback = function(value)
    local args = {
        [1] = value and "On" or "Off" -- Adjusted to toggle "On" or "Off" based on the value
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WaterDamage"):FireServer(unpack(args))
end })


-- Main Tab - Misc
local TabBox = Tabs.Main:AddRightTabbox()
local Tab1 = TabBox:AddTab('Misc')
Tab1:AddToggle('No Fog', { Text = 'No Fog', Callback = function(value)
    if value then
        local function applyFullBright()
            -- Get necessary services
            local Lighting = game:GetService("Lighting")
        
            -- Set Brightness to a high value
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.Brightness = 2
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 10000
            Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        
            -- Optional: Remove shadows for a clearer view
            for _, descendant in pairs(workspace:GetDescendants()) do
                if descendant:IsA("ShadowMap") then
                    descendant:Destroy()
                end
            end
        
            -- Optional: Adjust the time of day for better visibility
            game.Lighting.TimeOfDay = 12 -- Noon
        
            -- Optional: Disable post-processing effects
            game.Lighting.Changed:Connect(function(property)
                if property == "PostProcessingEffects" then
                    game.Lighting.PostProcessingEffects = {}
                end
            end)
        end
        
        applyFullBright()
    end
end })

-- Main Tab - WorldView
local WorldViewGroup = Tabs.Main:AddLeftGroupbox('WorldView')

local FPSBoostButton = WorldViewGroup:AddButton({
    Text = 'Fps Boost',
    Func = function()
        local success, result = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/malfume/Script/main/fps%20boost"))()
        end)

        if not success then
            warn('Error loading FPS boost script:', result)
        end
    end,
    DoubleClick = true,
    Tooltip = 'It will make your game run faster, but may impact visual quality'
})


-- Additional features
Library:SetWatermarkVisibility(true)

local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark(('Drowned|| HUB | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

Library.KeybindFrame.Visible = true;

Library:OnUnload(function()
    WatermarkConnection:Disconnect()
    print('Unloaded!')
    Library.Unloaded = true
end)

-- UI Settings Tab
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'LeftAlt', NoUI = true, Text = 'Menu keybind' })

-- Set the library's ToggleKeybind to your desired keybind object
Library.ToggleKeybind = Options.MenuKeybind

-- Apply themes and configurations
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:ApplyToTab(Tabs['UI Settings'])
SaveManager:BuildConfigSection(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()
