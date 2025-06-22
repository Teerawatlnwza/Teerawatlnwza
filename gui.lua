local correctKey = "Key-Premium-pro-MQP9-KMF7"

-- สร้าง UI ใส่คีย์
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "KeyUI"
local frame = Instance.new("Frame", gui)
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.Position = UDim2.new(0.5,0,0.5,0)
frame.Size = UDim2.new(0,300,0,150)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,8)

local input = Instance.new("TextBox", frame)
input.Size = UDim2.new(0.8,0,0,35)
input.Position = UDim2.new(0.1,0,0.3,0)
input.PlaceholderText = "ใส่คีย์ของคุณ..."
Instance.new("UICorner", input).CornerRadius = UDim.new(0,4)

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0.6,0,0,35)
btn.Position = UDim2.new(0.2,0,0.65,0)
btn.Text = "ยืนยัน"
btn.BackgroundColor3 = Color3.fromRGB(0,170,255)
Instance.new("UICorner", btn).CornerRadius = UDim.new(0,4)

btn.MouseButton1Click:Connect(function()
    if input.Text == correctKey then
        gui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Teerawatlnwza/GrowAGarden-GUI/main/GrowAGardenGUI.lua", true))()
    else
        input.Text = "❌ คีย์ไม่ถูกต้อง"
    end
end)
-- Grow a Garden GUI Script
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "GrowAGardenGUI"

local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.new(0,100,0,40)
toggle.Position = UDim2.new(0,10,0.5,0)
toggle.Text = "🌱 OPEN"
toggle.BackgroundColor3 = Color3.fromRGB(50,150,50)
toggle.TextScaled = true

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,250,0,350)
frame.Position = UDim2.new(0.3,0,0.2,0)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.Visible = false
frame.Draggable = true

local function makeBtn(txt, y, func)
    local b = Instance.new("TextButton", frame)
    b.Size = UDim2.new(0.85,0,0.08,0)
    b.Position = UDim2.new(0.075,0,y,0)
    b.Text = txt
    b.TextScaled = true
    b.BackgroundColor3 = Color3.fromRGB(0,170,255)
    b.MouseButton1Click:Connect(func)
end

makeBtn("🚜 Garden", 0.12, function()
    root.CFrame = CFrame.new(34,2,36)
end)
makeBtn("📦 Sell", 0.21, function()
    root.CFrame = CFrame.new(86,2,0)
end)
makeBtn("🌱 Seed", 0.30, function()
    root.CFrame = CFrame.new(86,2,-28)
end)
makeBtn("🛠 Gear", 0.39, function()
    root.CFrame = CFrame.new(-287,2,-15)
end)
makeBtn("🥚 Egg", 0.48, function()
    root.CFrame = CFrame.new(-286,2,-3)
end)

local speedOn = false
makeBtn("🏃 Speed: OFF", 0.58, function()
    speedOn = not speedOn
    humanoid.WalkSpeed = speedOn and 100 or 16
    eventHolder = speedOn
end)

local jumpOn = false
makeBtn("🦘 Jump: OFF", 0.67, function()
    jumpOn = not jumpOn
    humanoid.JumpPower = jumpOn and 120 or 50
    eventHolder = jumpOn
end)

local flyOn = false
local flyConn
makeBtn("🕊 Fly: OFF", 0.76, function()
    flyOn = not flyOn
    if flyOn then
        local bv = Instance.new("BodyVelocity", root)
        bv.Name = "FlyForce"
        bv.MaxForce = Vector3.new(1e5,1e5,1e5)
        bv.Velocity = humanoid.MoveDirection * 0
        flyConn = game:GetService("RunService").RenderStepped:Connect(function()
            bv.Velocity = humanoid.MoveDirection * 100
        end)
    else
        if root:FindFirstChild("FlyForce") then root.FlyForce:Destroy() end
        if flyConn then flyConn:Disconnect() end
    end
end)

makeBtn("❌ Close", 0.85, function()
    frame.Visible = false
    toggle.Text = "🌱 OPEN"
end)

toggle.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
    toggle.Text = frame.Visible and "🌱 CLOSE" or "🌱 OPEN"
end)
