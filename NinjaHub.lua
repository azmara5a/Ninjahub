-- Ninja Hub GUI (Mobil uyumlu koyu tema)
local NinjaHub = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Tabs = Instance.new("Frame")
local FruitRadarBtn = Instance.new("TextButton")
local IslandTPBtn = Instance.new("TextButton")

NinjaHub.Name = "NinjaHub"
NinjaHub.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Parent = NinjaHub
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Selectable = true

UICorner.Parent = MainFrame

Title.Name = "Title"
Title.Parent = MainFrame
Title.Text = "⚔️ Ninja Hub"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1

Tabs.Name = "Tabs"
Tabs.Parent = MainFrame
Tabs.Position = UDim2.new(0, 0, 0, 40)
Tabs.Size = UDim2.new(1, 0, 0, 30)
Tabs.BackgroundTransparency = 1

FruitRadarBtn.Name = "FruitRadarBtn"
FruitRadarBtn.Parent = Tabs
FruitRadarBtn.Size = UDim2.new(0, 100, 1, 0)
FruitRadarBtn.Position = UDim2.new(0, 10, 0, 0)
FruitRadarBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
FruitRadarBtn.Text = "🍎 Fruit Radar"
FruitRadarBtn.Font = Enum.Font.Gotham
FruitRadarBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FruitRadarBtn.TextSize = 14

IslandTPBtn.Name = "IslandTPBtn"
IslandTPBtn.Parent = Tabs
IslandTPBtn.Size = UDim2.new(0, 100, 1, 0)
IslandTPBtn.Position = UDim2.new(0, 120, 0, 0)
IslandTPBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
IslandTPBtn.Text = "🌊 Island TP"
IslandTPBtn.Font = Enum.Font.Gotham
IslandTPBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
IslandTPBtn.TextSize = 14
