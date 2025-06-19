-- X-FikHAX - Universal Auto Parry v1.1

-- Simple GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
local btn = Instance.new("TextButton", gui)
btn.Size = UDim2.new(0, 160, 0, 35)
btn.Position = UDim2.new(0.5, -80, 0.85, 0)
btn.Text = "Auto Parry: ON"
btn.BackgroundColor3 = Color3.fromRGB(40, 170, 90)
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 14

local auto = true
btn.MouseButton1Click:Connect(function()
    auto = not auto
    btn.Text = auto and "Auto Parry: ON" or "Auto Parry: OFF"
    btn.BackgroundColor3 = auto and Color3.fromRGB(40,170,90) or Color3.fromRGB(170,40,40)
end)

-- Universal Auto Parry
task.spawn(function()
    while task.wait(0.1) do
        if not auto then continue end

        local char = game.Players.LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then continue end

        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.Name:lower():find("ball") then
                local dist = (v.Position - char.HumanoidRootPart.Position).Magnitude
                local vel = v.Velocity.Magnitude

                if dist < 25 and vel > 40 then
                    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
                    if remote then
                        for _, r in pairs(remote:GetChildren()) do
                            if r:IsA("RemoteEvent") and r.Name:lower():find("parry") then
                                r:Fire()
                            end
                        end
                    end
                end
            end
        end
    end
end)
