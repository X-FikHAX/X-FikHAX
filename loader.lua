local key = "Fik4Ever"
local url = "https://raw.githubusercontent.com/X-FikHAX/X-FikHAX/main/X-FikHAX_main.lua"

if not isfile or not game then return end

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "X-FikHAX Loader"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 100)
frame.Position = UDim2.new(0.5, -150, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.8, 0, 0.3, 0)
box.Position = UDim2.new(0.1, 0, 0.2, 0)
box.PlaceholderText = "Enter Key"
box.Text = ""
box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
box.TextColor3 = Color3.new(1, 1, 1)

local button = Instance.new("TextButton", frame)
button.Text = "Unlock"
button.Size = UDim2.new(0.8, 0, 0.3, 0)
button.Position = UDim2.new(0.1, 0, 0.6, 0)
button.BackgroundColor3 = Color3.fromRGB(70, 130, 180)

button.MouseButton1Click:Connect(function()
    if box.Text == key then
        gui:Destroy()
        loadstring(game:HttpGet(url))()
    else
        button.Text = "Wrong Key!"
        wait(1)
        button.Text = "Unlock"
    end
end)
