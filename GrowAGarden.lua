-- 🔐 กำหนดคีย์
local correctKey = "Key-Premium-pro-MQP9-KMF7"

-- โหลด UI ใส่คีย์
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "KeyUI"
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.5, -150, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(1, 0, 0.3, 0)
label.Text = "🔐 ใส่คีย์เพื่อใช้งาน"
label.TextColor3 = Color3.new(1,1,1)
label.BackgroundTransparency = 1
label.Font = Enum.Font.GothamBold
label.TextSize = 18

local input = Instance.new("TextBox", frame)
input.Size = UDim2.new(0.8, 0, 0.25, 0)
input.Position = UDim2.new(0.1, 0, 0.35, 0)
input.PlaceholderText = "วางคีย์ของคุณที่นี่..."
input.BackgroundColor3 = Color3.fromRGB(45,45,45)
input.TextColor3 = Color3.new(1,1,1)
input.Font = Enum.Font.Gotham
input.TextSize = 14
input.BorderSizePixel = 0
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 6)

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.6, 0, 0.2, 0)
button.Position = UDim2.new(0.2, 0, 0.7, 0)
button.Text = "✅ ยืนยัน"
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.TextColor3 = Color3.new(1,1,1)
button.Font = Enum.Font.GothamBold
button.TextSize = 16
Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)

local function loadMainGUI()
	-- >>> วาง Grow a Garden GUI ที่คุณมีไว้ตรงนี้
	-- หากต้องการให้ผมวางส่วนนี้อีก แจ้งได้เลยครับ
end

button.MouseButton1Click:Connect(function()
	if input.Text == correctKey then
		gui:Destroy()
		loadMainGUI()
	else
		button.Text = "❌ คีย์ผิด"
		wait(1)
		button.Text = "✅ ยืนยัน"
	end
end)
