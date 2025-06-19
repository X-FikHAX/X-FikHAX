-- X-FikHAX | Blade Ball Script GUI with Key System, Obfuscation Ready -- Developer: Fik4Ever

-- Key system (simple version) local Key = "FIK-1234" local function getKey() return "FIK-1234" -- Replace with actual key storage or input end

if getKey() ~= Key then game.Players.LocalPlayer:Kick("[X-FikHAX] Invalid Key") return end

-- GUI local ScreenGui = Instance.new("ScreenGui", game.CoreGui) ScreenGui.Name = "X-FikHAX_UI"

local Frame = Instance.new("Frame", ScreenGui) Frame.Size = UDim2.new(0, 400, 0, 250) Frame.Position = UDim2.new(0.5, -200, 0.5, -125) Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) Frame.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Frame) Title.Text = "X-FikHAX v1.0" Title.Size = UDim2.new(1, 0, 0, 30) Title.BackgroundTransparency = 1 Title.TextColor3 = Color3.new(1, 1, 1) Title.Font = Enum.Font.GothamBold Title.TextSize = 18

-- Auto Parry Feature local AutoParry = true

local Toggle = Instance.new("TextButton", Frame) Toggle.Text = "Auto Parry: ON" Toggle.Size = UDim2.new(0, 140, 0, 35) Toggle.Position = UDim2.new(0.5, -70, 0, 50) Toggle.BackgroundColor3 = Color3.fromRGB(40, 170, 90) Toggle.TextColor3 = Color3.new(1, 1, 1) Toggle.Font = Enum.Font.GothamBold Toggle.TextSize = 14 Toggle.MouseButton1Click:Connect(function() AutoParry = not AutoParry Toggle.Text = "Auto Parry: " .. (AutoParry and "ON" or "OFF") Toggle.BackgroundColor3 = AutoParry and Color3.fromRGB(40, 170, 90) or Color3.fromRGB(180, 40, 40) end)

-- Core Auto Parry Script spawn(function() local rs = game:GetService("RunService") rs.Heartbeat:Connect(function() if not AutoParry then return end

local ball = workspace:FindFirstChild("Ball")
    if not ball or not ball:FindFirstChild("Velocity") then return end

    local char = game.Players.LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end

    local dist = (ball.Position - char.HumanoidRootPart.Position).Magnitude
    local velocity = ball.Velocity.Magnitude

    if dist < 25 and velocity > 40 then
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ParryButtonPress"):Fire()
        wait(0.15)
    end
end)

end)

-- Close Button local Close = Instance.new("TextButton", Frame) Close.Text = "✕" Close.Size = UDim2.new(0, 30, 0, 30) Close.Position = UDim2.new(1, -35, 0, 5) Close.BackgroundColor3 = Color3.fromRGB(200, 50, 50) Close.TextColor3 = Color3.new(1, 1, 1) Close.Font = Enum.Font.GothamBold Close.TextSize = 14 Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

