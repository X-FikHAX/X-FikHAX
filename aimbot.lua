-- South Bronx Aimbot (Aim to Head) by Fik
-- Tombol toggle: E

local AimbotKey = Enum.KeyCode.E
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")

local aiming = false

function getClosestPlayer()
    local closestDistance = math.huge
    local closestPlayer = nil

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local pos = player.Character.Head.Position
            local distance = (Camera.CFrame.Position - pos).Magnitude

            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = player
            end
        end
    end

    return closestPlayer
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == AimbotKey then
        aiming = not aiming
    end
end)

RunService.RenderStepped:Connect(function()
    if aiming then
        local target = getClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
        end
    end
end)

print("Aimbot ke Head aktif - Tekan [E] untuk toggle")
