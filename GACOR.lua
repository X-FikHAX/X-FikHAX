-- X-FikHAX | Blade Ball GACOR Script - Delta Optimized

-- GUI LIB
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "X-FikHAX_UI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 400, 0, 250)
Frame.Position = UDim2.new(0.5, -200, 0.5, -125)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 12)

-- HEADER
local Title = Instance.new("TextLabel", Frame)
Title.Text = "X-FikHAX v1.0"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

-- AUTO PARRY SWITCH
local AutoParry = true
local Toggle = Instance.new("TextButton", Frame)
Toggle.Text = "Auto Parry: ON"
Toggle.Size = UDim2.new(0, 140, 0, 35)
Toggle.Position = UDim2.new(0.5, -70, 0.5, -20)
Toggle.BackgroundColor3 = Color3.fromRGB(40, 170, 90)
Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.Font = Enum.Font.GothamBold
Toggle.TextSize = 14
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0, 6)

Toggle.MouseButton1Click:Connect(function()
    AutoParry = not AutoParry
    Toggle.Text = AutoParry and "Auto Parry: ON" or "Auto Parry: OFF"
    Toggle.BackgroundColor3 = AutoParry and Color3.fromRGB(40, 170, 90) or Color3.fromRGB(180, 40, 40)
end)

-- MOBILE-FRIENDLY AUTO PARRY ENGINE
task.spawn(function()
    while task.wait(0.1) do
        if not AutoParry then continue end

        local ball = workspace:FindFirstChild("Ball")
        local char = game.Players.LocalPlayer.Character
        if not (ball and ball:FindFirstChild("Velocity")) then continue end
        if not (char and char:FindFirstChild("HumanoidRootPart")) then continue end

        local dist = (ball.Position - char.HumanoidRootPart.Position).Magnitude
        local speed = ball.Velocity.Magnitude

        if dist < 25 and speed > 40 then
            local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
            if remote and remote:FindFirstChild("ParryButtonPress") then
                remote.ParryButtonPress:Fire()
            end
        end
    end
end)

-- CLOSE BUTTON
local Close = Instance.new("TextButton", Frame)
Close.Text = "✖"
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -35, 0, 5)
Close.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
Close.TextColor3 = Color3.new(1, 1, 1)
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 6)

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
