local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local pgui = player:WaitForChild("PlayerGui")

if pgui:FindFirstChild("NakamuraHubUltimate") then
    pgui.NakamuraHubUltimate:Destroy()
end

local FolderName = "NakamuraHub_Data"
pcall(function() if makefolder then makefolder(FolderName) end end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NakamuraHubUltimate"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = pgui

local AimbotEnabled = false
local WallCheckEnabled = true
local TeamCheckEnabled = true
local KillCheckEnabled = true
local infJumpEnabled = false
local WaypointData = {}
local highlights = {}
local PlaceId = game.PlaceId
local FilePath = FolderName .. "/" .. PlaceId .. ".json"

local function SaveWaypoints()
    pcall(function() if writefile then writefile(FilePath, HttpService:JSONEncode(WaypointData)) end end)
end
pcall(function() if isfile and isfile(FilePath) then WaypointData = HttpService:JSONDecode(readfile(FilePath)) end end)

local IconButton = Instance.new("ImageButton")
IconButton.Size = UDim2.new(0, 50, 0, 50)
IconButton.Position = UDim2.new(0, 30, 0, 30)
IconButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
IconButton.Image = "rbxassetid://17316645495"
IconButton.Parent = ScreenGui
Instance.new("UICorner", IconButton).CornerRadius = UDim.new(0, 10)
IconButton.Active = true
IconButton.Draggable = true

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 550, 0, 480)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 0.4
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

local SidebarScroll = Instance.new("ScrollingFrame")
SidebarScroll.Size = UDim2.new(0, 130, 1, -20)
SidebarScroll.Position = UDim2.new(0, 5, 0, 10)
SidebarScroll.BackgroundTransparency = 1
SidebarScroll.BorderSizePixel = 0
SidebarScroll.ScrollBarThickness = 2
SidebarScroll.Parent = MainFrame
local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Parent = SidebarScroll
SidebarLayout.Padding = UDim.new(0, 5)

local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, -150, 1, -60)
ContentContainer.Position = UDim2.new(0, 140, 0, 50)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 250, 0, 40)
Title.Position = UDim2.new(0, 140, 0, 5)
Title.Text = "中村Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 0)
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

local Tabs = {}
local TabButtons = {}
local function CreateTab(name)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.Text = name
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.Parent = SidebarScroll
    Instance.new("UICorner", btn)
    local page = Instance.new("ScrollingFrame")
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.ScrollBarThickness = 4
    page.Parent = ContentContainer
    local pageList = Instance.new("UIListLayout")
    pageList.Parent = page
    pageList.Padding = UDim.new(0, 8)
    btn.MouseButton1Click:Connect(function()
        for _, p in pairs(Tabs) do p.Visible = false end
        for _, b in pairs(TabButtons) do b.BackgroundColor3 = Color3.fromRGB(60, 60, 60) b.TextColor3 = Color3.new(1,1,1) end
        page.Visible = true
        btn.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
        btn.TextColor3 = Color3.new(0,0,0)
    end)
    Tabs[name] = page
    TabButtons[name] = btn
    return page
end

local MainTab = CreateTab("Main")
local CombatTab = CreateTab("Combat")
local PlayerTPTab = CreateTab("Player TP")
local DiagnosticTab = CreateTab("Diagnostic")
local WaypointTab = CreateTab("Waypoint")
local CreditTab = CreateTab("Credits")

local Welcome = Instance.new("TextLabel")
Welcome.Size = UDim2.new(1, -10, 0, 100)
Welcome.Text = "Welcome back,\nponitan3776 & 相棒!"
Welcome.TextColor3 = Color3.new(1,1,1)
Welcome.TextSize = 25
Welcome.Font = Enum.Font.GothamBold
Welcome.BackgroundTransparency = 1
Welcome.Parent = MainTab

local function CreateToggle(name, default, parent, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 38)
    btn.BackgroundColor3 = default and Color3.fromRGB(0, 120, 0) or Color3.fromRGB(120, 0, 0)
    btn.Text = name .. ": " .. (default and "ON" or "OFF")
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.Parent = parent
    Instance.new("UICorner", btn)
    local state = default
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = name .. ": " .. (state and "ON" or "OFF")
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 120, 0) or Color3.fromRGB(120, 0, 0)
        callback(state)
    end)
end

CreateToggle("Master Aimbot", false, CombatTab, function(s) AimbotEnabled = s end)
CreateToggle("Wall Check", true, CombatTab, function(s) WallCheckEnabled = s end)
CreateToggle("Team Check", true, CombatTab, function(s) TeamCheckEnabled = s end)
CreateToggle("Kill Check", true, CombatTab, function(s) KillCheckEnabled = s end)

local function CreateInput(name, placeholder, callback)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, -10, 0, 40) f.BackgroundTransparency = 1 f.Parent = DiagnosticTab
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(0.4, 0, 1, 0) l.Text = name l.TextColor3 = Color3.new(1,1,1) l.BackgroundTransparency = 1 l.Parent = f
    local i = Instance.new("TextBox")
    i.Size = UDim2.new(0.5, 0, 0.8, 0) i.Position = UDim2.new(0.45, 0, 0.1, 0) i.BackgroundColor3 = Color3.fromRGB(50,50,50) i.TextColor3 = Color3.new(1,1,1) i.PlaceholderText = placeholder i.Parent = f
    Instance.new("UICorner", i)
    i.FocusLost:Connect(function() local n = tonumber(i.Text) if n then callback(n) end end)
end
CreateInput("SPEED:", "16", function(v) if player.Character then player.Character.Humanoid.WalkSpeed = v end end)
CreateInput("JUMP:", "50", function(v) if player.Character then player.Character.Humanoid.UseJumpPower = true player.Character.Humanoid.JumpPower = v end end)
CreateToggle("Infinite Jump", false, DiagnosticTab, function(s) infJumpEnabled = s end)

local function UpdateTP()
    for _, c in pairs(PlayerTPTab:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player then
            local b = Instance.new("TextButton")
            b.Size = UDim2.new(1, -10, 0, 35) b.BackgroundColor3 = Color3.fromRGB(40,40,40) b.TextColor3 = Color3.new(1,1,1)
            b.Text = "TP: " .. p.DisplayName b.Parent = PlayerTPTab
            Instance.new("UICorner", b)
            b.MouseButton1Click:Connect(function() if p.Character then player.Character:MoveTo(p.Character.HumanoidRootPart.Position) end end)
        end
    end
end
UpdateTP() Players.PlayerAdded:Connect(UpdateTP) Players.PlayerRemoving:Connect(UpdateTP)

local function BuildWaypoints()
    for _, c in pairs(WaypointTab:GetChildren()) do if not c:IsA("UIListLayout") then c:Destroy() end end
    for i, d in pairs(WaypointData) do
        local f = Instance.new("Frame") f.Size = UDim2.new(1,-10,0,45) f.BackgroundColor3 = Color3.fromRGB(30,30,30) f.Parent = WaypointTab
        Instance.new("UICorner", f)
        local g = Instance.new("TextButton") g.Size = UDim2.new(0.7,-5,0.8,0) g.Position = UDim2.new(0,5,0.1,0) g.BackgroundColor3 = Color3.fromRGB(255,255,0) g.Text = d.name g.Parent = f
        Instance.new("UICorner", g)
        local x = Instance.new("TextButton") x.Size = UDim2.new(0.25,-5,0.8,0) x.Position = UDim2.new(0.7,5,0.1,0) x.BackgroundColor3 = Color3.fromRGB(150,0,0) x.Text = "DEL" x.TextColor3 = Color3.new(1,1,1) x.Parent = f
        Instance.new("UICorner", x)
        g.MouseButton1Click:Connect(function() if player.Character then player.Character.HumanoidRootPart.CFrame = CFrame.new(d.pos[1], d.pos[2], d.pos[3]) end end)
        x.MouseButton1Click:Connect(function() table.remove(WaypointData, i) SaveWaypoints() BuildWaypoints() end)
    end
    local nf = Instance.new("Frame") nf.Size = UDim2.new(1,-10,0,45) nf.BackgroundTransparency = 1 nf.Parent = WaypointTab
    local nb = Instance.new("TextBox") nb.Size = UDim2.new(0.7,-5,0.8,0) nb.Position = UDim2.new(0,5,0.1,0) nb.PlaceholderText = "Name..." nb.BackgroundColor3 = Color3.fromRGB(50,50,50) nb.TextColor3 = Color3.new(1,1,1) nb.Parent = nf
    Instance.new("UICorner", nb)
    local ab = Instance.new("TextButton") ab.Size = UDim2.new(0.25,-5,0.8,0) ab.Position = UDim2.new(0.7,5,0.1,0) ab.BackgroundColor3 = Color3.fromRGB(0,150,0) ab.Text = "ADD" ab.TextColor3 = Color3.new(1,1,1) ab.Parent = nf
    Instance.new("UICorner", ab)
    ab.MouseButton1Click:Connect(function() if player.Character and nb.Text ~= "" then local p = player.Character.HumanoidRootPart.Position table.insert(WaypointData, {name=nb.Text, pos={p.X,p.Y,p.Z}}) SaveWaypoints() BuildWaypoints() end end)
end
BuildWaypoints()

local function AddCredit(r, n)
    local l = Instance.new("TextLabel") l.Size = UDim2.new(1,-10,0,30) l.BackgroundTransparency = 1 l.Text = "<b>"..r.."</b>: "..n l.TextColor3 = Color3.new(1,1,1) l.RichText = true l.Font = Enum.Font.GothamMedium l.Parent = CreditTab
end
AddCredit("Owner", "ponitan3776")
AddCredit("Special Advisor", "中村")
AddCredit("AI Support", "岡本")

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.TextSize = 25
CloseBtn.Parent = MainFrame
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local function createESP(plr)
    if plr == player then return end
    local highlight = Instance.new("Highlight")
    highlight.Name = "NakamuraESP"
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    local function update() 
        if plr.Character then 
            highlight.Parent = plr.Character 
            if not table.find(highlights, highlight) then table.insert(highlights, highlight) end
        end 
    end
    plr.CharacterAdded:Connect(update) update()
end
for _, p in pairs(Players:GetPlayers()) do createESP(p) end
Players.PlayerAdded:Connect(createESP)

RunService.RenderStepped:Connect(function()
    local color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
    for i, hl in pairs(highlights) do
        if hl and hl.Parent then hl.FillColor = color hl.OutlineColor = color else table.remove(highlights, i) end
    end
    
    if AimbotEnabled and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local myPos = player.Character.HumanoidRootPart.Position
        local target = nil
        local shortestStuds = math.huge -- 相棒のアイデア！スタッズ距離で計算だ！
        
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= player and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") then
                -- 設定されたチェックを全てクリアするか判定
                if KillCheckEnabled and v.Character.Humanoid.Health <= 0 then continue end
                if TeamCheckEnabled and v.Team == player.Team then continue end
                
                local enemyPos = v.Character.Head.Position
                local _, onScreen = camera:WorldToViewportPoint(enemyPos)
                
                -- 画面内にいて、かつ壁貫通チェックがONなら壁の有無も確認
                if onScreen then
                    if WallCheckEnabled then
                        local parts = camera:GetPartsObscuringTarget({enemyPos}, {player.Character, v.Character})
                        if #parts > 0 then continue end
                    end
                    
                    -- 物理的な距離（スタッズ）を計算
                    local distance = (myPos - enemyPos).Magnitude
                    if distance < shortestStuds then
                        shortestStuds = distance
                        target = v
                    end
                end
            end
        end
        if target then camera.CFrame = CFrame.new(camera.CFrame.Position, target.Character.Head.Position) end
    end
end)

UserInputService.JumpRequest:Connect(function() if infJumpEnabled and player.Character then player.Character.Humanoid:ChangeState("Jumping") end end)
IconButton.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

MainTab.Visible = true
TabButtons["Main"].BackgroundColor3 = Color3.fromRGB(255, 255, 0)
TabButtons["Main"].TextColor3 = Color3.new(0,0,0)
