local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local workspaceEntities = game.Workspace.entities

local function findClosestBandit()
    local closestBandit = nil
    local minDistance = math.huge

    for _, entity in ipairs(workspaceEntities:GetChildren()) do
        if (entity.Name == "Fishman" or entity.Name == "Colosseum Boss") and entity:FindFirstChild("HumanoidRootPart") then
            local banditPosition = entity:FindFirstChild("HumanoidRootPart").Position
            local distance = (banditPosition - humanoidRootPart.Position).Magnitude

            if distance < minDistance then
                minDistance = distance
                closestBandit = entity
            end
        end
    end

    return closestBandit
end

local success, closestBandit = pcall(findClosestBandit)

if success then
    print("The closest bandit is: " .. closestBandit.Name)
else
    print("An error occurred: " .. closestBandit)
end

local function rotatePlayerTowardsBandit(banditPosition)
    local direction = (banditPosition - humanoidRootPart.Position).unit
    local rotationAngle = math.atan2(-direction.Z, direction.X)
    local lookDownAngle = math.atan2((banditPosition.Y + 10) - humanoidRootPart.Position.Y, direction.Magnitude)
    humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position, banditPosition)
        * CFrame.Angles(lookDownAngle, rotationAngle + math.rad(90), 0)
end

local closestBandit = findClosestBandit()

local v = 100
local tween

while wait() do
    local success, closestBandit = pcall(findClosestBandit)

    if success and closestBandit then
        local banditRootPart = closestBandit:FindFirstChild("HumanoidRootPart")
        if banditRootPart then
            local banditPosition = banditRootPart.Position
            local banditBackPosition = banditPosition - banditRootPart.CFrame.LookVector * 5

            local w = math.round(math.abs((humanoidRootPart.Position - banditBackPosition).Magnitude)) / tonumber(v)

            tween = TweenService:Create(
                humanoidRootPart,
                TweenInfo.new(w, Enum.EasingStyle.Linear),
                { CFrame = CFrame.new(banditBackPosition, banditPosition) }
            )
            tween:Play()

            local args = {
                [1] = "M1",
            }

            game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("combat"):FireServer(unpack(args))

            wait()
        else
            print("Bandit has been destroyed.")
        end
    else
        print("No Bandit found in the entities.")

        -- Display a notification
        local notification = game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Bandit Patrol",
            Text = "No Bandit found in the entities.",
            Duration = 3,
        })
    end
end
