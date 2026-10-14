local lp = game:GetService("Players").LocalPlayer;
local Players = game:GetService("Players");
local Camera = workspace.CurrentCamera;
local RunService = game:GetService("RunService");
local UserInputService = game:GetService("UserInputService");

local function playClickSound()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1673280232"
    sound.Volume = 0.8
    sound.Parent = workspace
    sound:Play()
    game:GetService("Debris"):AddItem(sound, 1)
end

local function playOofSound()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1237557124"
    sound.Volume = 1
    sound.Parent = workspace
    sound:Play()
    game:GetService("Debris"):AddItem(sound, 1.5)
end

playClickSound()

local function gplr(String) 
    local Found = {};
    local strl = String:lower();
    if (strl == "all") then 
        for i,v in pairs(Players:GetPlayers()) do table.insert(Found,v); end 
    elseif (strl == "others") then 
        for i,v in pairs(Players:GetPlayers()) do if (v.Name~=lp.Name) then table.insert(Found,v); end end 
    elseif (strl=="me") then 
        for i,v in pairs(Players:GetPlayers()) do if (v.Name==lp.Name) then table.insert(Found,v); end end 
    else 
        for i,v in pairs(Players:GetPlayers()) do 
            if ((v.Name:lower():sub(1, #String)==strl) or (v.DisplayName:lower():sub(1, #String)==strl)) then 
                table.insert(Found,v);
            end 
        end 
    end 
    return Found;
end 

local ScreenGui = Instance.new("ScreenGui");
ScreenGui.Parent = lp:WaitForChild("PlayerGui");
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
ScreenGui.ResetOnSpawn = false;

---------------------------------------------------------
-- 1. MENÚ DE KEY PRINCIPAL (ZEROXHUBONTOP)
---------------------------------------------------------
local KeyFrame = Instance.new("Frame", ScreenGui);
KeyFrame.BackgroundColor3 = Color3.fromRGB(8, 12, 8);
local FrameBorder1 = Instance.new("UIStroke", KeyFrame);
FrameBorder1.Color = Color3.fromRGB(0, 255, 100);
FrameBorder1.Thickness = 1.5;

KeyFrame.Size = UDim2.new(0, 210, 0, 130);
KeyFrame.Position = UDim2.new(0.5, -105, 0.4, -65);
KeyFrame.Active = true;
KeyFrame.Draggable = true;

local KeyCorner = Instance.new("UICorner", KeyFrame);
KeyCorner.CornerRadius = UDim.new(0, 6);

local KeyTitle = Instance.new("TextLabel", KeyFrame);
KeyTitle.Size = UDim2.new(1, 0, 0, 25);
KeyTitle.BackgroundColor3 = Color3.fromRGB(4, 20, 8);
KeyTitle.Text = "[ ZeroX System - Key ]";
KeyTitle.TextColor3 = Color3.fromRGB(0, 255, 100);
KeyTitle.Font = Enum.Font.Code;
KeyTitle.TextSize = 12;

local KeyTitleCorner = Instance.new("UICorner", KeyTitle);
KeyTitleCorner.CornerRadius = UDim.new(0, 6);

local KeyTextBox = Instance.new("TextBox", KeyFrame);
KeyTextBox.Size = UDim2.new(0.9, 0, 0, 28);
KeyTextBox.Position = UDim2.new(0.05, 0, 0.32, 0);
KeyTextBox.BackgroundColor3 = Color3.fromRGB(12, 22, 12);
KeyTextBox.PlaceholderText = "put the key";
KeyTextBox.PlaceholderColor3 = Color3.fromRGB(0, 120, 50);
KeyTextBox.Text = "";
KeyTextBox.TextColor3 = Color3.fromRGB(0, 255, 100);
KeyTextBox.Font = Enum.Font.Code;
KeyTextBox.TextSize = 12;
KeyTextBox.ClearTextOnFocus = false;

local KeyBoxCorner = Instance.new("UICorner", KeyTextBox);
KeyBoxCorner.CornerRadius = UDim.new(0, 4);

local SubmitBtn = Instance.new("TextButton", KeyFrame);
SubmitBtn.Size = UDim2.new(0.9, 0, 0, 28);
SubmitBtn.Position = UDim2.new(0.05, 0, 0.68, 0);
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 30);
SubmitBtn.Text = "VERIFY KEY";
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
SubmitBtn.Font = Enum.Font.Code;
SubmitBtn.TextSize = 12;

local SubmitCorner = Instance.new("UICorner", SubmitBtn);
SubmitCorner.CornerRadius = UDim.new(0, 4);

---------------------------------------------------------
-- 2. MENÚ PRINCIPAL (ACTUALIZADO CON NUEVAS HERRAMIENTAS)
---------------------------------------------------------
local MainFrame = Instance.new("Frame", ScreenGui);
MainFrame.BackgroundColor3 = Color3.fromRGB(8, 12, 8);
MainFrame.Size = UDim2.new(0, 210, 0, 275); -- Altura expandida para albergar todas las opciones
MainFrame.Position = UDim2.new(0.69, 0, 0.37, 0);
MainFrame.Active = true;
MainFrame.Visible = false;
MainFrame.Draggable = true;

local MainBorder = Instance.new("UIStroke", MainFrame);
MainBorder.Color = Color3.fromRGB(0, 255, 100);
MainBorder.Thickness = 1.5;

local MainCorner = Instance.new("UICorner", MainFrame);
MainCorner.CornerRadius = UDim.new(0, 6);

local TitleLabel = Instance.new("TextLabel", MainFrame);
TitleLabel.Size = UDim2.new(1, 0, 0, 22);
TitleLabel.BackgroundColor3 = Color3.fromRGB(4, 20, 8);
TitleLabel.Text = "  ZeroX Menu";
TitleLabel.TextColor3 = Color3.fromRGB(0, 255, 100);
TitleLabel.Font = Enum.Font.Code;
TitleLabel.TextSize = 11;
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left;

local TitleCorner = Instance.new("UICorner", TitleLabel);
TitleCorner.CornerRadius = UDim.new(0, 6);

local NgtButton = Instance.new("TextButton", TitleLabel);
NgtButton.Size = UDim2.new(0, 26, 0, 16);
NgtButton.Position = UDim2.new(1, -78, 0.5, -8);
NgtButton.BackgroundColor3 = Color3.fromRGB(139, 0, 0);
NgtButton.Text = "NGT";
NgtButton.TextColor3 = Color3.fromRGB(255, 150, 150);
NgtButton.TextSize = 9;
NgtButton.Font = Enum.Font.Code;
local NgtCorner = Instance.new("UICorner", NgtButton); NgtCorner.CornerRadius = UDim.new(0, 3);

local MinButton = Instance.new("TextButton", TitleLabel);
MinButton.Size = UDim2.new(0, 20, 0, 22);
MinButton.Position = UDim2.new(1, -48, 0, 0);
MinButton.BackgroundTransparency = 1;
MinButton.Text = "-";
MinButton.TextColor3 = Color3.fromRGB(0, 255, 100);
MinButton.TextSize = 12;
MinButton.Font = Enum.Font.Code;

local CloseButton = Instance.new("TextButton", TitleLabel);
CloseButton.Size = UDim2.new(0, 20, 0, 22);
CloseButton.Position = UDim2.new(1, -22, 0, 0);
CloseButton.BackgroundTransparency = 1;
CloseButton.Text = "X";
CloseButton.TextColor3 = Color3.fromRGB(255, 60, 60);
CloseButton.TextSize = 10;
CloseButton.Font = Enum.Font.Code;

-- Contenedor scroller o elementos alineados en orden dentro del menú verde
local MainElementsContainer = Instance.new("ScrollingFrame", MainFrame)
MainElementsContainer.Size = UDim2.new(1, 0, 1, -25)
MainElementsContainer.Position = UDim2.new(0, 0, 0, 25)
MainElementsContainer.BackgroundTransparency = 1
MainElementsContainer.CanvasSize = UDim2.new(0, 0, 0, 300)
MainElementsContainer.ScrollBarThickness = 3
MainElementsContainer.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 100)

local MainLayout = Instance.new("UIListLayout", MainElementsContainer)
MainLayout.SortOrder = Enum.SortOrder.LayoutOrder
MainLayout.Padding = UDim.new(0, 6)
MainLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Espaciador superior interno
local paddingSpacer = Instance.new("Frame", MainElementsContainer)
paddingSpacer.Size = UDim2.new(1, 0, 0, 2)
paddingSpacer.BackgroundTransparency = 1
paddingSpacer.LayoutOrder = 0

-- 1. Noclip Button
local NoclipBtn = Instance.new("TextButton", MainElementsContainer);
NoclipBtn.Size = UDim2.new(0.9, 0, 0, 26);
NoclipBtn.BackgroundColor3 = Color3.fromRGB(0, 60, 30);
NoclipBtn.Text = "Noclip: OFF";
NoclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
NoclipBtn.Font = Enum.Font.Code;
NoclipBtn.TextSize = 11;
NoclipBtn.LayoutOrder = 1;
local NC_Corner = Instance.new("UICorner", NoclipBtn); NC_Corner.CornerRadius = UDim.new(0, 4);

-- 2. InfJump Button
local InfJumpBtn = Instance.new("TextButton", MainElementsContainer);
InfJumpBtn.Size = UDim2.new(0.9, 0, 0, 26);
InfJumpBtn.BackgroundColor3 = Color3.fromRGB(0, 60, 30);
InfJumpBtn.Text = "InfJump: OFF";
InfJumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
InfJumpBtn.Font = Enum.Font.Code;
InfJumpBtn.TextSize = 11;
InfJumpBtn.LayoutOrder = 2;
local IJ_Corner = Instance.new("UICorner", InfJumpBtn); IJ_Corner.CornerRadius = UDim.new(0, 4);

-- 3. Fly Button & Controls Container
local FlyContainer = Instance.new("Frame", MainElementsContainer)
FlyContainer.Size = UDim2.new(0.9, 0, 0, 26)
FlyContainer.BackgroundTransparency = 1
FlyContainer.LayoutOrder = 3

local FlyBtn = Instance.new("TextButton", FlyContainer);
FlyBtn.Size = UDim2.new(0.58, 0, 1, 0);
FlyBtn.Position = UDim2.new(0, 0, 0, 0);
FlyBtn.BackgroundColor3 = Color3.fromRGB(0, 60, 30);
FlyBtn.Text = "Fly: OFF";
FlyBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
FlyBtn.Font = Enum.Font.Code;
FlyBtn.TextSize = 11;
local Fly_Corner = Instance.new("UICorner", FlyBtn); Fly_Corner.CornerRadius = UDim.new(0, 4);

local SpeedMinus = Instance.new("TextButton", FlyContainer);
SpeedMinus.Size = UDim2.new(0, 22, 1, 0);
SpeedMinus.Position = UDim2.new(0.61, 0, 0, 0);
SpeedMinus.BackgroundColor3 = Color3.fromRGB(0, 40, 20);
SpeedMinus.Text = "-";
SpeedMinus.TextColor3 = Color3.fromRGB(255, 255, 255);
SpeedMinus.Font = Enum.Font.Code;
SpeedMinus.TextSize = 12;
local SM_Corner = Instance.new("UICorner", SpeedMinus); SM_Corner.CornerRadius = UDim.new(0, 4);

local SpeedBox = Instance.new("TextBox", FlyContainer);
SpeedBox.Size = UDim2.new(0, 26, 1, 0);
SpeedBox.Position = UDim2.new(0.73, 0, 0, 0);
SpeedBox.BackgroundColor3 = Color3.fromRGB(4, 15, 8);
SpeedBox.Text = "1";
SpeedBox.TextColor3 = Color3.fromRGB(0, 255, 100);
SpeedBox.Font = Enum.Font.Code;
SpeedBox.TextSize = 11;
SpeedBox.ClearTextOnFocus = false;
local SB_Corner = Instance.new("UICorner", SpeedBox); SB_Corner.CornerRadius = UDim.new(0, 4);

local SpeedPlus = Instance.new("TextButton", FlyContainer);
SpeedPlus.Size = UDim2.new(0, 22, 1, 0);
SpeedPlus.Position = UDim2.new(0.86, 0, 0, 0);
SpeedPlus.BackgroundColor3 = Color3.fromRGB(0, 40, 20);
SpeedPlus.Text = "+";
SpeedPlus.TextColor3 = Color3.fromRGB(255, 255, 255);
SpeedPlus.Font = Enum.Font.Code;
SpeedPlus.TextSize = 12;
local SP_Corner = Instance.new("UICorner", SpeedPlus); SP_Corner.CornerRadius = UDim.new(0, 4);

-- 4. Up / Down Fly Controls
localUpDownContainer = Instance.new("Frame", MainElementsContainer)
localUpDownContainer.Size = UDim2.new(0.9, 0, 0, 26)
localUpDownContainer.BackgroundTransparency = 1
localUpDownContainer.LayoutOrder = 4

local UpBtn = Instance.new("TextButton", localUpDownContainer);
UpBtn.Size = UDim2.new(0.48, 0, 1, 0);
UpBtn.Position = UDim2.new(0, 0, 0, 0);
UpBtn.BackgroundColor3 = Color3.fromRGB(0, 50, 25);
UpBtn.Text = "▲ UP";
UpBtn.TextColor3 = Color3.fromRGB(48, 209, 88);
UpBtn.Font = Enum.Font.Code;
UpBtn.TextSize = 10;
local Up_Corner = Instance.new("UICorner", UpBtn); Up_Corner.CornerRadius = UDim.new(0, 4);

local DownBtn = Instance.new("TextButton", localUpDownContainer);
DownBtn.Size = UDim2.new(0.48, 0, 1, 0);
DownBtn.Position = UDim2.new(0.52, 0, 0, 0);
DownBtn.BackgroundColor3 = Color3.fromRGB(0, 50, 25);
DownBtn.Text = "▼ DOWN";
DownBtn.TextColor3 = Color3.fromRGB(255, 159, 10);
DownBtn.Font = Enum.Font.Code;
DownBtn.TextSize = 10;
local Down_Corner = Instance.new("UICorner", DownBtn); Down_Corner.CornerRadius = UDim.new(0, 4);

-- 5. WalkSpeed Changer (Con Input Box)
local WalkSpeedContainer = Instance.new("Frame", MainElementsContainer)
WalkSpeedContainer.Size = UDim2.new(0.9, 0, 0, 26)
WalkSpeedContainer.BackgroundTransparency = 1
WalkSpeedContainer.LayoutOrder = 5

local WSLabel = Instance.new("TextButton", WalkSpeedContainer)
WSLabel.Size = UDim2.new(0.65, 0, 1, 0)
WSLabel.BackgroundColor3 = Color3.fromRGB(0, 50, 25)
WSLabel.Text = "WalkSpeed:"
WSLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WSLabel.Font = Enum.Font.Code
WSLabel.TextSize = 10
local WSL_Corner = Instance.new("UICorner", WSLabel); WSL_Corner.CornerRadius = UDim.new(0, 4)

local WSBox = Instance.new("TextBox", WalkSpeedContainer)
WSBox.Size = UDim2.new(0.32, 0, 1, 0)
WSBox.Position = UDim2.new(0.68, 0, 0, 0)
WSBox.BackgroundColor3 = Color3.fromRGB(4, 15, 8)
WSBox.Text = "16"
WSBox.TextColor3 = Color3.fromRGB(0, 255, 100)
WSBox.Font = Enum.Font.Code
WSBox.TextSize = 11
WSBox.ClearTextOnFocus = false
local WSB_Corner = Instance.new("UICorner", WSBox); WSB_Corner.CornerRadius = UDim.new(0, 4)

-- 6. JumpPower Changer (Con Input Box)
local JumpPowerContainer = Instance.new("Frame", MainElementsContainer)
JumpPowerContainer.Size = UDim2.new(0.9, 0, 0, 26)
JumpPowerContainer.BackgroundTransparency = 1
JumpPowerContainer.LayoutOrder = 6

local JPLabel = Instance.new("TextButton", JumpPowerContainer)
JPLabel.Size = UDim2.new(0.65, 0, 1, 0)
JPLabel.BackgroundColor3 = Color3.fromRGB(0, 50, 25)
JPLabel.Text = "JumpPower:"
JPLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
JPLabel.Font = Enum.Font.Code
JPLabel.TextSize = 10
local JPL_Corner = Instance.new("UICorner", JPLabel); JPL_Corner.CornerRadius = UDim.new(0, 4)

local JPBox = Instance.new("TextBox", JumpPowerContainer)
JPBox.Size = UDim2.new(0.32, 0, 1, 0)
JPBox.Position = UDim2.new(0.68, 0, 0, 0)
JPBox.BackgroundColor3 = Color3.fromRGB(4, 15, 8)
JPBox.Text = "50"
JPBox.TextColor3 = Color3.fromRGB(0, 255, 100)
JPBox.Font = Enum.Font.Code
JPBox.TextSize = 11
JPBox.ClearTextOnFocus = false
local JPB_Corner = Instance.new("UICorner", JPBox); JPB_Corner.CornerRadius = UDim.new(0, 4)

-- 7. TP Tool Button
local TPToolBtn = Instance.new("TextButton", MainElementsContainer);
TPToolBtn.Size = UDim2.new(0.9, 0, 0, 26);
TPToolBtn.BackgroundColor3 = Color3.fromRGB(0, 50, 35);
TPToolBtn.Text = "Get TP Tool";
TPToolBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
TPToolBtn.Font = Enum.Font.Code;
TPToolBtn.TextSize = 11;
TPToolBtn.LayoutOrder = 7;
local TPT_Corner = Instance.new("UICorner", TPToolBtn); TPT_Corner.CornerRadius = UDim.new(0, 4);

SubmitBtn.MouseButton1Down:Connect(function()
    playClickSound()
    if KeyTextBox.Text == "ZEROXHUBONTOP" then
        KeyFrame:Destroy()
        MainFrame.Visible = true
    else
        KeyTextBox.Text = ""
        KeyTextBox.PlaceholderText = "WRONG KEY!";
    end
end)

local noclipActive = false
local noclipConn = nil
NoclipBtn.MouseButton1Down:Connect(function()
    playClickSound()
    noclipActive = not noclipActive
    if noclipActive then
        NoclipBtn.Text = "Noclip: ON"
        NoclipBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 60)
        noclipConn = RunService.Stepped:Connect(function()
            if lp.Character then
                for _, v in ipairs(lp.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    else
        NoclipBtn.Text = "Noclip: OFF"
        NoclipBtn.BackgroundColor3 = Color3.fromRGB(0, 60, 30)
        if noclipConn then noclipConn:Disconnect() end
    end
end)

-- Lógica de Infinite Jump
local infJumpActive = false
InfJumpBtn.MouseButton1Down:Connect(function()
    playClickSound()
    infJumpActive = not infJumpActive
    if infJumpActive then
        InfJumpBtn.Text = "InfJump: ON"
        InfJumpBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 60)
    else
        InfJumpBtn.Text = "InfJump: OFF"
        InfJumpBtn.BackgroundColor3 = Color3.fromRGB(0, 60, 30)
    end
end)

UserInputService.JumpRequest:Connect(function()
    if infJumpActive and lp.Character then
        local hum = lp.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- Lógica de WalkSpeed Changer
WSBox.FocusLost:Connect(function()
    local val = tonumber(WSBox.Text)
    if val and lp.Character then
        local hum = lp.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = val
        end
    end
end)

-- Lógica de JumpPower Changer
JPBox.FocusLost:Connect(function()
    local val = tonumber(JPBox.Text)
    if val and lp.Character then
        local hum = lp.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.UseJumpPower = true
            hum.JumpPower = val
        end
    end
end)

-- Lógica de TP Tool
TPToolBtn.MouseButton1Down:Connect(function()
    playClickSound()
    local tool = Instance.new("Tool")
    tool.Name = "ZeroX TP Tool"
    tool.RequiresHandle = false
    tool.Parent = lp.Backpack

    tool.Activated:Connect(function()
        local mouse = lp:GetMouse()
        if mouse.Target and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
            lp.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
        end
    end)
end)

local flyingV3 = false
local speedMultiplier = 1
local baseSpeed = 200
local movingUp = false
local movingDown = false
local bodyGyro = nil
local bodyVelocity = nil

SpeedBox.FocusLost:Connect(function()
    local val = tonumber(SpeedBox.Text)
    if val then
        speedMultiplier = math.clamp(math.floor(val), 1, 99)
    end
    SpeedBox.Text = tostring(speedMultiplier)
end)

SpeedPlus.MouseButton1Click:Connect(function()
    speedMultiplier = math.min(99, speedMultiplier + 1)
    SpeedBox.Text = tostring(speedMultiplier)
end)

SpeedMinus.MouseButton1Click:Connect(function()
    speedMultiplier = math.max(1, speedMultiplier - 1)
    SpeedBox.Text = tostring(speedMultiplier)
end)

UpBtn.MouseButton1Down:Connect(function() movingUp = true end)
UpBtn.MouseButton1Up:Connect(function() movingUp = false end)
DownBtn.MouseButton1Down:Connect(function() movingDown = true end)
DownBtn.MouseButton1Up:Connect(function() movingDown = false end)

local function startFly()
    local char = lp.Character or lp.CharacterAdded:Wait()
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end

    hum.PlatformStand = true
    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.P = 9e4
    bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    bodyGyro.CFrame = hrp.CFrame
    bodyGyro.Parent = hrp

    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.zero
    bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bodyVelocity.Parent = hrp

    flyingV3 = true
    FlyBtn.Text = "Fly: ON"
    FlyBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 60)
end

local function stopFly()
    flyingV3 = false
    if bodyGyro then bodyGyro:Destroy(); bodyGyro = nil end
    if bodyVelocity then bodyVelocity:Destroy(); bodyVelocity = nil end
    if lp.Character then
        local hum = lp.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
    end
    FlyBtn.Text = "Fly: OFF"
    FlyBtn.BackgroundColor3 = Color3.fromRGB(0, 60, 30)
end

FlyBtn.MouseButton1Down:Connect(function()
    playClickSound()
    if flyingV3 then
        stopFly()
    else
        startFly()
    end
end)

RunService.RenderStepped:Connect(function()
    if not flyingV3 or not bodyGyro or not bodyVelocity then return end
    local char = lp.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end

    local camCF = Camera.CFrame
    bodyGyro.CFrame = camCF

    local moveDir = hum.MoveDirection
    local finalSpeed = speedMultiplier * baseSpeed
    local velocity = Vector3.zero

    if moveDir.Magnitude > 0.05 then
        local lookFlat = Vector3.new(camCF.LookVector.X, 0, camCF.LookVector.Z)
        if lookFlat.Magnitude > 0.001 then
            lookFlat = lookFlat.Unit
            local rightFlat = Vector3.new(camCF.RightVector.X, 0, camCF.RightVector.Z).Unit
            local dotLook = moveDir:Dot(lookFlat)
            local dotRight = moveDir:Dot(rightFlat)
            local computedMove = camCF.LookVector * dotLook + camCF.RightVector * dotRight
            if computedMove.Magnitude > 0.01 then
                velocity = computedMove.Unit * finalSpeed
            else
                velocity = moveDir * finalSpeed
            end
        else
            velocity = camCF.LookVector * finalSpeed
        end
    end

    if movingUp then
        velocity = velocity + (camCF.UpVector * finalSpeed)
    elseif movingDown then
        velocity = velocity - (camCF.UpVector * finalSpeed)
    end

    bodyVelocity.Velocity = velocity
end)

---------------------------------------------------------
-- 3. MENÚ DE KEY SECRETO PARA NGT (ZEROXSECRET)
---------------------------------------------------------
local SecretKeyFrame = Instance.new("Frame", ScreenGui);
SecretKeyFrame.BackgroundColor3 = Color3.fromRGB(20, 5, 5);
SecretKeyFrame.Size = UDim2.new(0, 210, 0, 130);
SecretKeyFrame.Position = UDim2.new(0.5, -105, 0.4, -65);
SecretKeyFrame.Active = true;
SecretKeyFrame.Visible = false;
SecretKeyFrame.Draggable = true;

local SecretBorder = Instance.new("UIStroke", SecretKeyFrame);
SecretBorder.Color = Color3.fromRGB(180, 0, 0);
SecretBorder.Thickness = 1.5;

local SecretCorner = Instance.new("UICorner", SecretKeyFrame);
SecretCorner.CornerRadius = UDim.new(0, 6);

local SecretTitle = Instance.new("TextLabel", SecretKeyFrame);
SecretTitle.Size = UDim2.new(1, 0, 0, 25);
SecretTitle.BackgroundColor3 = Color3.fromRGB(40, 5, 5);
SecretTitle.Text = "[ Secret Fling Key ]";
SecretTitle.TextColor3 = Color3.fromRGB(255, 60, 60);
SecretTitle.Font = Enum.Font.Code;
SecretTitle.TextSize = 12;

local SecretTitleCorner = Instance.new("UICorner", SecretTitle);
SecretTitleCorner.CornerRadius = UDim.new(0, 6);

local SecretTextBox = Instance.new("TextBox", SecretKeyFrame);
SecretTextBox.Size = UDim2.new(0.9, 0, 0, 28);
SecretTextBox.Position = UDim2.new(0.05, 0, 0.32, 0);
SecretTextBox.BackgroundColor3 = Color3.fromRGB(35, 10, 10);
SecretTextBox.PlaceholderText = "put the key";
SecretTextBox.PlaceholderColor3 = Color3.fromRGB(140, 40, 40);
SecretTextBox.Text = "";
SecretTextBox.TextColor3 = Color3.fromRGB(255, 80, 80);
SecretTextBox.Font = Enum.Font.Code;
SecretTextBox.TextSize = 11;
SecretTextBox.ClearTextOnFocus = false;
local STBCorner = Instance.new("UICorner", SecretTextBox); STBCorner.CornerRadius = UDim.new(0, 4);

local SecretSubmit = Instance.new("TextButton", SecretKeyFrame);
SecretSubmit.Size = UDim2.new(0.9, 0, 0, 28);
SecretSubmit.Position = UDim2.new(0.05, 0, 0.68, 0);
SecretSubmit.BackgroundColor3 = Color3.fromRGB(139, 0, 0);
SecretSubmit.Text = "UNLOCK FLING";
SecretSubmit.TextColor3 = Color3.fromRGB(255, 255, 255);
SecretSubmit.Font = Enum.Font.Code;
SecretSubmit.TextSize = 12;
local SSubCorner = Instance.new("UICorner", SecretSubmit); SSubCorner.CornerRadius = UDim.new(0, 4);

NgtButton.MouseButton1Down:Connect(function()
    playClickSound()
    MainFrame.Visible = false
    SecretKeyFrame.Visible = true
end)

---------------------------------------------------------
-- 4. MENÚ ROJO SANGRE DE FLING (100% INTACTO)
---------------------------------------------------------
local FlingFrame = Instance.new("Frame", ScreenGui);
FlingFrame.BackgroundColor3 = Color3.fromRGB(18, 4, 4);
FlingFrame.Size = UDim2.new(0, 215, 0, 315);
FlingFrame.Position = UDim2.new(0.69, 0, 0.49, 0);
FlingFrame.Active = true;
FlingFrame.Visible = false;
FlingFrame.Draggable = true;

local FlingBorder = Instance.new("UIStroke", FlingFrame);
FlingBorder.Color = Color3.fromRGB(220, 20, 20);
FlingBorder.Thickness = 1.5;

local FlingCorner = Instance.new("UICorner", FlingFrame);
FlingCorner.CornerRadius = UDim.new(0, 6);

local FlingTitle = Instance.new("TextLabel", FlingFrame);
FlingTitle.Size = UDim2.new(1, 0, 0, 24);
FlingTitle.BackgroundColor3 = Color3.fromRGB(45, 8, 8);
FlingTitle.Text = "  ZeroX Fling [Blood Red]";
FlingTitle.TextColor3 = Color3.fromRGB(255, 60, 60);
FlingTitle.Font = Enum.Font.Code;
FlingTitle.TextSize = 11;
FlingTitle.TextXAlignment = Enum.TextXAlignment.Left;

local FlingTitleCorner = Instance.new("UICorner", FlingTitle);
FlingTitleCorner.CornerRadius = UDim.new(0, 6);

local FlingMinButton = Instance.new("TextButton", FlingTitle);
FlingMinButton.Size = UDim2.new(0, 20, 0, 24);
FlingMinButton.Position = UDim2.new(1, -44, 0, 0);
FlingMinButton.BackgroundTransparency = 1;
FlingMinButton.Text = "-";
FlingMinButton.TextColor3 = Color3.fromRGB(255, 60, 60);
FlingMinButton.TextSize = 12;
FlingMinButton.Font = Enum.Font.Code;

local FlingClose = Instance.new("TextButton", FlingTitle);
FlingClose.Size = UDim2.new(0, 20, 0, 24);
FlingClose.Position = UDim2.new(1, -22, 0, 0);
FlingClose.BackgroundTransparency = 1;
FlingClose.Text = "X";
FlingClose.TextColor3 = Color3.fromRGB(255, 60, 60);
FlingClose.TextSize = 10;
FlingClose.Font = Enum.Font.Code;

FlingClose.MouseButton1Down:Connect(function()
    playClickSound()
    FlingFrame.Visible = false
end)

local flingElements = {}

local FlingTextBox = Instance.new("TextBox", FlingFrame);
FlingTextBox.Size = UDim2.new(0.9, 0, 0, 24);
FlingTextBox.Position = UDim2.new(0.05, 0, 0.10, 0);
FlingTextBox.BackgroundColor3 = Color3.fromRGB(30, 10, 10);
FlingTextBox.PlaceholderText = "Target name...";
FlingTextBox.PlaceholderColor3 = Color3.fromRGB(140, 40, 40);
FlingTextBox.Text = "";
FlingTextBox.TextColor3 = Color3.fromRGB(255, 100, 100);
FlingTextBox.Font = Enum.Font.Code;
FlingTextBox.TextSize = 11;
local FTBCorner = Instance.new("UICorner", FlingTextBox); FTBCorner.CornerRadius = UDim.new(0, 4);
table.insert(flingElements, FlingTextBox)

local FlingScrolling = Instance.new("ScrollingFrame", FlingFrame);
FlingScrolling.Size = UDim2.new(0.9, 0, 0, 50);
FlingScrolling.Position = UDim2.new(0.05, 0, 0.20, 0);
FlingScrolling.BackgroundColor3 = Color3.fromRGB(12, 3, 3);
FlingScrolling.BorderSizePixel = 0;
FlingScrolling.ScrollBarThickness = 2;
table.insert(flingElements, FlingScrolling)

local FlingLayout = Instance.new("UIListLayout", FlingScrolling);
FlingLayout.SortOrder = Enum.SortOrder.LayoutOrder;
FlingLayout.Padding = UDim.new(0, 2);

local viewingPlayer = nil

local function updateFlingList()
    for _, child in ipairs(FlingScrolling:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end

    local count = 0;
    for _, v in ipairs(Players:GetPlayers()) do
        if v ~= lp then
            count = count + 1;
            local ItemFrame = Instance.new("Frame", FlingScrolling)
            ItemFrame.Size = UDim2.new(1, -2, 0, 18)
            ItemFrame.BackgroundColor3 = Color3.fromRGB(30, 8, 8)
            ItemFrame.BorderSizePixel = 0
            
            local ItemCorner = Instance.new("UICorner", ItemFrame)
            ItemCorner.CornerRadius = UDim.new(0, 3)

            local NameBtn = Instance.new("TextButton", ItemFrame);
            NameBtn.Size = UDim2.new(0.68, 0, 1, 0);
            NameBtn.BackgroundTransparency = 1;
            NameBtn.Text = " " .. v.Name;
            NameBtn.TextColor3 = Color3.fromRGB(255, 120, 120);
            NameBtn.TextSize = 10;
            NameBtn.Font = Enum.Font.Code;
            NameBtn.TextXAlignment = Enum.TextXAlignment.Left;

            NameBtn.MouseButton1Down:Connect(function()
                playClickSound()
                FlingTextBox.Text = v.Name;
            end);

            local ViewBtn = Instance.new("TextButton", ItemFrame);
            ViewBtn.Size = UDim2.new(0, 40, 0, 14);
            ViewBtn.Position = UDim2.new(1, -43, 0.5, -7);
            ViewBtn.BackgroundColor3 = (viewingPlayer == v) and Color3.fromRGB(200, 40, 40) or Color3.fromRGB(80, 20, 20);
            ViewBtn.Text = (viewingPlayer == v) and "Unview" or "View";
            ViewBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
            ViewBtn.TextSize = 9;
            ViewBtn.Font = Enum.Font.Code;
            
            local ViewCorner = Instance.new("UICorner", ViewBtn)
            ViewCorner.CornerRadius = UDim.new(0, 3)

            ViewBtn.MouseButton1Down:Connect(function()
                playClickSound()
                if viewingPlayer == v then
                    viewingPlayer = nil
                    Camera.CameraSubject = lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") or lp.Character
                else
                    viewingPlayer = v
                    if v.Character and v.Character:FindFirstChildOfClass("Humanoid") then
                        Camera.CameraSubject = v.Character:FindFirstChildOfClass("Humanoid")
                    end
                end
                updateFlingList()
            end);
        end
    end
    FlingScrolling.CanvasSize = UDim2.new(0, 0, 0, count * 20);
end

Players.PlayerAdded:Connect(updateFlingList);
Players.PlayerRemoving:Connect(updateFlingList);
updateFlingList();

local AntiFlingBtn = Instance.new("TextButton", FlingFrame);
AntiFlingBtn.Size = UDim2.new(0.9, 0, 0, 22);
AntiFlingBtn.Position = UDim2.new(0.05, 0, 0.38, 0);
AntiFlingBtn.BackgroundColor3 = Color3.fromRGB(70, 20, 20);
AntiFlingBtn.Text = "Anti-Fling: OFF";
AntiFlingBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
AntiFlingBtn.Font = Enum.Font.Code;
AntiFlingBtn.TextSize = 11;
local AFCorner = Instance.new("UICorner", AntiFlingBtn); AFCorner.CornerRadius = UDim.new(0, 4);
table.insert(flingElements, AntiFlingBtn)

local antiFlingActive = false
local antiFlingConn = nil

AntiFlingBtn.MouseButton1Down:Connect(function()
    playClickSound()
    antiFlingActive = not antiFlingActive
    if antiFlingActive then
        AntiFlingBtn.Text = "Anti-Fling: ON";
        AntiFlingBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40);
        antiFlingConn = RunService.Stepped:Connect(function()
            if lp.Character then
                for _, myPart in ipairs(lp.Character:GetDescendants()) do
                    if myPart:IsA("BasePart") then
                        myPart.CanCollide = false
                        myPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                        myPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    end
                end
            end
        end)
    else
        AntiFlingBtn.Text = "Anti-Fling: OFF";
        AntiFlingBtn.BackgroundColor3 = Color3.fromRGB(70, 20, 20);
        if antiFlingConn then antiFlingConn:Disconnect() end
    end
end)

local FlingBtn = Instance.new("TextButton", FlingFrame);
FlingBtn.Size = UDim2.new(0.9, 0, 0, 24);
FlingBtn.Position = UDim2.new(0.05, 0, 0.49, 0);
FlingBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30);
FlingBtn.Text = "Fling";
FlingBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
FlingBtn.Font = Enum.Font.Code;
FlingBtn.TextSize = 12;
local FlingBtnCorner = Instance.new("UICorner", FlingBtn); FlingBtnCorner.CornerRadius = UDim.new(0, 4);
table.insert(flingElements, FlingBtn)

local LoopFlingBtn = Instance.new("TextButton", FlingFrame);
LoopFlingBtn.Size = UDim2.new(0.9, 0, 0, 24);
LoopFlingBtn.Position = UDim2.new(0.05, 0, 0.60, 0);
LoopFlingBtn.BackgroundColor3 = Color3.fromRGB(120, 20, 20);
LoopFlingBtn.Text = "Loop Fling: OFF";
LoopFlingBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
LoopFlingBtn.Font = Enum.Font.Code;
LoopFlingBtn.TextSize = 11;
local LFCorner = Instance.new("UICorner", LoopFlingBtn); LFCorner.CornerRadius = UDim.new(0, 4);
table.insert(flingElements, LoopFlingBtn)

local ToolFlingBtn = Instance.new("TextButton", FlingFrame);
ToolFlingBtn.Size = UDim2.new(0.9, 0, 0, 24);
ToolFlingBtn.Position = UDim2.new(0.05, 0, 0.71, 0);
ToolFlingBtn.BackgroundColor3 = Color3.fromRGB(100, 20, 40);
ToolFlingBtn.Text = "Get Fling Tool";
ToolFlingBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
ToolFlingBtn.Font = Enum.Font.Code;
ToolFlingBtn.TextSize = 11;
local TFCorner = Instance.new("UICorner", ToolFlingBtn); TFCorner.CornerRadius = UDim.new(0, 4);
table.insert(flingElements, ToolFlingBtn)

local FlingV1Btn = Instance.new("TextButton", FlingFrame);
FlingV1Btn.Size = UDim2.new(0.9, 0, 0, 22);
FlingV1Btn.Position = UDim2.new(0.05, 0, 0.82, 0);
FlingV1Btn.BackgroundColor3 = Color3.fromRGB(45, 15, 15);
FlingV1Btn.Text = "Fling v1";
FlingV1Btn.TextColor3 = Color3.fromRGB(255, 150, 150);
FlingV1Btn.Font = Enum.Font.Code;
FlingV1Btn.TextSize = 11;
local FlingV1Corner = Instance.new("UICorner", FlingV1Btn); FlingV1Corner.CornerRadius = UDim.new(0, 4);
table.insert(flingElements, FlingV1Btn)

SecretSubmit.MouseButton1Down:Connect(function()
    playClickSound()
    if SecretTextBox.Text == "ZEROXSECRET" then
        SecretKeyFrame.Visible = false
        FlingFrame.Visible = true
    else
        SecretTextBox.Text = ""
        SecretTextBox.PlaceholderText = "WRONG KEY!";
    end
end)

local flingMinimized = false
FlingMinButton.MouseButton1Down:Connect(function()
    playClickSound()
    flingMinimized = not flingMinimized
    for _, elem in ipairs(flingElements) do
        elem.Visible = not flingMinimized
    end
    FlingFrame.Size = flingMinimized and UDim2.new(0, 215, 0, 24) or UDim2.new(0, 215, 0, 315)
    FlingMinButton.Text = flingMinimized and "+" or "-"
end)

local executeFlingTarget = function(TargetPlayer)
    local Targets = {TargetPlayer.Name};
    local Player = Players.LocalPlayer;
    local AllBool = false;

    local GetPlayer = function(Name) 
        Name = Name:lower();
        if ((Name == "all") or (Name == "others")) then 
            AllBool = true;
            return;
        elseif (Name == "random") then 
            local GetPlayers = Players:GetPlayers();
            if table.find(GetPlayers, Player) then 
                table.remove(GetPlayers, table.find(GetPlayers, Player));
            end 
            return GetPlayers[math.random(#GetPlayers)];
        elseif ((Name ~= "random") and (Name ~= "all") and (Name ~= "others")) then 
            for _, x in next, Players:GetPlayers() do 
                if (x ~= Player) then 
                    if x.Name:lower():match("^" .. Name) then 
                        return x;
                    elseif x.DisplayName:lower():match("^" .. Name) then 
                        return x;
                    end 
                end 
            end 
        else 
            return;
        end 
    end;

    local Message = function(_Title, _Text, Time) 
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time});
    end;

    local SkidFling = function(TargetPlayer) 
        local Character = Player.Character;
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid");
        local RootPart = Humanoid and Humanoid.RootPart;
        local TCharacter = TargetPlayer.Character;
        local THumanoid;
        local TRootPart;
        local THead;
        local Accessory;
        local Handle;

        if TCharacter:FindFirstChildOfClass("Humanoid") then 
            THumanoid = TCharacter:FindFirstChildOfClass("Humanoid");
        end 
        if (THumanoid and THumanoid.RootPart) then 
            TRootPart = THumanoid.RootPart;
        end 
        if TCharacter:FindFirstChild("Head") then 
            THead = TCharacter.Head;
        end 
        if TCharacter:FindFirstChildOfClass("Accessory") then 
            Accessory = TCharacter:FindFirstChildOfClass("Accessory");
        end 
        if (Accessory and Accessory:FindFirstChild("Handle")) then 
            Handle = Accessory.Handle;
        end 

        if (Character and Humanoid and RootPart) then 
            if (RootPart.Velocity.Magnitude < 50) then 
                getgenv().OldPos = RootPart.CFrame;
            end 
            if (THumanoid and THumanoid.Sit and not AllBool) then 
                return Message("Error Occurred", "Targeting is sitting", 5);
            end 
            if THead then 
                workspace.CurrentCamera.CameraSubject = THead;
            elseif (not THead and Handle) then 
                workspace.CurrentCamera.CameraSubject = Handle;
            elseif (THumanoid and TRootPart) then 
                workspace.CurrentCamera.CameraSubject = THumanoid;
            end 
            if not TCharacter:FindFirstChildWhichIsA("BasePart") then 
                return;
            end 

            local FPos = function(BasePart, Pos, Ang) 
                RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang;
                Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang);
                RootPart.Velocity = Vector3.new(90000000, 90000000 * 10, 90000000);
                RootPart.RotVelocity = Vector3.new(900000000, 900000000, 900000000);
            end;

            local SFBasePart = function(BasePart) 
                local TimeToWait = 2;
                local Time = tick();
                local Angle = 0;
                repeat 
                    if (RootPart and THumanoid) then 
                        if (BasePart.Velocity.Magnitude < 50) then 
                            Angle = Angle + 100;
                            FPos(BasePart, CFrame.new(0, 1.5, 0) + ((THumanoid.MoveDirection * BasePart.Velocity.Magnitude) / 1.25), CFrame.Angles(math.rad(Angle), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, -1.5, 0) + ((THumanoid.MoveDirection * BasePart.Velocity.Magnitude) / 1.25), CFrame.Angles(math.rad(Angle), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + ((THumanoid.MoveDirection * BasePart.Velocity.Magnitude) / 1.25), CFrame.Angles(math.rad(Angle), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + ((THumanoid.MoveDirection * BasePart.Velocity.Magnitude) / 1.25), CFrame.Angles(math.rad(Angle), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0));
                            task.wait();
                        else 
                            FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0));
                            task.wait();
                        end 
                    else 
                        break;
                    end 
                until (BasePart.Velocity.Magnitude > 500) or (BasePart.Parent ~= TargetPlayer.Character) or (TargetPlayer.Parent ~= Players) or (not TargetPlayer.Character == TCharacter) or THumanoid.Sit or (Humanoid.Health <= 0) or (tick() > (Time + 2))  
            end;

            workspace.FallenPartsDestroyHeight = 0/0;
            local BV = Instance.new("BodyVelocity");
            BV.Name = "EpixVel";
            BV.Parent = RootPart;
            BV.Velocity = Vector3.new(900000000, 900000000, 900000000);
            BV.MaxForce = Vector3.new(1/0, 1/0, 1/0);
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false);

            if (TRootPart and THead) then 
                if ((TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5) then 
                    SFBasePart(THead);
                else 
                    SFBasePart(TRootPart);
                end 
            elseif (TRootPart and not THead) then 
                SFBasePart(TRootPart);
            elseif (not TRootPart and THead) then 
                SFBasePart(THead);
            elseif (not TRootPart and not THead and Accessory and Handle) then 
                SFBasePart(Handle);
            else 
                return Message("Error Occurred", "Target is missing everything", 5);
            end 

            BV:Destroy();
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true);
            workspace.CurrentCamera.CameraSubject = Humanoid;

            repeat 
                RootPart.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0);
                Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0));
                Humanoid:ChangeState("GettingUp");
                table.foreach(Character:GetChildren(), function(_, x) 
                    if x:IsA("BasePart") then 
                        x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new();
                    end 
                end);
                task.wait();
            until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25  
            
            workspace.FallenPartsDestroyHeight = getgenv().FPDH or -500;
        else 
            return Message("Error Occurred", "Random error", 5);
        end 
    end;

    if TargetPlayer then
        SkidFling(TargetPlayer)
    end
end

FlingBtn.MouseButton1Down:Connect(function() 
    playOofSound()
    local Targets = {FlingTextBox.Text};
    local Player = Players.LocalPlayer;
    local AllBool = false;

    local GetPlayer = function(Name) 
        Name = Name:lower();
        if ((Name == "all") or (Name == "others")) then 
            AllBool = true;
            return;
        elseif (Name == "random") then 
            local GetPlayers = Players:GetPlayers();
            if table.find(GetPlayers, Player) then 
                table.remove(GetPlayers, table.find(GetPlayers, Player));
            end 
            return GetPlayers[math.random(#GetPlayers)];
        elseif ((Name ~= "random") and (Name ~= "all") and (Name ~= "others")) then 
            for _, x in next, Players:GetPlayers() do 
                if (x ~= Player) then 
                    if x.Name:lower():match("^" .. Name) then 
                        return x;
                    elseif x.DisplayName:lower():match("^" .. Name) then 
                        return x;
                    end 
                end 
            end 
        else 
            return;
        end 
    end;

    local Message = function(_Title, _Text, Time) 
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time});
    end;

    local SkidFling = function(TargetPlayer) 
        local Character = Player.Character;
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid");
        local RootPart = Humanoid and Humanoid.RootPart;
        local TCharacter = TargetPlayer.Character;
        local THumanoid;
        local TRootPart;
        local THead;
        local Accessory;
        local Handle;

        if TCharacter:FindFirstChildOfClass("Humanoid") then 
            THumanoid = TCharacter:FindFirstChildOfClass("Humanoid");
        end 
        if (THumanoid and THumanoid.RootPart) then 
            TRootPart = THumanoid.RootPart;
        end 
        if TCharacter:FindFirstChild("Head") then 
            THead = TCharacter.Head;
        end 
        if TCharacter:FindFirstChildOfClass("Accessory") then 
            Accessory = TCharacter:FindFirstChildOfClass("Accessory");
        end 
        if (Accessory and Accessory:FindFirstChild("Handle")) then 
            Handle = Accessory.Handle;
        end 

        if (Character and Humanoid and RootPart) then 
            if (RootPart.Velocity.Magnitude < 50) then 
                getgenv().OldPos = RootPart.CFrame;
            end 
            if (THumanoid and THumanoid.Sit and not AllBool) then 
                return Message("Error Occurred", "Targeting is sitting", 5);
            end 
            if THead then 
                workspace.CurrentCamera.CameraSubject = THead;
            elseif (not THead and Handle) then 
                workspace.CurrentCamera.CameraSubject = Handle;
            elseif (THumanoid and TRootPart) then 
                workspace.CurrentCamera.CameraSubject = THumanoid;
            end 
            if not TCharacter:FindFirstChildWhichIsA("BasePart") then 
                return;
            end 

            local FPos = function(BasePart, Pos, Ang) 
                RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang;
                Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang);
                RootPart.Velocity = Vector3.new(90000000, 90000000 * 10, 90000000);
                RootPart.RotVelocity = Vector3.new(900000000, 900000000, 900000000);
            end;

            local SFBasePart = function(BasePart) 
                local TimeToWait = 2;
                local Time = tick();
                local Angle = 0;
                repeat 
                    if (RootPart and THumanoid) then 
                        if (BasePart.Velocity.Magnitude < 50) then 
                            Angle = Angle + 100;
                            FPos(BasePart, CFrame.new(0, 1.5, 0) + ((THumanoid.MoveDirection * BasePart.Velocity.Magnitude) / 1.25), CFrame.Angles(math.rad(Angle), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, -1.5, 0) + ((THumanoid.MoveDirection * BasePart.Velocity.Magnitude) / 1.25), CFrame.Angles(math.rad(Angle), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + ((THumanoid.MoveDirection * BasePart.Velocity.Magnitude) / 1.25), CFrame.Angles(math.rad(Angle), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + ((THumanoid.MoveDirection * BasePart.Velocity.Magnitude) / 1.25), CFrame.Angles(math.rad(Angle), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0));
                            task.wait();
                        else 
                            FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0));
                            task.wait();
                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0));
                            task.wait();
                        end 
                    else 
                        break;
                    end 
                until (BasePart.Velocity.Magnitude > 500) or (BasePart.Parent ~= TargetPlayer.Character) or (TargetPlayer.Parent ~= Players) or (not TargetPlayer.Character == TCharacter) or THumanoid.Sit or (Humanoid.Health <= 0) or (tick() > (Time + 2))  
            end;

            workspace.FallenPartsDestroyHeight = 0/0;
            local BV = Instance.new("BodyVelocity");
            BV.Name = "EpixVel";
            BV.Parent = RootPart;
            BV.Velocity = Vector3.new(900000000, 900000000, 900000000);
            BV.MaxForce = Vector3.new(1/0, 1/0, 1/0);
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false);

            if (TRootPart and THead) then 
                if ((TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5) then 
                    SFBasePart(THead);
                else 
                    SFBasePart(TRootPart);
                end 
            elseif (TRootPart and not THead) then 
                SFBasePart(TRootPart);
            elseif (not TRootPart and THead) then 
                SFBasePart(THead);
            elseif (not TRootPart and not THead and Accessory and Handle) then 
                SFBasePart(Handle);
            else 
                return Message("Error Occurred", "Target is missing everything", 5);
            end 

            BV:Destroy();
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true);
            workspace.CurrentCamera.CameraSubject = Humanoid;

            repeat 
                RootPart.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0);
                Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0));
                Humanoid:ChangeState("GettingUp");
                table.foreach(Character:GetChildren(), function(_, x) 
                    if x:IsA("BasePart") then 
                        x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new();
                    end 
                end);
                task.wait();
            until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25  
            
            workspace.FallenPartsDestroyHeight = getgenv().FPDH or -500;
        else 
            return Message("Error Occurred", "Random error", 5);
        end 
    end;

    if not Welcome then 
        Message("ZeroX System", "Loaded successfully!", 5);
    end 
    getgenv().Welcome = true;

    if Targets[1] then 
        for _, x in next, Targets do 
            GetPlayer(x);
        end 
    else 
        return;
    end 

    if AllBool then 
        for _, x in next, Players:GetPlayers() do 
            SkidFling(x);
        end 
    end 

    for _, x in next, Targets do 
        if (GetPlayer(x) and (GetPlayer(x) ~= Player)) then 
            if (GetPlayer(x).UserId ~= 1414978355) then 
                local TPlayer = GetPlayer(x);
                if TPlayer then 
                    SkidFling(TPlayer);
                end 
            else 
                Message("Error Occurred", "This user is whitelisted! (Owner)", 5);
            end 
        elseif (not GetPlayer(x) and not AllBool) then 
            Message("Error Occurred", "Username Invalid", 5);
        end 
    end 
end);

local loopFlingActive = false
local loopFlingConn = nil
LoopFlingBtn.MouseButton1Down:Connect(function()
    playClickSound()
    loopFlingActive = not loopFlingActive
    if loopFlingActive then
        LoopFlingBtn.Text = "Loop Fling: ON"
        LoopFlingBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
        loopFlingConn = RunService.Stepped:Connect(function()
            local targetName = FlingTextBox.Text:lower()
            if targetName ~= "" then
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= lp and (p.Name:lower():sub(1, #targetName) == targetName or p.DisplayName:lower():sub(1, #targetName) == targetName) then
                        executeFlingTarget(p)
                    end
                end
            end
        end)
    else
        LoopFlingBtn.Text = "Loop Fling: OFF"
        LoopFlingBtn.BackgroundColor3 = Color3.fromRGB(120, 20, 20)
        if loopFlingConn then loopFlingConn:Disconnect() end
    end
end)

ToolFlingBtn.MouseButton1Down:Connect(function()
    playClickSound()
    local tool = Instance.new("Tool")
    tool.Name = "ZeroX Fling Tool"
    tool.RequiresHandle = false
    tool.Parent = lp.Backpack

    tool.Activated:Connect(function()
        playOofSound()
        local mouse = lp:GetMouse()
        local target = mouse.Target
        if target and target.Parent then
            local character = target.Parent
            local targetPlayer = Players:GetPlayerFromCharacter(character)
            if targetPlayer and targetPlayer ~= lp then
                executeFlingTarget(targetPlayer)
            end
        end
    end)
end)

FlingV1Btn.MouseButton1Down:Connect(function() 
    playOofSound()
    local Target = gplr(FlingTextBox.Text);
    if Target[1] then 
        Target = Target[1];
        local Services = setmetatable({}, {
            __index = function(Self, Index) 
                local NewService = game.GetService(game, Index);
                if NewService then 
                    Self[Index] = NewService;
                end 
                return NewService;
            end
        });
        local LocalPlayer = Services.Players.LocalPlayer;
        
        local function PlayerAdded(Player) 
            local Detected = false;
            local Character;
            local PrimaryPart;
            
            local function CharacterAdded(NewCharacter) 
                Character = NewCharacter;
                repeat 
                    wait();
                    PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart");
                until PrimaryPart 
                Detected = false;
            end 
            
            CharacterAdded(Player.Character or Player.CharacterAdded:Wait());
            Player.CharacterAdded:Connect(CharacterAdded);
            
            Services.RunService.Heartbeat:Connect(function() 
                if (Character and Character:IsDescendantOf(workspace) and PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then 
                    if ((PrimaryPart.AssemblyAngularVelocity.Magnitude > 1) or (PrimaryPart.AssemblyLinearVelocity.Magnitude > 1)) then 
                        if (Detected == false) then 
                        end 
                        Detected = true;
                        for i, v in ipairs(Character:GetDescendants()) do 
                            v.CanCollide = false;
                        end 
                        PrimaryPart.CanCollide = false;
                    end 
                end 
            end);
        end 

        for i, v in ipairs(Services.Players:GetPlayers()) do 
            if (v ~= LocalPlayer) then 
                PlayerAdded(v);
            end 
        end 
        
        Services.Players.PlayerAdded:Connect(PlayerAdded);
        
        local BV = Instance.new("BodyVelocity");
        BV.Name = "Xxx";
        BV.Parent = lp;
        BV.Velocity = Vector3.new(900000000,900000000,900000000);
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0);
        
        local Thrust = Instance.new("BodyThrust", lp.Character.HumanoidRootPart);
        Thrust.Force = Vector3.new(20000,20000,20000);
        Thrust.Name = "YeetForce";
        
        repeat 
            lp.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame;
            Thrust.Location = Target.Character.HumanoidRootPart.Position;
            game:GetService("RunService").Heartbeat:wait();
        until not Target.Character:FindFirstChild("Head") 
    end 
end);

local minimized = false
MinButton.MouseButton1Down:Connect(function()
    playClickSound()
    minimized = not minimized
    MainElementsContainer.Visible = not minimized
    MainFrame.Size = minimized and UDim2.new(0, 210, 0, 22) or UDim2.new(0, 210, 0, 275)
    MinButton.Text = minimized and "+" or "-"
end)

CloseButton.MouseButton1Down:Connect(function()
    playClickSound()
    if flyingV3 then stopFly() end
    Camera.CameraSubject = lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") or lp.Character
    ScreenGui:Destroy()
end)
