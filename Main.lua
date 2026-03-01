local _0xA=game:GetService("Players")repeat task.wait() until _0xA.LocalPlayer
local _0xB=game:GetService("RunService")local _0xC=game:GetService("UserInputService")local _0xD=game:GetService("HttpService")local _0xE=game:GetService("TweenService")
local _0xF=_0xA.LocalPlayer
local _0xG=_0xF:WaitForChild("PlayerGui")local _0xH=workspace.CurrentCamera
if _0xG:FindFirstChild("NakamuraHubUltimate") then _0xG.NakamuraHubUltimate:Destroy() end
local _0xI = "NakamuraHub_Data"
pcall(function() if makefolder then makefolder(_0xI) end end)
local _0xJ = Instance.new("ScreenGui")_0xJ.Name="NakamuraHubUltimate" _0xJ.ResetOnSpawn=false _0xJ.DisplayOrder=999 _0xJ.Parent=_0xG
local _0xK, _0xL, _0xM, _0xN, _0xO = false, true, true, true, false
local _0xP, _0xQ, _0xR = {}, {}, game.PlaceId
local _0xS = _0xI .. "/" .. _0xR .. ".json"
local function _0xT() pcall(function() if writefile then writefile(_0xS, _0xD:JSONEncode(_0xP)) end end) end
pcall(function() if isfile and isfile(_0xS) then _0xP = _0xD:JSONDecode(readfile(_0xS)) end end)
local _0xU = Instance.new("ImageButton")_0xU.Size=UDim2.new(0,50,0,50) _0xU.Position=UDim2.new(0,30,0,30) _0xU.BackgroundColor3=Color3.fromRGB(0,0,0) _0xU.Image="rbxassetid://17316645495" _0xU.Parent=_0xJ
Instance.new("UICorner",_0xU).CornerRadius=UDim.new(0,10)_0xU.Active=true _0xU.Draggable=true
local _0xV = Instance.new("Frame")_0xV.Size=UDim2.new(0,550,0,480) _0xV.Position=UDim2.new(0.5,-275,0.5,-240) _0xV.BackgroundColor3=Color3.fromRGB(0,0,0) _0xV.BackgroundTransparency=0.4 _0xV.Active=true _0xV.Draggable=true _0xV.Parent=_0xJ
Instance.new("UICorner",_0xV).CornerRadius=UDim.new(0,12)
local _0xW = Instance.new("ScrollingFrame")_0xW.Size=UDim2.new(0,130,1,-20) _0xW.Position=UDim2.new(0,5,0,10) _0xW.BackgroundTransparency=1 _0xW.BorderSizePixel=0 _0xW.ScrollBarThickness=2 _0xW.Parent=_0xV
local _0xX = Instance.new("UIListLayout")_0xX.Parent=_0xW _0xX.Padding=UDim.new(0,5)
local _0xY = Instance.new("Frame")_0xY.Size=UDim2.new(1,-150,1,-60) _0xY.Position=UDim2.new(0,140,0,50) _0xY.BackgroundTransparency=1 _0xY.Parent=_0xV
local _0xZ = Instance.new("TextLabel")_0xZ.Size=UDim2.new(0,250,0,40) _0xZ.Position=UDim2.new(0,140,0,5) _0xZ.Text="Nakamura Hub" _0xZ.TextColor3=Color3.fromRGB(255,255,0) _0xZ.TextSize=24 _0xZ.Font=Enum.Font.GothamBold _0xZ.BackgroundTransparency=1 _0xZ.TextXAlignment=Enum.TextXAlignment.Left _0xZ.Parent=_0xV
local _0x1, _0x2 = {}, {}
local function _0x3(n)
local b=Instance.new("TextButton")b.Size=UDim2.new(1,-10,0,35) b.BackgroundColor3=Color3.fromRGB(60,60,60) b.Text=n b.TextColor3=Color3.new(1,1,1) b.Font=Enum.Font.GothamBold b.Parent=_0xW
Instance.new("UICorner",b)
local p=Instance.new("ScrollingFrame")p.Size=UDim2.new(1,0,1,0) p.BackgroundTransparency=1 p.Visible=false p.ScrollBarThickness=4 p.Parent=_0xY
Instance.new("UIListLayout",p).Padding=UDim.new(0,8)
b.MouseButton1Click:Connect(function() for _,v in pairs(_0x1) do v.Visible=false end for _,v in pairs(_0x2) do v.BackgroundColor3=Color3.fromRGB(60,60,60) v.TextColor3=Color3.new(1,1,1) end p.Visible=true b.BackgroundColor3=Color3.fromRGB(255,255,0) b.TextColor3=Color3.new(0,0,0) end)
_0x1[n]=p _0x2[n]=b return p end
local _0x4, _0x5, _0x6, _0x7, _0x8, _0x9 = _0x3("Main"), _0x3("Combat"), _0x3("Player TP"), _0x3("Diagnostic"), _0x3("Waypoint"), _0x3("Credits")
local function _0xAA(n,d,p,c)
local b=Instance.new("TextButton")b.Size=UDim2.new(1,-10,0,38) b.BackgroundColor3=d and Color3.fromRGB(0,120,0) or Color3.fromRGB(120,0,0)
b.Text=n..": "..(d and "ON" or "OFF") b.TextColor3=Color3.new(1,1,1) b.Font=Enum.Font.GothamBold b.Parent=p
Instance.new("UICorner",b)
local s=d b.MouseButton1Click:Connect(function() s=not s b.Text=n..": "..(s and "ON" or "OFF") b.BackgroundColor3=s and Color3.fromRGB(0,120,0) or Color3.fromRGB(120,0,0) c(s) end)
end
_0xAA("Master Aimbot",false,_0x5,function(s) _0xK=s end)
_0xAA("Wall Check",true,_0x5,function(s) _0xL=s end)
_0xAA("Team Check",true,_0x5,function(s) _0xM=s end)
_0xAA("Kill Check",true,_0x5,function(s) _0xN=s end)
local function _0xAB(n,h,c)
local f=Instance.new("Frame")f.Size=UDim2.new(1,-10,0,40) f.BackgroundTransparency=1 f.Parent=_0x7
local l=Instance.new("TextLabel")l.Size=UDim2.new(0.4,0,1,0) l.Text=n l.TextColor3=Color3.new(1,1,1) l.BackgroundTransparency=1 l.Parent=f
local i=Instance.new("TextBox")i.Size=UDim2.new(0.5,0,0.8,0) i.Position=UDim2.new(0.45,0,0.1,0) i.BackgroundColor3=Color3.fromRGB(50,50,50) i.TextColor3=Color3.new(1,1,1) i.PlaceholderText=h i.Parent=f
Instance.new("UICorner",i) i.FocusLost:Connect(function() local v=tonumber(i.Text) if v then c(v) end end)
end
_0xAB("SPEED:","16",function(v) if _0xF.Character then _0xF.Character.Humanoid.WalkSpeed=v end end)
_0xAB("JUMP:","50",function(v) if _0xF.Character then _0xF.Character.Humanoid.UseJumpPower=true _0xF.Character.Humanoid.JumpPower=v end end)
_0xAA("Infinite Jump",false,_0x7,function(s) _0xO=s end)
local function _0xAC()
for _,v in pairs(_0x6:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
for _,v in pairs(_0xA:GetPlayers()) do if v ~= _0xF then
local b=Instance.new("TextButton")b.Size=UDim2.new(1,-10,0,35) b.BackgroundColor3=Color3.fromRGB(40,40,40) b.TextColor3=Color3.new(1,1,1) b.Text="TP: "..v.DisplayName b.Parent=_0x6
Instance.new("UICorner",b) b.MouseButton1Click:Connect(function() if v.Character then _0xF.Character:MoveTo(v.Character.HumanoidRootPart.Position) end end)
end end end
_0xAC() _0xA.PlayerAdded:Connect(_0xAC) _0xA.PlayerRemoving:Connect(_0xAC)
local function _0xAD()
for _,v in pairs(_0x8:GetChildren()) do if not v:IsA("UIListLayout") then v:Destroy() end end
for i,d in pairs(_0xP) do
local f=Instance.new("Frame")f.Size=UDim2.new(1,-10,0,45) f.BackgroundColor3=Color3.fromRGB(30,30,30) f.Parent=_0x8
Instance.new("UICorner",f)
local g=Instance.new("TextButton")g.Size=UDim2.new(0.7,-5,0.8,0) g.Position=UDim2.new(0,5,0.1,0) g.BackgroundColor3=Color3.fromRGB(255,255,0) g.Text=d.name g.Parent=f
Instance.new("UICorner",g)
local x=Instance.new("TextButton")x.Size=UDim2.new(0.25,-5,0.8,0) x.Position=UDim2.new(0.7,5,0.1,0) x.BackgroundColor3=Color3.fromRGB(150,0,0) x.Text="DEL" x.TextColor3=Color3.new(1,1,1) x.Parent=f
Instance.new("UICorner",x) g.MouseButton1Click:Connect(function() if _0xF.Character then _0xF.Character.HumanoidRootPart.CFrame=CFrame.new(d.pos[1],d.pos[2],d.pos[3]) end end)
x.MouseButton1Click:Connect(function() table.remove(_0xP,i) _0xT() _0xAD() end)
end
local nf=Instance.new("Frame")nf.Size=UDim2.new(1,-10,0,45) nf.BackgroundTransparency=1 nf.Parent=_0x8
local nb=Instance.new("TextBox")nb.Size=UDim2.new(0.7,-5,0.8,0) nb.Position=UDim2.new(0,5,0.1,0) nb.PlaceholderText="Name..." nb.BackgroundColor3=Color3.fromRGB(50,50,50) nb.TextColor3=Color3.new(1,1,1) nb.Parent=nf
Instance.new("UICorner",nb)
local ab=Instance.new("TextButton")ab.Size=UDim2.new(0.25,-5,0.8,0) ab.Position=UDim2.new(0.7,5,0.1,0) ab.BackgroundColor3=Color3.fromRGB(0,150,0) ab.Text="ADD" ab.TextColor3=Color3.new(1,1,1) ab.Parent=nf
Instance.new("UICorner",ab) ab.MouseButton1Click:Connect(function() if _0xF.Character and nb.Text ~= "" then local p=_0xF.Character.HumanoidRootPart.Position table.insert(_0xP,{name=nb.Text,pos={p.X,p.Y,p.Z}}) _0xT() _0xAD() end end)
end
_0xAD()
local function _0xAE(r,n)
local l=Instance.new("TextLabel")l.Size=UDim2.new(1,-10,0,30) l.BackgroundTransparency=1 l.Text="<b>"..r.."</b>: "..n l.TextColor3=Color3.new(1,1,1) l.RichText=true l.Font=Enum.Font.GothamMedium l.Parent=_0x9
end
_0xAE("Owner","ponitan3776") _0xAE("Buddy","Okamoto")
local cb=Instance.new("TextButton")cb.Size=UDim2.new(0,30,0,30) cb.Position=UDim2.new(1,-35,0,5) cb.Text="X" cb.TextColor3=Color3.fromRGB(255,0,0) cb.BackgroundTransparency=1 cb.TextSize=25 cb.Parent=_0xV
cb.MouseButton1Click:Connect(function() _0xJ:Destroy() end)
local function _0xAF(p) if p==_0xF then return end local h=Instance.new("Highlight")h.Name="NakamuraESP" h.FillTransparency=0.5 h.OutlineTransparency=0
local function u() if p.Character then h.Parent=p.Character if not table.find(_0xQ,h) then table.insert(_0xQ,h) end end end
p.CharacterAdded:Connect(u) u() end
for _,v in pairs(_0xA:GetPlayers()) do _0xAF(v) end
_0xA.PlayerAdded:Connect(_0xAF)
_0xB.RenderStepped:Connect(function()
local c=Color3.fromHSV(tick()%5/5,1,1) for i,v in pairs(_0xQ) do if v and v.Parent then v.FillColor,v.OutlineColor=c,c else table.remove(_0xQ,i) end end
if _0xK and _0xF.Character and _0xF.Character:FindFirstChild("HumanoidRootPart") then
local p,t,s = _0xF.Character.HumanoidRootPart.Position,nil,math.huge
for _,v in pairs(_0xA:GetPlayers()) do if v ~= _0xF and v.Character and v.Character:FindFirstChild("Head") then
if _0xN and v.Character.Humanoid.Health <= 0 then continue end if _0xM and v.Team == _0xF.Team then continue end
local ep=v.Character.Head.Position local _,os=_0xH:WorldToViewportPoint(ep)
if os then if _0xL then local o=_0xH:GetPartsObscuringTarget({ep},{_0xF.Character,v.Character}) if #o>0 then continue end end
local d=(p-ep).Magnitude if d<s then s,t=d,v end end end end
if t then _0xH.CFrame=CFrame.new(_0xH.CFrame.Position,t.Character.Head.Position) end end end)
_0xC.JumpRequest:Connect(function() if _0xO and _0xF.Character then _0xF.Character.Humanoid:ChangeState("Jumping") end end)
_0xU.MouseButton1Click:Connect(function() _0xV.Visible=not _0xV.Visible end)
_0x4.Visible, _0x2["Main"].BackgroundColor3, _0x2["Main"].TextColor3 = true, Color3.fromRGB(255, 255, 0), Color3.new(0,0,0)
