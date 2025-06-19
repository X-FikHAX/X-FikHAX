-- X-FikHAX | Blade Ball Working Auto Parry - Delta Compatible

local UIS = game:GetService("UserInputService")
local Rep = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local chr = lp.Character or lp.CharacterAdded:Wait()
local hrp = chr:WaitForChild("HumanoidRootPart")
local remote = Rep:WaitForChild("Remotes"):FindFirstChild("ParryButtonPress")

-- GUI toggle
local screenGui = Instance.new("ScreenGui", game.CoreGui)
local btn = Instance.new("TextButton", screenGui)
btn.Size = UDim2.new(0, 160, 0, 35)
btn.Position = UDim2.new(0.5, -80, 0.85, 0)
btn.Text = "Auto Parry: ON"
btn.BackgroundColor3 = Color3.fromRGB(40, 170, 90)
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 14

local active = true
btn.MouseButton1Click:Connect(function()
    active = not active
    btn.Text = active and "Auto Parry: ON" or "Auto Parry: OFF"
    btn.BackgroundColor3 = active and Color3.fromRGB(40,170,90) or Color3.fromRGB(170,40,40)
end)

-- Auto parry loop
task.spawn(function()
    while task.wait(0.05) do
        if not active then continue end

        local ball = workspace:FindFirstChild("Ball")
        if not ball or not ball:IsA("BasePart") then continue end

        chr = lp.Character or lp.CharacterAdded:Wait()
        hrp = chr:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end

        local dist = (ball.Position - hrp.Position).Magnitude
        local speed = ball.Velocity.Magnitude

        if dist < 23 and speed > 35 then
            if remote then
                remote:Fire()
            end
        end
    end
end)
