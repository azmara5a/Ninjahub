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
-- NinjaHub - Full GUI with Fruit Radar, Island TP, Filter, Auto Collect

local Settings = {
    FruitFilter = {"Mythical", "Legendary"},
    AutoCollect = true
}

local Fruits = {
    {Name="Kitsune", Rarity="Mythical"},
    {Name="Dragon", Rarity="Mythical"},
    {Name="Leopard", Rarity="Mythical"},
    {Name="T-Rex", Rarity="Mythical"},
    {Name="Dough", Rarity="Mythical"},
    {Name="Yeti", Rarity="Mythical"},
    {Name="Gas", Rarity="Legendary"},
    {Name="Love", Rarity="Legendary"},
    {Name="Buddha", Rarity="Legendary"},
    {Name="Venom", Rarity="Legendary"},
    {Name="Shadow", Rarity="Legendary"},
    {Name="Ice", Rarity="Rare"},
    {Name="Light", Rarity="Rare"},
    {Name="Dark", Rarity="Rare"},
    {Name="Flame", Rarity="Rare"},
    {Name="Magma", Rarity="Rare"},
    {Name="Smoke", Rarity="Common"},
    {Name="Spin", Rarity="Common"},
    {Name="Chop", Rarity="Common"},
    {Name="Bomb", Rarity="Common"},
    {Name="Kilo", Rarity="Common"}
}

local Islands = {
    "Starter Island", "Jungle", "Pirate Village", "Desert", "Frozen Village",
    "Marine Fortress", "Sky Islands", "Colosseum", "Magma Village", "Underwater City",
    "Fountain City", "The Café", "Green Zone", "Snow Mountain", "Hot and Cold",
    "Cursed Ship", "Ice Castle", "Forgotten Island", "Port Town", "Hydra Island",
    "Great Tree", "Castle on the Sea", "Haunted Castle", "Sea of Treats"
}

-- GUI Başlat
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "NinjaHubUI"
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

-- Aç/Kapa Tuşu
local ToggleKey = Enum.KeyCode.RightControl
local open = true
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == ToggleKey then
        open = not open
        MainFrame.Visible = open
    end
end)

-- Başlık
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.Text = "Ninja Hub"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

-- Fruit Radar Paneli
local FruitPanel = Instance.new("ScrollingFrame", MainFrame)
FruitPanel.Size = UDim2.new(0.5, -10, 1, -40)
FruitPanel.Position = UDim2.new(0, 5, 0, 35)
FruitPanel.CanvasSize = UDim2.new(0, 0, 0, #Fruits * 25)
FruitPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
FruitPanel.BorderSizePixel = 0
FruitPanel.ScrollBarThickness = 5

for i, fruit in ipairs(Fruits) do
    if table.find(Settings.FruitFilter, fruit.Rarity) then
        local label = Instance.new("TextLabel", FruitPanel)
        label.Size = UDim2.new(1, -10, 0, 25)
        label.Position = UDim2.new(0, 5, 0, (i - 1) * 25)
        label.Text = fruit.Name .. " (" .. fruit.Rarity .. ")"
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.Gotham
        label.TextSize = 14
        label.TextXAlignment = Enum.TextXAlignment.Left
    end
end

-- Island TP Paneli
local IslandPanel = Instance.new("ScrollingFrame", MainFrame)
IslandPanel.Size = UDim2.new(0.5, -10, 1, -40)
IslandPanel.Position = UDim2.new(0.5, 5, 0, 35)
IslandPanel.CanvasSize = UDim2.new(0, 0, 0, #Islands * 25)
IslandPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
IslandPanel.BorderSizePixel = 0
IslandPanel.ScrollBarThickness = 5

for i, island in ipairs(Islands) do
    local btn = Instance.new("TextButton", IslandPanel)
    btn.Size = UDim2.new(1, -10, 0, 25)
    btn.Position = UDim2.new(0, 5, 0, (i - 1) * 25)
    btn.Text = island
    btn.TextColor3 = Color3.fromRGB(200, 200, 255)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.MouseButton1Click:Connect(function()
        local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = CFrame.new(math.random(-2000, 2000), 150, math.random(-2000, 2000)) -- örnek konum
        end
    end)
end

-- Auto Collect İşlemi (sadece örnek mantık)
if Settings.AutoCollect then
    task.spawn(function()
        while true do
            wait(3)
            for _, fruit in pairs(workspace:GetDescendants()) do
                if fruit:IsA("Tool") and fruit:FindFirstChild("Handle") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, fruit.Handle, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, fruit.Handle, 1)
                end
            end
        end
    end)
end
-- GUI Servisi
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

-- GUI Oluştur
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "NinjaHubGUI"
ScreenGui.ResetOnSpawn = false

-- Ana Frame
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Name = "MainFrame"

-- UI Corner
local corner = Instance.new("UICorner", MainFrame)
corner.CornerRadius = UDim.new(0, 12)

-- Aç/Kapa Tuşu (Right Control)
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.RightControl then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- Sekmeler
local TabHolder = Instance.new("Frame", MainFrame)
TabHolder.Size = UDim2.new(0, 120, 1, 0)
TabHolder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", TabHolder).CornerRadius = UDim.new(0, 10)

-- Butonlar
local function createTabButton(text, callback)
    local btn = Instance.new("TextButton", TabHolder)
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = text
    btn.MouseButton1Click:Connect(callback)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    return btn
end

-- Panel alanı
local Panel = Instance.new("Frame", MainFrame)
Panel.Size = UDim2.new(1, -130, 1, -10)
Panel.Position = UDim2.new(0, 130, 0, 5)
Panel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", Panel).CornerRadius = UDim.new(0, 10)

-- Tüm içeriği temizleme
local function clearPanel()
    for _, child in pairs(Panel:GetChildren()) do
        if not child:IsA("UICorner") then
            child:Destroy()
        end
    end
end

-- Fruit Radar Panel
local function openFruitRadar()
    clearPanel()

    local scroll = Instance.new("ScrollingFrame", Panel)
    scroll.Size = UDim2.new(1, 0, 1, 0)
    scroll.CanvasSize = UDim2.new(0, 0, 0, #Fruits * 30)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 4

    for _, fruit in pairs(Fruits) do
        if table.find(Settings.FruitFilter, fruit.Rarity) then
            local btn = Instance.new("TextButton", scroll)
            btn.Size = UDim2.new(1, -10, 0, 30)
            btn.Position = UDim2.new(0, 5, 0, (_ - 1) * 32)
            btn.Text = fruit.Name .. " [" .. fruit.Rarity .. "]"
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

            btn.MouseButton1Click:Connect(function()
                warn("Meyve seçildi: " .. fruit.Name)
            end)
        end
    end
end

-- Island TP Panel
local function openIslandTP()
    clearPanel()

    local scroll = Instance.new("ScrollingFrame", Panel)
    scroll.Size = UDim2.new(1, 0, 1, 0)
    scroll.CanvasSize = UDim2.new(0, 0, 0, #Islands * 30)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 4

    for i, island in ipairs(Islands) do
        local btn = Instance.new("TextButton", scroll)
        btn.Size = UDim2.new(1, -10, 0, 30)
        btn.Position = UDim2.new(0, 5, 0, (i - 1) * 32)
        btn.Text = island
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

        btn.MouseButton1Click:Connect(function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char:MoveTo(Vector3.new(math.random(100, 1000), 10, math.random(100, 1000)))
                warn("Teleported to: " .. island .. " (Dummy Position)")
            end
        end)
    end
end

-- Auto Collect Script
if Settings.AutoCollect then
    task.spawn(function()
        while task.wait(5) do
            for _, fruit in pairs(Fruits) do
                if table.find(Settings.FruitFilter, fruit.Rarity) then
                    warn("Auto Collect çalışıyor: " .. fruit.Name)
                    -- Burada gerçek collect fonksiyonu yerleştirilebilir
                end
            end
        end
    end)
end

-- Sekmeleri Oluştur
createTabButton("Fruit Radar", openFruitRadar)
createTabButton("Island TP", openIslandTP)
