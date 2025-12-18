wait()
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
local v_u_1 = Instance.new("BindableEvent")
v_u_1.Event:connect(function()
    game.ReplicatedStorage.MainEvent:FireServer("ResetNew")
end)
repeat
    task.wait(0.1)
until pcall(function()
    game.StarterGui:SetCore("ResetButtonCallback", v_u_1)
end)
local v_u_2 = game.Players.LocalPlayer
local v_u_3 = require(game.ReplicatedStorage.MainModule)
local v_u_4 = require(game.ReplicatedStorage.PhoneGUI)
v_u_2:WaitForChild("DataFolder", 3)
local v_u_5 = v_u_2.Character
local v_u_6 = workspace.CurrentCamera
local v_u_7 = v_u_2:GetMouse()
local v_u_8 = game:GetService("RunService")
local v_u_9 = game:GetService("HttpService")
local v_u_10 = game:FindService("TweenService")
local v_u_11 = game:GetService("ReplicatedStorage")
local v_u_12 = game:GetService("SocialService")
local v_u_13 = require(v_u_11:WaitForChild("GunSoundPlay"))
local v_u_14 = v_u_5:WaitForChild("BodyEffects")
local v_u_15 = game:GetService("UserInputService")
local v_u_16 = {}
local v_u_17 = game.ReplicatedStorage:WaitForChild("MainEvent")
local v_u_18 = game:GetService("StarterGui")
local v_u_19 = v_u_2.PlayerGui:WaitForChild("MainScreenGui")
local v_u_20 = v_u_2.PlayerGui:WaitForChild("LockedCrosshair")
local v_u_21 = v_u_19:WaitForChild("Aim")
game:GetService("ContextActionService")
local v_u_22 = game:GetService("RunService")
local v23 = game:GetService("UserInputService")
local v_u_24 = false
local v_u_25 = false
local v_u_26 = {}
v_u_5:WaitForChild("Humanoid")
v_u_5:WaitForChild("FULLY_LOADED_CHAR", 16)
local v_u_27 = require(game.ReplicatedStorage.SlideModule)
local v_u_28 = require(v_u_11:WaitForChild("Modules"):WaitForChild("GunHandler"))
local v_u_29 = require(v_u_11.Modules.Janitor)
local v_u_30 = v_u_5.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.SlideModule.SlideAnim)
v_u_27.slidedebounce = false
v_u_27.slide = false
v_u_5.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.ClientAnimations.Sprint)
local v_u_31 = v_u_5.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.ClientAnimations.SmallGunAim)
local v_u_32 = v_u_5.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.ClientAnimations.SmallGunAimShot)
local v_u_33 = v_u_5.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.ClientAnimations.SmallGunShot)
local v_u_34 = v_u_5.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.ClientAnimations.Stomp)
local v_u_35 = v_u_5.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.ClientAnimations.Crouching)
local v_u_36 = v_u_5.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.ClientAnimations.SwimIdle)
local v_u_37 = false
local v_u_38 = false
local v_u_39 = {
    ["DribbleLeft"] = v_u_5.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.ClientAnimations.Basketball["Dribble(Left)"]),
    ["DribbleRight"] = v_u_5.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.ClientAnimations.Basketball["Dribble(Right)"]),
    ["CrossLeft"] = v_u_5.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.ClientAnimations.Basketball["Cross(Left)"]),
    ["CrossRight"] = v_u_5.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.ClientAnimations.Basketball["Cross(Right)"]),
    ["BTBLeft"] = v_u_5.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.ClientAnimations.Basketball["BTB(Left)"]),
    ["BTBRight"] = v_u_5.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.ClientAnimations.Basketball["BTB(Right)"])
}
v_u_39.DribbleLeft.Priority = Enum.AnimationPriority.Movement
v_u_39.DribbleRight.Priority = Enum.AnimationPriority.Movement
local v_u_40 = false
_G.MobleAimingIn = v_u_40
v_u_19.Enabled = true
if _G.GUN_COMBAT_TOGGLE == nil then
    _G.GUN_COMBAT_TOGGLE = false
end
_G.WalletDropConnections = false
local v_u_41 = false
local v_u_42 = false
v_u_7.TargetFilter = workspace:WaitForChild("Ignored"):WaitForChild("Siren"):WaitForChild("Radius")
v_u_6.CameraType = Enum.CameraType.Custom
spawn(function()
    repeat
        wait()
    until v_u_5:WaitForChild("Humanoid")
    v_u_6.CameraSubject = v_u_5.Humanoid
end)
function changefunc()
    local v_u_45 = {
        ["functions"] = {},
        ["connect"] = function(_, p43)
            local v44 = v_u_45.functions
            table.insert(v44, p43)
        end
    }
    local v_u_46 = nil
    function v_u_45.updatechanges(_, p_u_47)
        for _, v_u_48 in pairs(v_u_45.functions) do
            spawn(function()
                v_u_48(p_u_47.Press, p_u_47.Time, v_u_46)
            end)
        end
        v_u_46 = p_u_47.Time
    end
    return v_u_45
end
setmetatable(v_u_16, {
    ["__index"] = function(_, p49)
        local v50 = v_u_16
        if getmetatable(v50)[p49] == nil then
            v_u_16[p49] = {}
        end
        local v51 = v_u_16
        return getmetatable(v51)[p49]
    end,
    ["__newindex"] = function(_, p52, p53)
        local v54 = v_u_16
        if getmetatable(v54)[p52] == nil then
            local v55 = v_u_16
            getmetatable(v55)[p52] = {
                ["val"] = p53,
                ["changed"] = changefunc()
            }
        else
            local v56 = v_u_16
            getmetatable(v56)[p52].val = p53
            local v57 = v_u_16
            getmetatable(v57)[p52].changed:updatechanges(p53)
        end
    end
})
v_u_15.InputBegan:connect(function(p58, p59)
    if not p59 or p58.UserInputType == Enum.UserInputType.Keyboard and p58.KeyCode == Enum.KeyCode.LeftShift or p58.UserInputType == Enum.UserInputType.Gamepad1 and p58.KeyCode == Enum.KeyCode.ButtonL2 then
        if p58.UserInputType == Enum.UserInputType.Keyboard or p58.UserInputType == Enum.UserInputType.Gamepad1 then
            v_u_16[p58.KeyCode.Name] = {
                ["Press"] = true,
                ["Time"] = tick()
            }
            return
        end
        if p58.UserInputType == Enum.UserInputType.MouseButton2 then
            v_u_16[Enum.UserInputType.MouseButton2.Name] = {
                ["Press"] = true,
                ["Time"] = tick()
            }
        end
    end
end)
v_u_15.InputEnded:connect(function(p60, p61)
    if not p61 or p60.UserInputType == Enum.UserInputType.Keyboard and p60.KeyCode == Enum.KeyCode.LeftShift or p60.UserInputType == Enum.UserInputType.Gamepad1 and p60.KeyCode == Enum.KeyCode.ButtonL2 then
        if p60.UserInputType == Enum.UserInputType.Keyboard or p60.UserInputType == Enum.UserInputType.Gamepad1 then
            v_u_16[p60.KeyCode.Name] = {
                ["Press"] = false,
                ["Time"] = tick()
            }
            return
        end
        if p60.UserInputType == Enum.UserInputType.MouseButton2 then
            v_u_16[Enum.UserInputType.MouseButton2.Name] = {
                ["Press"] = false,
                ["Time"] = tick()
            }
        end
    end
end)
local v_u_62 = false
v_u_16.Q.changed:connect(function(p63)
    if p63 and (v_u_62 == false and (v_u_3.Activate(v_u_14) and (v_u_2.DataFolder.Information:FindFirstChild("JJARC") and (v_u_14.Mask.Value == "[Breathing Mask]" and v_u_5:FindFirstChild("In-gameMask"))))) then
        v_u_62 = true
        v_u_17:FireServer("BreathingHAMON")
        wait(2)
        v_u_62 = false
    end
end)
local v_u_64 = v_u_5.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.ClientAnimations.Block)
local v_u_65 = false
v_u_16.F.changed:connect(function(p66, _, _)
    v_u_17:FireServer("Block", p66)
end)
v_u_16.ButtonY.changed:connect(function(p67)
    v_u_17:FireServer("Block", p67)
end)
v_u_19.MobileLayout.Block.Activated:Connect(function()
    local v68 = Enum.UserInputState.Begin
    local v69
    if v68 then
        if v68 == Enum.UserInputState.Begin then
            v_u_65 = not v_u_65
            v69 = v_u_65
        else
            v69 = v_u_65
        end
    else
        v69 = true
    end
    v_u_17:FireServer("Block", v69)
end)
function Blocking(p70)
    if p70 then
        v_u_64:Play()
    else
        v_u_64:Stop()
    end
end
v_u_19:WaitForChild("Leaderboard")
if _G.LeaderBoardVisible == true or _G.LeaderBoardVisible == nil then
    v_u_19.Leaderboard.Visible = true
    _G.LeaderBoardVisible = true
else
    v_u_19.Leaderboard.Visible = false
end
_G.LeaderBoardVisible = _G.LeaderBoardVisible or false
v_u_16.Tab.changed:connect(function(p71)
    if p71 then
        _G.LeaderBoardVisible = not _G.LeaderBoardVisible
        v_u_19.Leaderboard.Visible = _G.LeaderBoardVisible
    end
end)
local v_u_72 = false
v_u_19.Leaderboard.TextButton.MouseButton1Click:connect(function()
    if v_u_72 == false then
        game:GetService("TweenService"):Create(v_u_19.Leaderboard, TweenInfo.new(0.5), {
            ["Position"] = UDim2.new(1, -205, 0, -200)
        }):Play()
        v_u_19.Leaderboard.TextButton.Text = "OPEN"
        v_u_19.Leaderboard.TextButton.BackgroundColor3 = Color3.fromRGB(119, 255, 89)
    else
        game:GetService("TweenService"):Create(v_u_19.Leaderboard, TweenInfo.new(0.5), {
            ["Position"] = UDim2.new(1, -205, 0, 5)
        }):Play()
        v_u_19.Leaderboard.TextButton.Text = "CLOSE"
        v_u_19.Leaderboard.TextButton.BackgroundColor3 = Color3.fromRGB(255, 131, 131)
    end
    wait(0.5)
    v_u_72 = not v_u_72
end)
v_u_16.LeftShift.changed:connect(function(p73, _, _)
    if p73 then
        v_u_24 = true
    else
        v_u_24 = false
    end
end)
v_u_16.ButtonL3.changed:connect(function(p74)
    if p74 then
        v_u_24 = true
    else
        v_u_24 = false
    end
end)
local v_u_75 = false
v_u_19.MobileLayout.Sprint.Activated:Connect(function()
    local v76 = Enum.UserInputState.Begin
    if v76 and v76 == Enum.UserInputState.Begin then
        v_u_75 = not v_u_75
        v_u_24 = v_u_75
    end
end)
local v_u_77 = true
v_u_16.MouseButton2.changed:connect(function(p78, _, _)
    if v_u_77 ~= false then
        v_u_25 = p78
        if v_u_25 == false then
            v_u_77 = false
            wait(0.1)
            v_u_77 = true
        end
    end
end)
v_u_16.ButtonL2.changed:connect(function(p79)
    if v_u_77 ~= false then
        v_u_25 = p79
        if v_u_25 == false then
            v_u_77 = false
            wait(0.1)
            v_u_77 = true
        end
    end
end)
local v_u_80 = false
local function v_u_93()
    local v81 = false
    if v_u_80 == false and v_u_3.Activate(v_u_14) then
        v_u_80 = true
        local v82 = Ray.new
        local v83 = v_u_5.LowerTorso.Position
        local v84 = -v_u_5.UpperTorso.Size.y * 4.5
        local v85 = v82(v83, (Vector3.new(0, v84, 0)))
        local v86 = workspace
        local v87 = {}
        local v88 = v_u_5
        local v89 = v_u_3.Ignored
        __set_list(v87, 1, {v88, unpack(v89)})
        local v90 = v86:FindPartOnRayWithIgnoreList(v85, v87)
        local v91
        if v90 and v90:IsDescendantOf(workspace.Players) then
            v91 = v90.Parent:FindFirstChild("Humanoid") or (v90.Parent.Parent:FindFirstChild("Humanoid") or v90.Parent.Parent.Parent:FindFirstChild("Humanoid"))
        else
            v91 = nil
        end
        if v91 then
            v_u_34:Play(0.100000001, 1, 1.5)
            wait(0.75)
            v_u_17:FireServer("Stomp")
            wait(0.4)
            v81 = true
        end
        v_u_80 = false
    end
    if v81 then
        return
    elseif v_u_41 then
        v_u_17:FireServer("Stomp", v_u_41)
    else
        local v92 = v_u_14.Grabbed.Value
        if v92 and (v92:FindFirstChild("GRABBING_CONSTRAINT") and (v92.GRABBING_CONSTRAINT:FindFirstChild("BindableE") and not v_u_80)) then
            v_u_80 = true
            v_u_17:FireServer("Stomp")
            task.wait(0.1)
            v_u_80 = false
        end
    end
end
v_u_19.MobileLayout.Stomp.Activated:Connect(function()
    v_u_93(true)
end)
v_u_16.E.changed:connect(function(p94, _, _)
    if p94 then
        v_u_93()
    end
end)
v_u_16.DPadDown.changed:connect(function(p95)
    if p95 then
        v_u_93()
    end
end)
local v_u_96 = false
v_u_19.MobileLayout.Crouch.Activated:Connect(function()
    local v97 = Enum.UserInputState.Begin
    local v98
    if v97 then
        if v97 == Enum.UserInputState.Begin then
            v_u_96 = not v_u_96
            v98 = v_u_96
        else
            v98 = v_u_96
        end
    else
        v98 = true
    end
    v_u_41 = v98
end)
v_u_16.LeftControl.changed:connect(function(p99, _, _)
    v_u_41 = p99
end)
v_u_16.Q.changed:connect(function(p100, _, _)
    v_u_41 = p100
end)
v_u_16.ButtonB.changed:connect(function(p101)
    v_u_41 = p101
end)
local v_u_102 = false
local function v_u_105(p103, p104)
    if p103 and (not v_u_102 and v_u_5:GetAttribute("BasketballHolder")) then
        v_u_102 = true
        v_u_37 = not v_u_37
        if v_u_37 then
            if p104 then
                v_u_39.BTBLeft:Play(0.100000001, 1, 0.7)
            else
                v_u_39.CrossLeft:Play()
            end
            if not v_u_39.DribbleLeft.IsPlaying then
                v_u_39.DribbleLeft:Play()
            end
            if v_u_39.DribbleRight.IsPlaying then
                v_u_39.DribbleRight:Stop()
            end
        else
            if p104 then
                v_u_39.BTBRight:Play(0.100000001, 1, 0.7)
            else
                v_u_39.CrossRight:Play()
            end
            if v_u_39.DribbleLeft.IsPlaying then
                v_u_39.DribbleLeft:Stop()
            end
            if not v_u_39.DribbleRight.IsPlaying then
                v_u_39.DribbleRight:Play()
            end
        end
        task.wait(0.6)
        if p104 then
            task.wait(0.25)
        end
        v_u_102 = false
    end
end
v_u_16.ButtonA.changed:connect(function(p106)
    v_u_105(p106)
end)
v_u_16.C.changed:connect(function(p107)
    v_u_105(p107)
end)
v_u_16.V.changed:connect(function(p108)
    v_u_105(p108, true)
end)
v_u_19.MobileLayout.Basketball.Activated:Connect(function()
    v_u_105(true)
end)
local v_u_109 = false
local function v_u_110()
    if v_u_109 == false and (v_u_14.Attacking.Value == false and (v_u_14["K.O"].Value == false and v_u_5:FindFirstChild("GRABBING_CONSTRAINT") == nil)) then
        v_u_109 = true
        v_u_17:FireServer("Grabbing", v_u_41)
        wait(0.5)
        v_u_109 = false
    end
end
v_u_19.MobileLayout.Carry.Activated:Connect(function()
    v_u_110(true)
end)
v_u_16.G.changed:connect(function(p111, _, _)
    if p111 then
        v_u_110()
    end
end)
v_u_16.DPadUp.changed:connect(function(p112)
    if p112 then
        v_u_110()
    end
end)
v_u_19.MobileLayout.Reload.Activated:Connect(function()
    local v113 = v_u_3.GunHold(v_u_5)
    if v113 then
        v_u_17:FireServer("Reload", v113[1])
    end
end)
v_u_19.MobileLayout.RightClick.Activated:Connect(function()
    v_u_40 = not v_u_40
    _G.MobleAimingIn = v_u_40
end)
v_u_16.R.changed:connect(function(p114, _, _)
    if p114 then
        local v115 = v_u_3.GunHold(v_u_5)
        if v115 then
            v_u_17:FireServer("Reload", v115[1])
        end
    end
end)
v_u_16.ButtonX.changed:connect(function(p116)
    if p116 then
        local v117 = v_u_3.GunHold(v_u_5)
        if v117 then
            v_u_17:FireServer("Reload", v117[1])
        end
    end
end)
if v_u_3.IsMobile() then
    v_u_19.Crew.BottomLeft.Frame.MouseLock.Visible = true
end
_G.UpdateAimed(false, nil, true)
local v_u_118 = false
_G.MobileShiftLock = false
v_u_19.Crew.BottomLeft.Frame.MouseLock.Activated:connect(function()
    v_u_118 = not v_u_118
    if v_u_118 then
        v_u_21.Visible = true
    else
        v_u_21.Visible = true
    end
    _G.MobileShiftLock = v_u_118
    _G.UpdateAimed(v_u_118, true)
end)
if v_u_15.GamepadEnabled or game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(v_u_2) == "KR" then
    workspace.DescendantAdded:connect(function(p119)
        if p119.Name == "Blood_Decal" then
            p119.Transparency = 1
        elseif p119.Name == "BloodParticle" then
            p119.Transparency = NumberSequence.new(1)
        end
        if _G.storeMeshes then
            _G.storeMeshes(p119)
        end
    end)
end
v_u_2.ChildAdded:Connect(function(p120)
    if p120.Name == "CalculateShoot" then
        local v121 = p120:GetAttribute("Position")
        local v122 = p120:GetAttribute("Range")
        local v123 = (v_u_7.Hit.p - v121).Unit
        local v124 = RaycastParams.new()
        local v125 = {}
        local v126 = v_u_5
        local v127 = require(game.ReplicatedStorage.MainModule).Ignored
        __set_list(v125, 1, {v126, unpack(v127)})
        v124.FilterDescendantsInstances = v125
        v124.FilterType = Enum.RaycastFilterType.Exclude
        v124.IgnoreWater = true
        local v128 = workspace:Raycast(v121, v123 * v122, v124)
        local v129, v130, v131
        if v128 then
            v129 = v128.Instance
            v130 = v128.Position
            v131 = v128.Normal
        else
            v130 = v121 + v123 * v122
            v129 = nil
            v131 = nil
        end
        v_u_17:FireServer("CalculateShootClient", p120, v129, v130, v131)
    end
end)
local v_u_132 = {
    ["timer"] = tick(),
    ["times"] = 0,
    ["disabling"] = false
}
v_u_2.Backpack.ChildAdded:connect(function(p133)
    if p133:IsA("Tool") and (v_u_5 and v_u_5:GetAttribute("GunsLoaded")) then
        if tick() - v_u_132.timer < 0.1 then
            v_u_132.times = v_u_132.times + 1
        else
            v_u_132.times = 0
        end
        if v_u_132.times >= 4 and v_u_132.disabling == false then
            v_u_132.disabling = true
            game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
            delay(1, function()
                v_u_132.disabling = false
                game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
            end)
        end
        v_u_132.timer = tick()
    end
end)
v_u_14.ChildAdded:connect(function(p134)
    if p134.Name == "Block" then
        Blocking(true)
    end
end)
v_u_14.ChildRemoved:connect(function(p135)
    if p135.Name == "Block" then
        Blocking(false)
    end
end)
v_u_19:WaitForChild("AmmoFrame")
v_u_19.AmmoFrame.Visible = false
v_u_14:WaitForChild("K.O")
v_u_14["K.O"].Changed:connect(function(p136)
    if p136 then
        v_u_6.CameraSubject = v_u_5.UpperTorso
        v_u_18:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
        while v_u_14["K.O"].Value or v_u_5:FindFirstChild("GRABBING_CONSTRAINT") do
            if v_u_5:FindFirstChild("GRABBING_CONSTRAINT") then
                local v137 = v_u_5.GRABBING_CONSTRAINT:GetAttribute("PLAYER_HOLD")
                local v138 = workspace.Vehicles:FindFirstChild(v137)
                if v138 then
                    v_u_6.CameraSubject = v138
                else
                    v_u_6.CameraSubject = v_u_5.UpperTorso
                end
            else
                v_u_6.CameraSubject = v_u_5.UpperTorso
            end
            v_u_6.CameraSubject = v_u_6.CameraSubject
            task.wait()
        end
        v_u_6.CameraSubject = v_u_5.Humanoid
    else
        v_u_6.CameraSubject = v_u_5.Humanoid
        v_u_18:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
    end
end)
local v_u_139 = v_u_2:WaitForChild("DataFolder", 36)
v_u_139:WaitForChild("Currency", 36)
local v_u_140 = nil
local function v_u_145(p141)
    script.CurrencySound:Play()
    local v142, v143
    if p141 > 0 then
        v142 = Color3.fromRGB(95, 255, 87)
        v143 = "+ $" .. v_u_3.AddComma(p141)
    else
        v142 = Color3.fromRGB(194, 0, 0)
        v143 = "- $" .. v_u_3.AddComma((math.abs(p141)))
    end
    local v_u_144 = Instance.new("TextLabel")
    v_u_144.Name = "MONEYDELTA"
    v_u_144.Text = v143
    v_u_144.BackgroundTransparency = 1
    v_u_144.AnchorPoint = Vector2.new(0.5, 0.5)
    v_u_144.Position = UDim2.new(0.5, 0, 0, 40)
    v_u_144.TextColor3 = v142
    v_u_144.Size = UDim2.new(0, 50, 0, 50)
    v_u_144.Font = Enum.Font.GothamBold
    v_u_144.TextSize = 25
    v_u_144.Parent = v_u_19
    delay(0.3, function()
        game:GetService("TweenService"):Create(v_u_144, TweenInfo.new(1), {
            ["Position"] = UDim2.new(0.5, 0, 0, -40),
            ["TextTransparency"] = 1
        }):Play()
        wait(1)
        v_u_144:Destroy()
    end)
end
v_u_139.Currency.Changed:connect(function()
    v_u_19.MoneyText.Text = "$" .. v_u_3.AddComma(v_u_139.Currency.Value)
    if v_u_140 ~= nil then
        v_u_145(v_u_139.Currency.Value - v_u_140)
    end
    v_u_140 = v_u_139.Currency.Value
end)
v_u_19.MoneyText.Text = "$" .. v_u_3.AddComma(v_u_139.Currency.Value)
if v_u_140 ~= nil then
    v_u_145(v_u_139.Currency.Value - v_u_140)
end
v_u_140 = v_u_139.Currency.Value
v_u_18:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
v_u_14:WaitForChild("GunShotChanges")
v_u_14.GunShotChanges.Changed:connect(function()
    local v146 = v_u_3.GunHold(v_u_5)
    if v146 == nil or v146 == false then
        return
    else
        local v147 = (not v146 or (not v146[1] or v146[1].Ammo.Value > 0)) and true or false
        if v146[1].Name ~= "[Flamethrower]" then
            local v148 = math.random() > 0.5 and 0.008726646259971648 or -0.008726646259971648
            v_u_6.CFrame = v_u_6.CFrame * CFrame.Angles(0.004363323129985824, v148 * 0.5, 0)
            if _G.Aimed or (v146[1].Name == "[Shotgun]" or (v146[1].Name == "[Drum-Shotgun]" or (v146[1].Name == "[Rifle]" or (v146[1].Name == "[TacticalShotgun]" or (v146[1].Name == "[AR]" or (v146[1].Name == "[AUG]" or (v146[1].Name == "[AK47]" or (v146[1].Name == "[LMG]" or v146[1].Name == "[SilencerAR]")))))))) then
                if v147 then
                    v_u_32:Play()
                    return
                end
            else
                v_u_6.CFrame = v_u_6.CFrame * CFrame.Angles(0.004363323129985824, v148 * 0.5, 0)
                if v147 then
                    v_u_33:Play(0.100000001, 1, 1.25)
                end
            end
        end
    end
end)
function game.ReplicatedStorage.RemoteFunction.RemoteFunction.OnClientInvoke(p149, ...)
    if p149 == "Aim" then
        local v150, v151 = ...
        local v152 = v_u_3.GunHold(v_u_5)
        if v152 ~= nil and v152 ~= false then
            local v153 = (not v152 or (not v152[1] or v152[1].Ammo.Value > 0)) and true or false
            local v154
            if _G.Aimed or (v152[1].Name == "[Shotgun]" or (v152[1].Name == "[Rifle]" or v152[1].Name == "[AR]")) then
                v154 = (v_u_7.Hit.p - v150).unit
                if v153 then
                    v_u_32:Play()
                end
            else
                local v155 = v_u_7.Hit.p
                local v156 = (math.random() - 0.5) * 0.15
                v154 = (v155 + Vector3.new(0, v156, 0) - v150).unit
                if v153 then
                    v_u_33:Play(0.100000001, 1, 1.25)
                end
            end
            if _G.GUN_COMBAT_TOGGLE and v151 ~= true then
                for _, v157 in pairs(workspace.Players:GetChildren()) do
                    if v157 ~= v_u_5 and (v157:FindFirstChild("Humanoid") and (v157.Humanoid.Health > 0 and (v157:FindFirstChild("UpperTorso") and (v157.UpperTorso.Position - v_u_5.UpperTorso.Position).magnitude < 5))) then
                        return true
                    end
                end
            end
            return v154
        end
    else
        if p149 == "MOUSEPOS" then
            return v_u_7.Hit.p
        end
        if p149 == "CLOSECOMBAT" then
            for _, v158 in pairs(workspace.Players:GetChildren()) do
                if v158 ~= v_u_5 and (v158:FindFirstChild("Humanoid") and (v158.Humanoid.Health > 0 and (v158:FindFirstChild("UpperTorso") and (v158.UpperTorso.Position - v_u_5.UpperTorso.Position).magnitude < 5))) then
                    return true
                end
            end
            return false
        end
        if p149 == "LOCK_PICK" then
            local v159 = v_u_19.LockPick
            v159.Visible = true
            local v_u_160 = false
            local v_u_161 = nil
            v_u_161 = v_u_7.Button1Down:connect(function()
                v_u_160 = true
                v_u_161:disconnect()
            end)
            local v162 = 0
            while v_u_160 == false do
                v162 = v162 + 0.01
                local v163 = v162 % 1
                if v163 > 0.3 and v163 < 0.7 then
                    v162 = v162 + 0.01
                end
                v159.Green.Position = UDim2.new(v162 % 1, 0, 0.5, 0)
                game:GetService("RunService").Heartbeat:wait()
            end
            local v164 = v162 % 1
            v159.Visible = false
            return v164 > 0.4 and v164 < 0.6
        end
        if p149 == "Join/Leave" then
            local v165 = v_u_19.AreYouSure
            v165.Visible = true
            local v_u_166 = nil
            local v167 = v165.TextButton.MouseButton1Click:connect(function()
                v_u_166 = true
            end)
            local v168 = v165.TextButton2.MouseButton1Click:connect(function()
                v_u_166 = false
            end)
            repeat
                wait()
            until v_u_166 ~= nil
            v167:disconnect()
            v168:disconnect()
            v165.Visible = false
            return v_u_166
        end
    end
end
local v_u_169 = nil
local v_u_170 = false
local v_u_171 = false
local v_u_172 = 0
local v_u_173 = false
local v_u_174 = nil
local v_u_175 = false
local v_u_176 = false
local v_u_177 = nil
local v_u_178 = v_u_29.new()
v_u_6:ClearAllChildren()
local function v_u_192(p179, p180)
    local v181 = {}
    for _, v182 in ipairs(p180) do
        local v183 = v182[3]
        if v183 then
            local v184 = v183.categoryName
            local v185 = v183.skinName
            if v184 and v185 then
                v181[v184] = v181[v184] or {}
                v181[v184][v185] = (v181[v184][v185] or 0) + 1
            end
        end
    end
    for v186, v187 in pairs(v181) do
        if p179[v186] then
            for v188, v189 in pairs(v187) do
                if p179[v186][v188] then
                    local v190 = p179[v186]
                    local v191 = p179[v186][v188] - v189
                    v190[v188] = math.max(0, v191)
                end
            end
        end
    end
    return p179
end
local function v_u_193()
    if v_u_171 == false and (v_u_170 ~= false and v_u_6:FindFirstChild(v_u_170[1])) then
        v_u_171 = true
        v_u_175 = true
        v_u_176 = false
        if v_u_174 then
            v_u_176 = v_u_11.MainRemoteFunction:InvokeServer("UpdateHouseItem", v_u_170[1], v_u_172, v_u_174, v_u_6[v_u_170[1]]:GetPrimaryPartCFrame(), v_u_177)
        else
            v_u_17:FireServer("PlaceHouseItem", v_u_170[1], v_u_172, nil, v_u_6[v_u_170[1]]:GetPrimaryPartCFrame(), v_u_177)
        end
        wait(0.1)
        v_u_171 = false
    end
end
local function v_u_195()
    if v_u_170 and v_u_170[1] == "SkinDisplayer" or v_u_170[1] == "SkinDisplayerFrame" then
        if not v_u_169 then
            v_u_169 = require(v_u_11.Modules.SkinSelector).new(v_u_19)
            v_u_169:setSkins((v_u_192(v_u_9:JSONDecode(v_u_2.DataFolder.Skins.Value), (v_u_9:JSONDecode(v_u_2.DataFolder.Information.HouseSave.Value)))))
        end
        v_u_169:setVisible(true):andThen(function(p194)
            v_u_177 = p194
        end)
    end
end
function unselectHouseItem()
    v_u_19.EditFrame.Place.Visible = false
    v_u_19.EditFrame.Delete.Visible = false
    v_u_19.EditFrame.Rotate.Visible = false
    v_u_19.EditFrame.Configure.Visible = false
    if v_u_169 then
        v_u_169:setVisible(false)
    end
    v_u_6:ClearAllChildren()
    v_u_170 = false
    skinSelectorSelectedSkin = nil
end
local function v_u_200(p196)
    if game.ReplicatedStorage.BattleRoyale.Value == false and v_u_171 == false then
        v_u_171 = true
        v_u_6:ClearAllChildren()
        local v197 = v_u_29.new()
        if v_u_15.MouseEnabled then
            v197:Add(v_u_15.InputBegan:Connect(function(p198, p199)
                if p199 then
                    return
                elseif p198.UserInputType == Enum.UserInputType.MouseButton1 and not v_u_173 then
                    v_u_193()
                elseif p198.KeyCode == Enum.KeyCode.R then
                    if v_u_171 == false then
                        v_u_171 = true
                        v_u_172 = (v_u_172 + 90) % 360
                        wait(0.1)
                        v_u_171 = false
                        return
                    end
                elseif p198.KeyCode == Enum.KeyCode.C then
                    v_u_195()
                end
            end))
        end
        skinSelectorSelectedSkin = nil
        v_u_177 = nil
        v_u_170 = { p196, v_u_2.OwnHouseTag.Value.PrimaryPart.CFrame, v197 }
        v_u_19.EditFrame.Place.Visible = true
        v_u_19.EditFrame.Delete.Visible = true
        v_u_19.EditFrame.Rotate.Visible = true
        v_u_19.EditFrame.Configure.Visible = p196 == "SkinDisplayer" and true or p196 == "SkinDisplayerFrame"
        wait(0.5)
        v_u_171 = false
    end
end
local function v_u_204(p_u_201)
    local v_u_202 = Instance.new("Highlight")
    v_u_202.Name = "HouseItemHighlight"
    v_u_202.FillColor = Color3.fromRGB(255, 0, 4)
    v_u_202.Enabled = false
    v_u_202.Parent = p_u_201
    v_u_178:Add(v_u_202)
    local v203 = Instance.new("ClickDetector")
    v203.MaxActivationDistance = 32
    v203.Parent = p_u_201
    v_u_178:Add(v203)
    v_u_178:Add(v203.MouseHoverEnter:Connect(function()
        if not v_u_170 then
            v_u_202.Enabled = true
        end
    end))
    v_u_178:Add(v203.MouseHoverLeave:Connect(function()
        v_u_202.Enabled = false
    end))
    v_u_178:Add(v203.MouseClick:Connect(function()
        if not v_u_170 then
            v_u_175 = false
            v_u_174 = p_u_201:GetAttribute("PlacedAt")
            p_u_201.Parent = v_u_11.TempRemoval
            v_u_178:Add(function()
                task.delay(0.05, function()
                    if p_u_201.Parent then
                        p_u_201.Parent = v_u_2.OwnHouseTag.OwnFolderTag.Value
                    end
                end)
                unselectHouseItem()
                v_u_19.EditFrame.Configure.Visible = false
                v_u_177 = nil
            end)
            v_u_200(p_u_201.Name)
            if p_u_201.Name == "SkinDisplayer" or p_u_201.Name == "SkinDisplayerFrame" then
                v_u_177 = {
                    ["skinName"] = p_u_201:GetAttribute("SkinName"),
                    ["categoryName"] = p_u_201:GetAttribute("CategoryName")
                }
            end
        end
    end))
end
local function v_u_208()
    v_u_178:Cleanup()
    local v205 = v_u_2.OwnHouseTag.OwnFolderTag.Value
    v_u_178:Add(function()
        v_u_174 = nil
    end)
    for _, v206 in v205:GetChildren() do
        if v206:IsA("Model") then
            v_u_204(v206)
        end
    end
    v_u_178:Add(v205.ChildAdded:Connect(function(p207)
        if p207:IsA("Model") then
            v_u_204(p207)
        end
    end))
end
function updateEditFurniture()
    v_u_178:Cleanup()
    if v_u_19.EditFrame.Visible == true then
        v_u_208()
    end
    local v209 = v_u_3.GetMyHouseLimit(v_u_2)
    local v210 = v_u_3.GetMyHouseMaxLimit(v_u_2)
    v_u_19.EditFrame.Limit.TextLabel.Text = v209 .. "/" .. v210
    if v_u_2.DataFolder.Information:FindFirstChild("FurnitureData") then
        local v211 = v_u_3.DecodeFurnitureData(v_u_2)
        local v212 = 0
        for v_u_213, v214 in pairs(v211) do
            if tonumber(v214) then
                v212 = v212 + (75 + v_u_19.EditFrame.ScrollingFrame.UIListLayout.Padding.Offset)
                if v_u_19.EditFrame.ScrollingFrame:FindFirstChild(v_u_213) == nil then
                    local v215 = Instance.new("ViewportFrame")
                    v215.Size = UDim2.new(0, 75, 0, 75)
                    v215.Name = v_u_213
                    v215.BackgroundColor3 = Color3.new(1, 1, 1)
                    local v216 = game.ReplicatedStorage.HouseItemSale[v_u_213]:Clone()
                    v216.Parent = v215
                    local v217 = Instance.new("Camera")
                    v217.CFrame = CFrame.new(v216:GetBoundingBox().p + Vector3.new(0, 3, 5), v216:GetBoundingBox().p)
                    v217.Parent = v215
                    v215.LightDirection = Vector3.new(0, 0, -1)
                    v215.CurrentCamera = v217
                    local v218 = Instance.new("TextButton")
                    v218.Name = "ValueText"
                    v218.TextSize = 30
                    v218.TextColor3 = Color3.new(1, 0, 0)
                    v218.TextStrokeTransparency = 0
                    v218.TextStrokeColor3 = Color3.new(1, 1, 1)
                    v218.Font = Enum.Font.SourceSansBold
                    v218.Size = UDim2.new(1, 0, 1, 0)
                    v218.BackgroundTransparency = 1
                    v218.TextXAlignment = Enum.TextXAlignment.Right
                    v218.TextYAlignment = Enum.TextYAlignment.Bottom
                    v218.Text = "x" .. v214
                    v218.Parent = v215
                    v215.Parent = v_u_19.EditFrame.ScrollingFrame
                    v218.MouseButton1Click:connect(function()
                        local v219 = v_u_170
                        if v219 then
                            v219 = v_u_170[1] == v_u_213
                        end
                        unselectHouseItem()
                        if not v219 then
                            v_u_174 = nil
                            v_u_200(v_u_213)
                        end
                    end)
                else
                    v_u_19.EditFrame.ScrollingFrame:FindFirstChild(v_u_213).ValueText.Text = "x" .. v214
                    if v214 <= 0 and workspace.CurrentCamera:FindFirstChild(v_u_213) or v_u_174 then
                        unselectHouseItem()
                    end
                end
            end
        end
        v_u_19.EditFrame.ScrollingFrame.CanvasSize = UDim2.new(0, v212, 0, 0)
    end
end
local v_u_220 = false
function GiftPrompt(p_u_221, p222, p_u_223, p_u_224)
    if not v_u_220 then
        v_u_220 = true
        v_u_19.GiftPrompt.Commands.Title.TextLabel.Text = p222
        v_u_19.GiftPrompt.Visible = true
        local v_u_225 = {}
        local v_u_226 = Instance.new("BindableEvent")
        local function v230(p_u_227)
            local v228 = v_u_19.GiftPrompt.Commands.PlayerList["Z:Player"]:Clone()
            v228.Name = p_u_227.Name
            v228.Visible = true
            v228.Username.Text = p_u_227.Name
            v228.Parent = v_u_19.GiftPrompt.Commands.PlayerList
            local v229 = v_u_225
            table.insert(v229, v228)
            if p_u_227 ~= v_u_2 then
                v228.Buy.Text = "GIFT"
                v228.Buy.BackgroundColor3 = Color3.new(0.133333, 0.72549, 1)
            end
            v228.Buy.Activated:connect(function()
                if p_u_221 == "GamePurchase" then
                    v_u_17:FireServer(p_u_221, p_u_223, p_u_227)
                else
                    v_u_17:FireServer(p_u_221, p_u_223, p_u_224, p_u_227)
                end
                v_u_226:Fire()
            end)
        end
        local v231 = v_u_225
        for _, v232 in pairs(game.Players:GetPlayers()) do
            v230(v232)
        end
        local v233 = v_u_19.GiftPrompt.Close.Activated:connect(function()
            v_u_226:Fire()
        end)
        v_u_226.Event:wait()
        v_u_226:Destroy()
        v233:Disconnect()
        for v234 = #v231, 1, -1 do
            v231[v234]:Destroy()
            table.remove(v231, v234)
        end
        v_u_225 = nil
        v_u_19.GiftPrompt.Visible = false
        v_u_220 = false
    end
end
v_u_19.EditFrame.Limit.TextLabel.MouseButton1Click:connect(function()
    if v_u_171 == false then
        v_u_171 = true
        v_u_17:FireServer("GamePurchase", "HouseLimit")
        wait(0.2)
        v_u_171 = false
    end
end)
v_u_19.EditFrame.Clear.TextButton.MouseButton1Click:connect(function()
    if v_u_171 == false then
        v_u_171 = true
        v_u_17:FireServer("PlaceHouseItem", nil, nil, true)
        wait(0.1)
        v_u_171 = false
    end
end)
v_u_19.EditFrame.Place.TextButton.MouseButton1Click:connect(function()
    v_u_193()
end)
v_u_19.EditFrame.Delete.TextButton.MouseButton1Click:connect(function()
    if v_u_174 then
        v_u_17:FireServer("DeleteHouseItem", v_u_170[1], v_u_174)
        unselectHouseItem()
    end
end)
v_u_19.EditFrame.Rotate.TextButton.MouseButton1Click:connect(function()
    if v_u_171 == false then
        v_u_171 = true
        v_u_172 = (v_u_172 + 90) % 360
        wait(0.1)
        v_u_171 = false
    end
end)
v_u_19.EditFrame.Configure.TextButton.MouseButton1Click:connect(function()
    if v_u_170 then
        v_u_195()
    end
end)
v_u_19.EditFrame.Configure.TextButton.MouseEnter:connect(function()
    v_u_173 = true
end)
v_u_19.EditFrame.Configure.TextButton.MouseLeave:connect(function()
    v_u_173 = false
end)
local v_u_235 = {
    "19003948",
    "19003957",
    "19003971",
    "19003978",
    "19003982",
    "19003990",
    "19003998"
}
local v_u_236 = { "19323823", "19323854" }
local v_u_237 = v_u_5.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.ClientAnimations.Bicycling)
local v_u_238 = v_u_5.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.ClientAnimations.CartRide)
local v_u_239, v_u_240, v_u_241, v_u_242
if v_u_3.IsMobile() then
    v_u_239 = v_u_172
    v_u_240 = v_u_169
    v_u_241 = v_u_171
    v_u_242 = v_u_170
    for _, v243 in pairs(workspace.Ignored.HouseItemSale:GetChildren()) do
        if v243:IsA("Model") and v243:FindFirstChild("BillboardGui") == nil then
            local v244 = Instance.new("BillboardGui")
            v244.MaxDistance = 25
            v244.Name = "BillboardGui"
            v244.AlwaysOnTop = true
            v244.Size = UDim2.new(3, 0, 3, 0)
            local v245 = Instance.new("TextLabel")
            v245.BackgroundTransparency = 1
            v245.TextScaled = true
            v245.Size = UDim2.new(1, 0, 1, 0)
            v245.Text = "$" .. v_u_3.AddComma(v243.Price.Value)
            v245.Font = Enum.Font.GothamBold
            v245.TextStrokeColor3 = Color3.new(0, 0, 0)
            v245.TextStrokeTransparency = 0
            v245.TextColor3 = BrickColor.Green().Color
            v245.Parent = v244
            v244.Parent = v243
        end
    end
else
    v_u_239 = v_u_172
    v_u_240 = v_u_169
    v_u_241 = v_u_171
    v_u_242 = v_u_170
end
local v_u_246 = {}
local v_u_247 = require(game.ReplicatedStorage:WaitForChild("Firework"))
v_u_17:FireServer("IS_MOBILE", v_u_3.IsMobile())
local function v_u_250(p248)
    local v249
    if p248 == 1 then
        v249 = _G.BattleRoyaleTeam1
    else
        v249 = _G.BattleRoyaleTeam2
    end
    v_u_19.BattleRoyaleAlives.VictoryRoyale.Image = v249
    v_u_19.BattleRoyaleAlives.VictoryRoyale.Size = UDim2.new(0, 0, 0, 0)
    v_u_19.BattleRoyaleAlives.VictoryRoyale.Visible = true
    game:GetService("TweenService"):Create(v_u_19.BattleRoyaleAlives.VictoryRoyale, TweenInfo.new(0.75, Enum.EasingStyle.Bounce, Enum.EasingDirection.In, 0, false, 0), {
        ["Size"] = UDim2.new(0, 200, 0, 200)
    }):Play()
    v_u_19.BattleRoyaleAlives.VictoryRoyale.VictoryMusic:Play()
    delay(15, function()
        game:GetService("TweenService"):Create(v_u_19.BattleRoyaleAlives.VictoryRoyale, TweenInfo.new(5), {
            ["ImageTransparency"] = 1
        }):Play()
        game:GetService("TweenService"):Create(v_u_19.BattleRoyaleAlives.VictoryRoyale.Trophy, TweenInfo.new(5), {
            ["ImageTransparency"] = 1
        }):Play()
    end)
end
if _G.updateFerrisWheel == nil then
    _G.updateFerrisWheel = false
    _G.updateBullAnimation = false
end
pcall(function()
    print("ImmerseAds Disabled")
end)
function _G.Notification(p_u_251, p_u_252)
    task.spawn(function()
        local v253 = Instance.new("TextLabel")
        v253.Size = UDim2.new(1, 0, 1, 0)
        v253.BackgroundColor3 = Color3.new(0.192157, 0.192157, 0.192157)
        v253.BackgroundTransparency = 0
        v253.Text = p_u_251
        if p_u_252 then
            v253.TextColor3 = Color3.new(0.827451, 0, 0)
        else
            v253.TextColor3 = Color3.new(0.956863, 0.956863, 0.956863)
        end
        v253.TextStrokeTransparency = 0
        v253.TextStrokeColor3 = Color3.new(0.184314, 0.184314, 0.184314)
        v253.TextSize = 30
        v253.ZIndex = 10
        v253.Font = Enum.Font.Oswald
        v253.Parent = v_u_19.Notified
        wait(2.5)
        game:GetService("TweenService"):Create(v253, TweenInfo.new(7, Enum.EasingStyle.Linear), {
            ["TextTransparency"] = 1,
            ["TextStrokeTransparency"] = 1
        }):Play()
        wait(7)
        v253:Destroy()
    end)
end
local v_u_254 = {}
local function v_u_261(p255, p256)
    if p256 == 0 then
        return p255.Keypoints[1].Value
    end
    if p256 == 1 then
        return p255.Keypoints[#p255.Keypoints].Value
    end
    for v257 = 1, #p255.Keypoints - 1 do
        local v258 = p255.Keypoints[v257]
        local v259 = p255.Keypoints[v257 + 1]
        if v258.Time <= p256 and p256 < v259.Time then
            local v260 = (p256 - v258.Time) / (v259.Time - v258.Time)
            return Color3.new((v259.Value.R - v258.Value.R) * v260 + v258.Value.R, (v259.Value.G - v258.Value.G) * v260 + v258.Value.G, (v259.Value.B - v258.Value.B) * v260 + v258.Value.B)
        end
    end
end
local v_u_262 = {}
local v_u_263 = {}
local v_u_264 = {}
local function v_u_270(p265, p266)
    local v267 = p266 and Color3.new(0, 1, 0) or Color3.new(0.839216, 0.180392, 0.180392)
    local v268 = p266 and UDim2.new(0.5, 0, 0, 0) or UDim2.new(0, 0, 0, 0)
    v_u_10:Create(p265, TweenInfo.new(0.5), {
        ["BackgroundColor3"] = v267
    }):Play()
    if p265:FindFirstChild("UIStroke") then
        local v269 = p266 and Color3.new(0, 1, 0.0313725) or Color3.new(1, 0, 0.0156863)
        v_u_10:Create(p265.UIStroke, TweenInfo.new(0.5), {
            ["Color"] = v269
        }):Play()
    end
    v_u_10:Create(p265, TweenInfo.new(0.5), {
        ["Position"] = v268
    }):Play()
end
function v_u_263.FOV(p271)
    if p271 and tonumber(p271) then
        local v272 = tonumber(p271)
        local v273 = math.clamp(v272, 70, 120)
        v_u_6.FieldOfView = v273
        _G.CameraFOV = v273
    end
end
local v_u_274 = false
function v_u_263.LowGFX(p_u_275)
    if not v_u_274 then
        v_u_274 = true
        _G.Reduce_Lag = p_u_275
        local v276 = 0
        local v277 = _G.Reduce_LagParts or {}
        local v278 = _G.SnowBlock
        if _G.Snowing and v278 then
            v278.Parent = workspace.Ignored
        end
        for _, v_u_279 in pairs(v277) do
            spawn(function()
                if p_u_275 then
                    if v_u_279[1].Material ~= Enum.Material.Snow then
                        v_u_279[1].Material = Enum.Material.SmoothPlastic
                        return
                    end
                else
                    v_u_279[1].Material = v_u_279[2]
                end
            end)
            v276 = v276 + 1
            if v276 % 500 == 0 then
                task.wait()
            end
        end
        v_u_270(v_u_19.Crew.Settings.Frame.InnerFrame.List.LowGFX.SwitchFrame.Switch, p_u_275)
        task.wait(0.2)
        v_u_274 = false
    end
end
local v_u_280 = false
local v_u_281 = false
function v_u_263.BoomboxMuted(p282)
    if not v_u_281 then
        v_u_281 = true
        v_u_280 = p282
        if v_u_280 then
            for _, v_u_283 in pairs(workspace.Players:GetChildren()) do
                pcall(function()
                    if v_u_283.LowerTorso:FindFirstChild("BOOMBOXSOUND") and v_u_283 ~= v_u_5 then
                        v_u_283.LowerTorso.BOOMBOXSOUND.Volume = 0
                        v_u_264[v_u_283.LowerTorso.BOOMBOXSOUND] = true
                    end
                end)
            end
            if workspace.Ignored:FindFirstChild("WinterMAP") and workspace.Ignored.WinterMAP:FindFirstChild("Sleigh") then
                workspace.Ignored.WinterMAP.Sleigh.MeshPart["Jingle Bells"].Volume = 0
            end
        else
            for v284, _ in pairs(v_u_264) do
                if v284:IsA("Sound") then
                    v284.Volume = 0.5
                end
            end
        end
        v_u_270(v_u_19.Crew.Settings.Frame.InnerFrame.List.BoomBox.SwitchFrame.Switch, v_u_280)
        task.wait()
        v_u_281 = false
    end
end
function setSetting(p285, p286, p287)
    if p286 ~= nil then
        if v_u_263[p285] then
            v_u_263[p285](p286)
            if not p287 then
                v_u_17:FireServer("UpdateSingleSetting", p285, p286)
                return
            end
        end
    end
end
local v288 = script.Parent
local v_u_289 = v288:WaitForChild("Click")
local v_u_290 = v288:WaitForChild("Hover")
local v_u_291 = v_u_280
local v292 = { "MobileLayout" }
local function v301(p293, p294, p295)
    local v296 = UDim2.new(p293.X.Scale * p295, p293.X.Offset * p295, p293.Y.Scale * p295, p293.Y.Offset * p295)
    local v297 = (v296.X.Scale - p293.X.Scale) / 2
    local v298 = (v296.X.Offset - p293.X.Offset) / 2
    local v299 = (v296.Y.Scale - p293.Y.Scale) / 2
    local v300 = (v296.Y.Offset - p293.Y.Offset) / 2
    return v296, UDim2.new(p294.X.Scale - v297, p294.X.Offset - v298, p294.Y.Scale - v299, p294.Y.Offset - v300)
end
for _, v305 in ipairs(v288:GetDescendants()) do
    if v305:IsA("TextButton") or (v305:IsA("ImageButton") or v305:IsA("Button")) then
        local v_u_303 = v305
        while true do
            local v304
            if not v305 then
                v304 = false
                break
            end
            if table.find(v292, v305.Name) then
                v304 = true
                break
            end
            local v305 = v305.Parent
        end
        if not v304 then
            local v_u_306 = v_u_303.Size
            local v_u_307 = v_u_303.Position
            local v_u_308
            if v_u_303:IsA("ImageButton") then
                v_u_308 = v_u_303.ImageColor3 or nil
            else
                v_u_308 = nil
            end
            local v_u_309, v_u_310 = v301(v_u_306, v_u_307, 1.05)
            local v_u_311, v_u_312 = v301(v_u_306, v_u_307, 1.1)
            local v_u_313 = false
            local function v326()
                if not v_u_313 then
                    v_u_313 = true
                    if v_u_289 and v_u_289:IsA("Sound") then
                        v_u_289:Play()
                    end
                    local v314 = {
                        ["Size"] = v_u_311,
                        ["Position"] = v_u_312
                    }
                    local v315 = v_u_10:Create(v_u_303, TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v314)
                    v315:Play()
                    v315.Completed:Connect(function()
                        local v316 = v_u_303
                        local v317 = {
                            ["Size"] = v_u_309,
                            ["Position"] = v_u_310
                        }
                        local v318 = Enum.EasingStyle.Quad
                        local v319 = Enum.EasingDirection.In
                        local v320 = v_u_10:Create(v316, TweenInfo.new(0.05, v318 or Enum.EasingStyle.Quad, v319 or Enum.EasingDirection.Out), v317)
                        v320:Play()
                        v320.Completed:Connect(function()
                            local v321 = v_u_303
                            local v322 = {
                                ["Size"] = v_u_306,
                                ["Position"] = v_u_307
                            }
                            local v323 = Enum.EasingStyle.Quad
                            local v324 = Enum.EasingDirection.In
                            local v325 = v_u_10:Create(v321, TweenInfo.new(0.05, v323 or Enum.EasingStyle.Quad, v324 or Enum.EasingDirection.Out), v322)
                            v325:Play()
                            v325.Completed:Connect(function()
                                v_u_313 = false
                            end)
                        end)
                    end)
                end
            end
            v_u_303.MouseEnter:Connect(function()
                v_u_290:Play()
                local v327 = {
                    ["Size"] = v_u_309,
                    ["Position"] = v_u_310
                }
                v_u_10:Create(v_u_303, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v327):Play()
                if v_u_303:IsA("ImageButton") then
                    local v328 = v_u_303
                    local v329 = {
                        ["ImageColor3"] = Color3.fromRGB(166, 166, 166)
                    }
                    v_u_10:Create(v328, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v329):Play()
                end
            end)
            v_u_303.MouseLeave:Connect(function()
                local v330 = {
                    ["Size"] = v_u_306,
                    ["Position"] = v_u_307
                }
                v_u_10:Create(v_u_303, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v330):Play()
                if v_u_303:IsA("ImageButton") and v_u_308 then
                    local v331 = {
                        ["ImageColor3"] = v_u_308
                    }
                    v_u_10:Create(v_u_303, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v331):Play()
                end
            end)
            v_u_303.Activated:Connect(v326)
        end
    end
end
workspace:WaitForChild("Ignored"):WaitForChild("Siren"):WaitForChild("Radius").ChildAdded:Connect(function(p332)
    if workspace:GetAttribute("SERVER_AIM") then
        if p332.Name == "GunBeam" then
            local v333 = p332:GetAttribute("Time")
            local v334 = p332:GetAttribute("CF")
            local v335 = p332:GetAttribute("Norm")
            local v336 = p332:GetAttribute("Hit")
            local v337 = p332:GetAttribute("Pos")
            if p332 then
                if p332:GetAttribute("SpecialEffects") then
                    for _, v338 in pairs(p332:GetDescendants()) do
                        if v338:IsA("Trail") and v338:GetAttribute("ColorRandom") then
                            local v339 = v338:GetAttribute("ColorRandom")
                            v338.Color = ColorSequence.new(v_u_261(v339, math.random()))
                        end
                    end
                end
                local v340 = game:GetService("TweenService"):Create(p332, TweenInfo.new(0.05, Enum.EasingStyle.Linear), {
                    ["CFrame"] = p332.CFrame * CFrame.new(0, 0, -0.1)
                })
                v340:Play()
                task.wait(0.05)
                if v340.PlaybackState ~= Enum.PlaybackState.Completed then
                    v340:Pause()
                end
                local v341 = nil
                if _G.Reduce_Lag and not p332:GetAttribute("NoSlow") or p332:GetAttribute("LOWGFX") then
                    p332.CFrame = v334
                else
                    v341 = game:GetService("TweenService"):Create(p332, TweenInfo.new(v333, Enum.EasingStyle.Linear), {
                        ["CFrame"] = v334
                    })
                    v341:Play()
                    task.wait(v333)
                end
                if p332:FindFirstChild("Impact") and (v336 and v335) then
                    if v341 and v341.PlaybackState ~= Enum.PlaybackState.Completed then
                        task.wait(0.05)
                    end
                    if not p332:FindFirstChild("NoNormal") then
                        p332.CFrame = CFrame.new(v337, v337 - v335)
                    end
                    for _, v342 in pairs(p332.Impact:GetChildren()) do
                        if v342:IsA("ParticleEmitter") then
                            v342:Emit(v342:GetAttribute("EmitCount") or 1)
                        end
                    end
                else
                    for _, v343 in pairs(p332:GetChildren()) do
                        if v343:IsA("BasePart") then
                            v343.Transparency = 1
                        end
                    end
                end
                if p332 then
                    for _, v344 in pairs(p332:GetDescendants()) do
                        if v344:IsA("ParticleEmitter") then
                            v344.Enabled = false
                        end
                    end
                end
            end
        end
    end
end)
local function v_u_348(p345)
    local v346 = tostring(p345)
    for v347 = #v346 - 3, 1, -3 do
        v346 = v346:sub(1, v347) .. "," .. v346:sub(v347 + 1)
    end
    return v346
end
local v_u_349 = {}
v_u_17.OnClientEvent:connect(function(p350, ...)
    if p350 == "ShotFrom" then
        local v351 = game.ReplicatedStorage.DMGIndicator:Clone()
        v351.Parent = v_u_19.DamageIndicator
        v351.Visible = true
        local v352 = ...
        for v353 = 0, 1, 0.01 do
            v_u_8.Heartbeat:wait()
            local v354 = v_u_5.LowerTorso.Position
            local v355 = (v352 - v354).unit
            local v356 = CFrame.new(v354):toObjectSpace(v_u_6.CFrame).p.unit
            local v357 = v356.x
            local v358 = v356.z
            local v359 = math.atan2(v357, v358)
            local v360 = math.deg(v359)
            local v361 = v355.x
            local v362 = -v355.z
            local v363 = math.atan2(v361, v362)
            v351.Rotation = math.deg(v363) + v360
            v351.ImageTransparency = v353
        end
        v351:Destroy()
        return
    end
    if p350 == "RenderPacket" then
        v_u_4.RecievePacket(...)
        return
    end
    if p350 == "OpenedAllPacket" then
        v_u_4.RecieveOpenPacket(...)
        return
    end
    if p350 == "HideMinigames" then
        v_u_19.VIPCMDS.Commands.PlayerList["T-MiniGame"].Visible = false
        return
    end
    if p350 == "ShowMiniGames" then
        v_u_19.VIPCMDS.Commands.PlayerList["T-MiniGame"].Visible = true
        return
    end
    if p350 == "UpdateDayTime" then
        _G.UpdateDay()
        return
    end
    if p350 == "TradeChat" then
        if _G.AddTradeChat then
            _G.AddTradeChat(...)
            return
        end
    elseif p350 == "TradeAdd" then
        if _G.AddSkinToTradingView then
            _G.AddSkinToTradingView(...)
            return
        end
    elseif p350 == "TradingRequest" then
        local v364 = ...
        if v_u_254[v364.Name] == nil then
            v_u_254[v364.Name] = true
            _G.Notification("@" .. v364.Name .. " sent a trading request!")
        end
        if _G.AddTradingRequest then
            _G.AddTradingRequest(v364)
            return
        end
    elseif p350 == "AcceptTrade" then
        local v365 = ...
        if _G.LoadTradingInventory then
            _G.LoadTradingInventory(v365)
            return
        end
    elseif p350 == "ClearTrades" then
        if _G.ClearTrades then
            _G.ClearTrades(...)
            return
        end
    elseif p350 == "ReadyTrade" then
        local v366, v367 = ...
        if _G.ReadyTrade then
            _G.ReadyTrade(v366, v367)
            return
        end
    elseif p350 == "Tweening" then
        if _G.Reduce_Lag then
            return
        end
        local v_u_368, v369, v370, v371 = ...
        local v372 = TweenInfo.new(unpack(v369))
        local v_u_373 = game:GetService("TweenService"):Create(v_u_368, v372, v370)
        v_u_373:Play()
        if v371 then
            local v_u_374 = nil
            v_u_374 = workspace.DescendantRemoving:Connect(function(p375)
                if p375 == v_u_368 or not v_u_368:IsDescendantOf(workspace) then
                    v_u_374:Disconnect()
                    v_u_373:Cancel()
                end
            end)
            return
        end
    elseif p350 == "ColorfulChanges" then
        local v376 = _G.Reduce_Lag and 1 or 0.2
        local v377 = tick()
        local v378 = tostring(v377)
        local v379 = ...
        while v379:IsDescendantOf(workspace) and (v379.Parent and v379) do
            if v379:IsA("Texture") then
                v379.Color3 = Color3.fromHSV(v378 % 1, 1, 1)
            end
            if v379:IsA("ParticleEmitter") then
                v379.Color = ColorSequence.new(Color3.fromHSV(v378 % 1, 1, 1), Color3.fromHSV(v378 % 1, 1, 1), Color3.fromHSV(v378 % 1, 1, 1))
            end
            if v379:IsA("SurfaceAppearance") then
                v379.Color = Color3.fromHSV(v378 % 1, 1, 1)
            end
            if v379:IsA("PointLight") then
                v379.Color = Color3.fromHSV(v378 % 1, 1, 1)
            end
            if v379:IsA("Trail") then
                v379.Color = ColorSequence.new(Color3.fromHSV(v378 % 1, 1, 1), Color3.fromHSV(v378 % 1, 1, 1), Color3.fromHSV(v378 % 1, 1, 1))
            end
            v378 = v378 + task.wait(v376) * 0.3
        end
    else
        if p350 == "BulletTrail" then
            return
        end
        if p350 == "basketballPROMPT" then
            local v380, v381 = ...
            if v381 then
                if v380 then
                    v381.Enabled = false
                else
                    v381.Enabled = true
                end
            end
        else
            if p350 == "ImmerseAd" then
                if ... then
                    task.wait(5)
                    if not (v_u_14["K.O"].Value or v_u_5:FindFirstChild("GRABBING_CONSTRAINT")) then
                        workspace["Main Portal Template "].BasePortal.Door.CanTouch = true
                    end
                else
                    workspace["Main Portal Template "].BasePortal.Door.CanTouch = false
                    return
                end
            end
            if p350 == "FerrisWheelUPDATE" then
                local v_u_382, v_u_383, v_u_384 = ...
                task.spawn(function()
                    if _G.updateFerrisWheel == false then
                        _G.updateFerrisWheel = true
                        local v385 = v_u_382:WaitForChild("Wheel")
                        local v386 = v385:WaitForChild("Center")
                        for _, v387 in pairs(v385:GetDescendants()) do
                            if v387:IsA("BasePart") and v387 ~= v386 then
                                v387.Anchored = false
                            end
                        end
                        local v388 = {}
                        for _, v389 in pairs(v385:GetDescendants()) do
                            if v389:IsA("RopeConstraint") then
                                local v390 = { v389.Attachment0, v389.Attachment1 }
                                table.insert(v388, v390)
                            end
                        end
                        _G.updateFerrisWheel = v388
                    else
                        while _G.updateFerrisWheel == true do
                            task.wait()
                        end
                    end
                    v_u_382.Wheel.Center.CFrame = v_u_383 * CFrame.Angles(-1.5707963267948966, 0, 0)
                    local v391 = {
                        ["CFrame"] = v_u_383
                    }
                    game:GetService("TweenService"):Create(v_u_382.Wheel.Center, TweenInfo.new(v_u_384, Enum.EasingStyle.Linear), v391):Play()
                    local v396 = v_u_382.Wheel.Center:GetPropertyChangedSignal("CFrame"):connect(function()
                        for _, v392 in pairs(_G.updateFerrisWheel) do
                            local v393 = v392[2].Parent.Parent.Parent
                            local _ = v392[1].WorldPosition
                            local v394 = v392[1].Parent.CFrame * CFrame.new(v392[1].Position)
                            local v395 = v392[1].Parent.CFrame * CFrame.new(v392[1].Position) - Vector3.new(0, 1, 0)
                            v393:SetPrimaryPartCFrame(CFrame.new(v394.p, v395.p) * CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0))
                        end
                    end)
                    task.wait(v_u_384)
                    v396:Disconnect()
                end)
                return
            end
            if p350 == "UpdateRoleplay" then
                if game.Players:GetAttribute("Roleplay") == true then
                    v_u_19.VIPCMDS.Commands.PlayerList.Roleplay.SwitchFrame.Switch.BackgroundColor3 = Color3.new(0, 1, 0)
                    v_u_19.VIPCMDS.Commands.PlayerList.Roleplay.SwitchFrame.Switch.Position = UDim2.new(0.5, 0, 0, 0)
                else
                    v_u_19.VIPCMDS.Commands.PlayerList.Roleplay.SwitchFrame.Switch.BackgroundColor3 = Color3.new(0.839216, 0.180392, 0.180392)
                    v_u_19.VIPCMDS.Commands.PlayerList.Roleplay.SwitchFrame.Switch.Position = UDim2.new(0, 0, 0, 0)
                end
            end
            if p350 == "UpdateMacroEnable" then
                if v_u_3.isMacroAllowed() == true then
                    v_u_19.VIPCMDS.Commands.PlayerList.MacroEnable.SwitchFrame.Switch.BackgroundColor3 = Color3.new(0, 1, 0)
                    v_u_19.VIPCMDS.Commands.PlayerList.MacroEnable.SwitchFrame.Switch.Position = UDim2.new(0.5, 0, 0, 0)
                else
                    v_u_19.VIPCMDS.Commands.PlayerList.MacroEnable.SwitchFrame.Switch.BackgroundColor3 = Color3.new(0.839216, 0.180392, 0.180392)
                    v_u_19.VIPCMDS.Commands.PlayerList.MacroEnable.SwitchFrame.Switch.Position = UDim2.new(0, 0, 0, 0)
                end
            end
            if p350 == "LoadPlayerSettings" then
                v_u_262 = ...
                for v397, v398 in v_u_262 do
                    setSetting(v397, v398, true)
                end
                return
            end
            if p350 == "UpdatePlayerSettingsData" then
                v_u_262 = ...
                return
            end
            if p350 == "CrateOpening" then
                repeat
                    task.wait()
                until CrateOpen and UpdateSkinUnlock
                CrateOpen(...)
                UpdateSkinUnlock()
                return
            end
            if p350 == "UpdateEquip" then
                UpdateSkinUnlock()
                return
            end
            if p350 == "ClientBullet" then
                local v399, v400, v401, v402, v403, v404 = ...
                v_u_28.shoot({
                    ["Shooter"] = v399,
                    ["AimPosition"] = v402,
                    ["Hit"] = v403,
                    ["Normal"] = v404,
                    ["Handle"] = v400,
                    ["ForcedOrigin"] = v401
                })
                return
            end
            if p350 == "ShootingRecoil" then
                local v405 = math.random() > 0.5 and 0.008726646259971648 or -0.008726646259971648
                v_u_6.CFrame = v_u_6.CFrame * CFrame.Angles(0.004363323129985824, v405 * 0.5, 0)
                return
            end
            if p350 == "SpinDailyWheel" then
                local v_u_406, v_u_407 = ...
                if v_u_406 then
                    local v_u_408
                    if v_u_406.Parent and v_u_406.Parent:FindFirstChild("Base") then
                        v_u_406.Parent.Base.ProximityPrompt.Enabled = false
                        task.delay(20, function()
                            v_u_406.Parent.Base.ProximityPrompt.Enabled = true
                        end)
                        v_u_408 = v_u_406.Parent.Base
                    else
                        v_u_408 = nil
                    end
                    local v_u_409 = 0
                    local v_u_410 = 1800
                    local v_u_411 = nil
                    local v_u_412 = false
                    local v_u_413 = nil
                    local v_u_414 = v_u_406:GetAttribute("DefaultCFrame")
                    local v_u_415 = 0
                    local v_u_416 = 0
                    v_u_413 = v_u_22.RenderStepped:Connect(function(p417)
                        if v_u_410 > 360 then
                            local v418 = v_u_410 - 240 * p417
                            v_u_410 = math.max(360, v418)
                        end
                        v_u_409 = v_u_409 + v_u_410 * p417
                        v_u_409 = v_u_409 % 360
                        local v419 = v_u_409
                        v_u_406:PivotTo(v_u_414 * CFrame.Angles(0, 0, (math.rad(v419))))
                        if tick() - v_u_415 > 35 / v_u_410 and v_u_408 then
                            v_u_415 = tick()
                            v_u_13.SoundPlay(v_u_408, true)
                        end
                        if v_u_412 and tick() - v_u_416 >= 0.1 then
                            v_u_416 = tick()
                            v_u_410 = v_u_410 * 0.925
                            if v_u_410 <= 20 then
                                v_u_410 = 20
                            end
                        end
                        if v_u_411 then
                            local v420 = v_u_409 - v_u_411
                            local v421 = math.abs(v420)
                            local v422 = 360 - v421
                            local v423 = math.min(v421, v422)
                            if v_u_410 <= 360 and v423 <= 10 then
                                if v_u_409 < v_u_411 and not v_u_412 then
                                    local v424 = v_u_410 * 0.85
                                    v_u_410 = math.max(3.6, v424)
                                end
                                if v423 < 10 then
                                    if v_u_412 and tick() - v_u_412 >= 0.5 then
                                        v_u_410 = 0
                                        v_u_413:Disconnect()
                                        print("Landed on reward:", v_u_407)
                                    else
                                        v_u_412 = tick()
                                    end
                                end
                            end
                        end
                    end)
                    task.delay(0.1, function()
                        v_u_411 = (v_u_407 - 1) * 30
                        print("Target angle:", v_u_411)
                    end)
                end
            end
            if p350 == "SetArcadeMinigameScore" then
                local v425, v426 = ...
                if v425 then
                    v425.Text = string.format("%03d", v426)
                end
            end
            if p350 == "AnimateArcadeMinigameScore" then
                local v_u_427, v428 = ...
                if v_u_427 then
                    local v_u_429 = Instance.new("IntValue")
                    local v_u_430 = v_u_429.Changed:Connect(function()
                        v_u_427.Text = string.format("%03d", v_u_429.Value)
                    end)
                    game:GetService("TweenService"):Create(v_u_429, TweenInfo.new(2.4), {
                        ["Value"] = math.round(v428)
                    }):Play()
                    task.delay(2.4, function()
                        v_u_430:Disconnect()
                        v_u_430 = nil
                        v_u_429:Destroy()
                        v_u_429 = nil
                    end)
                end
            end
            if p350 == "TweenMinigameObject" then
                local v431, v432, v433 = ...
                game:GetService("TweenService"):Create(v431, TweenInfo.new(table.unpack(v432)), v433):Play()
                return
            end
            if p350 == "BountyPostersCooldown" then
                local v_u_434 = ...
                for _, v_u_435 in workspace.MAP.BountyPosters:GetChildren() do
                    if v_u_435:FindFirstChild("Info") and v_u_435.Info:FindFirstChild("BillboardGui") then
                        task.spawn(function()
                            for v436 = v_u_434, 0, -1 do
                                local v437 = v_u_435.Info.BillboardGui.Timer
                                local v438 = v436 / 60
                                local v439 = math.floor(v438)
                                local v440 = v436 % 60
                                v437.Text = string.format("%02d:%02d", v439, v440)
                                task.wait(1)
                            end
                            v_u_435.Info.BillboardGui.Timer.Text = ""
                        end)
                    end
                end
                return
            end
            if p350 == "StartBallUpCounter" then
                local v_u_441, v_u_442 = ...
                if v_u_441 then
                    local v_u_443 = tick()
                    local v_u_444 = v_u_442
                    local v_u_445 = nil
                    v_u_445 = game:GetService("RunService").Heartbeat:Connect(function(_)
                        v_u_442 = v_u_444 - (tick() - v_u_443)
                        if v_u_442 > 0 then
                            local v446 = v_u_442 / 60
                            local v447 = math.floor(v446)
                            local v448 = v_u_442 % 60
                            local v449 = math.floor(v448)
                            v_u_441.Text = string.format("(%02d:%02d)", v447, v449)
                            if v_u_442 <= 10 then
                                v_u_441.TextColor3 = Color3.new(1, 0, 0)
                            else
                                v_u_441.TextColor3 = Color3.new(1, 1, 1)
                            end
                        else
                            v_u_441.Text = ""
                            v_u_445:Disconnect()
                            v_u_445 = nil
                            return
                        end
                    end)
                    v_u_349[v_u_441] = v_u_445
                end
            end
            if p350 == "ResetBallUpCounter" then
                local v450 = ...
                if v450 then
                    v450.Text = ""
                    v_u_349[v450]:Disconnect()
                    v_u_349[v450] = nil
                end
            end
            if p350 == "PlaySetBountySound" then
                for _, v451 in workspace.MAP.BountyPosters:GetChildren() do
                    if v451:FindFirstChild("Info") and v451.Info:FindFirstChild("Sound") then
                        v451.Info.Sound:Play()
                    end
                end
                return
            end
            if p350 == "HighBounty" then
                local v_u_452, v453 = ...
                if v_u_452 and (v453 and v453 >= 1000000) then
                    local v_u_454 = game.Players.LocalPlayer.PlayerGui.Bounty.NewBounty
                    v_u_454.Amount.Text = ("$%*"):format((v_u_348(v453)))
                    v_u_454.PlayerName.Text = ("@%*"):format(v_u_452.Name)
                    v_u_454.PlayerDisplay.Text = ("%*"):format(v_u_452.DisplayName)
                    local _, v455 = pcall(function()
                        return game.Players:GetUserThumbnailAsync(v_u_452.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
                    end)
                    v_u_454.PlayerAvatar.Image = v455 or ""
                    v_u_454.Position = UDim2.fromScale(0.5, -1)
                    game:GetService("TweenService"):Create(v_u_454, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {
                        ["Position"] = UDim2.fromScale(0.5, 0.13)
                    }):Play()
                    task.delay(3, function()
                        game:GetService("TweenService"):Create(v_u_454, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
                            ["Position"] = UDim2.fromScale(0.5, -1)
                        }):Play()
                    end)
                end
            end
            if p350 == "StartDonationFirework" then
                local v456, v_u_457, v_u_458 = ...
                if v456 then
                    local v_u_459 = game.ReplicatedStorage.DonationFirework:Clone()
                    v_u_459.Parent = workspace.Ignored
                    v_u_459.Position = v456
                    game:GetService("TweenService"):Create(v_u_459, TweenInfo.new(2.1, Enum.EasingStyle.Cubic), {
                        ["Position"] = v456 + Vector3.new(0, 15, 0)
                    }):Play()
                    task.delay(1.25, function()
                        for _, v460 in v_u_459:GetDescendants() do
                            if v460:IsA("ParticleEmitter") or v460:IsA("Beam") then
                                v460.Enabled = false
                            end
                        end
                        v_u_459:WaitForChild("Dono"):Play()
                        task.spawn(function()
                            for _, v461 in v_u_459.Emit:GetChildren() do
                                v461.Enabled = true
                                v_u_459:WaitForChild("Firework"):Play()
                            end
                            wait(5)
                            for _, v462 in v_u_459.Emit:GetChildren() do
                                v462.Enabled = false
                            end
                        end)
                        v_u_459.BillboardGui.Frame.Template.Text = string.format("%s donated <font color=\"rgb(0,255,0)\">%d R$</font>!", v_u_457, v_u_458)
                        local v463 = v_u_459.BillboardGui.Frame.Position
                        game:GetService("TweenService"):Create(v_u_459.BillboardGui.Frame, TweenInfo.new(1, Enum.EasingStyle.Quad), {
                            ["Position"] = v463 + UDim2.fromScale(0, -0.5)
                        }):Play()
                        task.wait(20)
                        v_u_459:Destroy()
                        v_u_459 = nil
                    end)
                end
            end
            if p350 == "SetBallUpBallVelocity" then
                local v464, v465, v466, v467, _ = ...
                local v468 = game.Players.LocalPlayer
                local v469
                if v468.Character.HumanoidRootPart.CFrame.upVector:Dot(v465) > 0.2 then
                    local v470 = v464.Position
                    local v471 = v470 + v465 * 46 * v466 + v468.Character.Humanoid.MoveDirection * 5 - v470
                    local v472 = -workspace.Gravity
                    v464.AssemblyLinearVelocity = (v471 - Vector3.new(0, v472, 0) * 0.8 * 0.8 * 0.5) / 0.8 * v467
                    v469 = true
                else
                    v469 = false
                end
                if not v469 then
                    local v473 = v464.Position
                    local v474 = v473 + v465 * 55 - v473
                    local v475 = -workspace.Gravity
                    v464.AssemblyLinearVelocity = (v474 - Vector3.new(0, v475, 0) * 0.6 * 0.6 * 0.5) / 0.6 * v467
                    return
                end
            elseif p350 == "BullAnimationSteering" then
                local v476, v477, v478 = ...
                local v479 = v_u_19.BullControls
                v479.Visible = true
                if v476 == 1 then
                    v479.Up.ImageColor3 = Color3.new(1, 0, 0)
                    v479.Down.ImageColor3 = Color3.new(0, 0, 0)
                elseif v476 == -1 then
                    v479.Up.ImageColor3 = Color3.new(0, 0, 0)
                    v479.Down.ImageColor3 = Color3.new(1, 0, 0)
                else
                    v479.Up.ImageColor3 = Color3.new(0, 0, 0)
                    v479.Down.ImageColor3 = Color3.new(0, 0, 0)
                end
                if v477 == 1 then
                    v479.Right.ImageColor3 = Color3.new(1, 0, 0)
                    v479.Left.ImageColor3 = Color3.new(0, 0, 0)
                elseif v477 == -1 then
                    v479.Right.ImageColor3 = Color3.new(0, 0, 0)
                    v479.Left.ImageColor3 = Color3.new(1, 0, 0)
                else
                    v479.Right.ImageColor3 = Color3.new(0, 0, 0)
                    v479.Left.ImageColor3 = Color3.new(0, 0, 0)
                end
                if v478.Throttle == 1 then
                    game:GetService("TweenService"):Create(v479.Up, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                        ["Position"] = UDim2.new(0.5, 0, 0, -10)
                    }):Play()
                elseif v478.Throttle == -1 then
                    game:GetService("TweenService"):Create(v479.Down, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                        ["Position"] = UDim2.new(0.5, 0, 1, 10)
                    }):Play()
                else
                    game:GetService("TweenService"):Create(v479.Up, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                        ["Position"] = UDim2.new(0.5, 0, 0, 0)
                    }):Play()
                    game:GetService("TweenService"):Create(v479.Down, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                        ["Position"] = UDim2.new(0.5, 0, 1, 0)
                    }):Play()
                end
                if v478.Steer == 1 then
                    game:GetService("TweenService"):Create(v479.Right, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                        ["Position"] = UDim2.new(1, 10, 0.5, 0)
                    }):Play()
                elseif v478.Steer == -1 then
                    game:GetService("TweenService"):Create(v479.Left, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                        ["Position"] = UDim2.new(0, -10, 0.5, 0)
                    }):Play()
                else
                    game:GetService("TweenService"):Create(v479.Right, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                        ["Position"] = UDim2.new(1, 0, 0.5, 0)
                    }):Play()
                    game:GetService("TweenService"):Create(v479.Left, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                        ["Position"] = UDim2.new(0, 0, 0.5, 0)
                    }):Play()
                end
                if _G.updateBullAnimation == false then
                    _G.updateBullAnimation = true
                    repeat
                        wait(0.1)
                    until game.Players.LocalPlayer.Character.Humanoid.Sit == false
                    _G.updateBullAnimation = false
                    v479.Visible = false
                    return
                end
            else
                if p350 == "GhostVisible" then
                    if _G.Halloween == true then
                        local v480, v481 = ...
                        if v480 ~= v_u_5.Name then
                            local v_u_482 = game.ReplicatedStorage.OctoberS:Clone()
                            v_u_482:SetPrimaryPartCFrame(CFrame.new(v481) * CFrame.Angles(0, math.random() * 3.141592653589793 * 2, 0))
                            local v_u_483 = {}
                            for _, v484 in pairs(v_u_482:GetDescendants()) do
                                if v484:IsA("BasePart") then
                                    local v485 = { v484, v484.Transparency }
                                    table.insert(v_u_483, v485)
                                    v484.Transparency = 1
                                    v484.CanCollide = false
                                    v484.Anchored = true
                                end
                            end
                            local v_u_486 = false
                            local v_u_487 = {
                                "rbxassetid://6552916415",
                                "rbxassetid://3061643137",
                                "rbxassetid://1586343289",
                                "rbxassetid://2094629128"
                            }
                            local v_u_488 = #v_u_487
                            game:GetService("ContentProvider"):PreloadAsync(v_u_487, function()
                                v_u_488 = v_u_488 - 1
                            end)
                            repeat
                                wait()
                            until v_u_488 <= 0
                            v_u_482.Ghost.PrimaryPart.Touched:connect(function(p489)
                                if v_u_486 == false and p489:IsDescendantOf(v_u_5) then
                                    v_u_486 = true
                                    for _, v490 in pairs(v_u_483) do
                                        v490[1].Transparency = v490[2]
                                        if v490[1].Name == "CONE" then
                                            game:GetService("TweenService"):Create(v490[1], TweenInfo.new(15, Enum.EasingStyle.Linear), {
                                                ["Size"] = v490[1].Size * Vector3.new(0, 1, 0),
                                                ["Transparency"] = 1
                                            }):Play()
                                        else
                                            game:GetService("TweenService"):Create(v490[1], TweenInfo.new(10, Enum.EasingStyle.Linear), {
                                                ["CFrame"] = v490[1].CFrame + Vector3.new(0, 50, 0),
                                                ["Transparency"] = 1
                                            }):Play()
                                        end
                                    end
                                    game:GetService("Debris"):AddItem(v_u_482, 20)
                                    game.ReplicatedStorage.OctoberS["INITIALJS" .. math.random(1, 3)]:Play()
                                    local v491 = Instance.new("ImageLabel")
                                    v491.Image = v_u_487[math.random(#v_u_487)]
                                    v491.BackgroundTransparency = 1
                                    v491.Size = UDim2.new(1, 0, 1, 0)
                                    v491.Parent = v_u_19
                                    task.wait(0.5)
                                    game:GetService("TweenService"):Create(v491, TweenInfo.new(1, Enum.EasingStyle.Bounce), {
                                        ["ImageTransparency"] = 1
                                    }):Play()
                                    game:GetService("Debris"):AddItem(v491, 1)
                                    task.wait(0.5)
                                end
                            end)
                            v_u_482.Parent = workspace.Ignored
                            game:GetService("Debris"):AddItem(v_u_482, 120)
                        end
                    else
                        return
                    end
                end
                if p350 == "UPDATEBRWINNER" then
                    v_u_250((...))
                    return
                end
                if p350 == "FLAG_LOCATION" then
                    local v492 = ...
                    if _G.FLAGLOCATION == nil then
                        _G.FLAGLOCATION = {}
                    end
                    if _G.FLAGLOCATION[v492] ~= true then
                        _G.FLAGLOCATION[v492] = true
                        while true do
                            if (v_u_5.HumanoidRootPart.Position - v492.Main.Position).magnitude > 0 then
                                local v493 = game.ReplicatedStorage.DotGui:Clone()
                                v493.Dot.ImageColor3 = v492.Wedge.Color
                                v493.Enabled = true
                                v493.Active = true
                                v493.Parent = v492.Main
                                game:GetService("TweenService"):Create(v493, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                                    ["Size"] = UDim2.new(0, 1, 0, 1)
                                }):Play()
                                game:GetService("Debris"):AddItem(v493, 1)
                            end
                            task.wait(1.5)
                            if v492.Main.Anchored == true then
                                _G.FLAGLOCATION[v492] = false
                                return
                            end
                        end
                    end
                elseif p350 == "UPDATEBRFFA" then
                    local v494 = ...
                    local v495 = tonumber(v494) and v_u_19.BattleRoyaleFFA.Teams:FindFirstChild(v494)
                    if v495 then
                        v_u_246[v494] = v_u_246[v494] or 0
                        v_u_246[v494] = v_u_246[v494] + 1
                        v495.KillText.Text = v_u_246[v494] .. " Kills"
                        return
                    end
                else
                    if p350 == "BAGGED" then
                        local v496 = Instance.new("TextLabel")
                        v496.AnchorPoint = Vector2.new(0.5, 0)
                        v496.Position = UDim2.new(0.5, 0, 0.5, 0)
                        v496.BackgroundTransparency = 1
                        v496.Text = ... .. " bagged you"
                        v496.TextColor3 = Color3.new(1, 0, 0)
                        v496.TextSize = 35
                        v496.Font = Enum.Font.SourceSans
                        v496.Parent = v_u_19
                        wait(1)
                        game:GetService("TweenService"):Create(v496, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                            ["TextTransparency"] = 1
                        }):Play()
                        wait(1)
                        v496:Destroy()
                        return
                    end
                    if p350 == "Notified" then
                        local v497 = select(1, ...)
                        local v498 = select(2, ...) or false
                        _G.Notification(v497, v498)
                        return
                    end
                    if p350 == "AdminAbuseNotification" then
                        shared.AdminAbuseNotification(...)
                        return
                    end
                    if p350 == "ExplodeRadius" then
                        local v499, v500 = ...
                        for _ = 1, 15 do
                            if (v_u_5.LowerTorso.Position - v499).magnitude <= v500 then
                                local v501 = (1 - (v_u_5.LowerTorso.Position - v499).magnitude / v500) * 2
                                local v502 = v_u_5.Humanoid
                                local v503 = v501 * math.random()
                                local v504 = v501 * math.random()
                                local v505 = v501 * math.random()
                                v502.CameraOffset = Vector3.new(v503, v504, v505)
                            end
                            task.wait()
                        end
                        v_u_5.Humanoid.CameraOffset = Vector3.new(0, 0, 0)
                        return
                    end
                    if p350 == "FLASHBANG" then
                        local v506 = v_u_5.Humanoid.Animator:LoadAnimation(script.FBAnimation)
                        v506:Play(0.100000001, 1, 0.5)
                        local v507 = Instance.new("Sound")
                        v507.SoundId = "rbxassetid://8754837104"
                        v507.Volume = 0.25
                        v507.Parent = script
                        v507:Play()
                        local v508 = Instance.new("Frame")
                        v508.Visible = true
                        v508.Size = UDim2.new(1, 0, 1, 0)
                        v508.Name = "whiteScreen"
                        v508.BackgroundColor3 = Color3.new(1, 1, 1)
                        v508.BorderSizePixel = 0
                        v508.BackgroundTransparency = 1
                        v508.Parent = v_u_19
                        game:GetService("TweenService"):Create(v508, TweenInfo.new(0.5, Enum.EasingStyle.Elastic), {
                            ["BackgroundTransparency"] = 0
                        }):Play()
                        wait(3)
                        game:GetService("TweenService"):Create(v508, TweenInfo.new(5, Enum.EasingStyle.Linear), {
                            ["BackgroundTransparency"] = 1
                        }):Play()
                        wait(5)
                        v506:Stop()
                        v507:Destroy()
                        v508:Destroy()
                        return
                    end
                    if p350 == "CartRide" then
                        local v509 = v_u_5.Humanoid.SeatPart
                        if v509 and (v509:IsA("VehicleSeat") and v509.Parent:FindFirstChild("RTWheel")) then
                            v_u_238:Play(0.100000001, 1, 0)
                            while v_u_5.Humanoid.SeatPart == v509 do
                                if v509.Throttle == 1 then
                                    v_u_238:AdjustSpeed(1)
                                elseif v509.Throttle == -1 then
                                    v_u_238:AdjustSpeed(-1)
                                else
                                    v_u_238:AdjustSpeed(0)
                                end
                                v_u_8.Heartbeat:wait()
                            end
                            v_u_238:Stop()
                            return
                        end
                    elseif p350 == "Bicycling" then
                        local v510 = v_u_5.Humanoid.SeatPart
                        if v510 and (v510:IsA("VehicleSeat") and v510.Parent:FindFirstChild("BikeModel")) then
                            v_u_237:Play(0.100000001, 1, 0)
                            while v_u_5.Humanoid.SeatPart == v510 do
                                if v510.Throttle == 1 then
                                    v_u_237:AdjustSpeed(1)
                                elseif v510.Throttle == -1 then
                                    v_u_237:AdjustSpeed(-1)
                                else
                                    v_u_237:AdjustSpeed(0)
                                end
                                v_u_8.Heartbeat:wait()
                            end
                            v_u_237:Stop()
                            return
                        end
                    else
                        if p350 == "SNOWBALL_EFFECTS" then
                            local v511 = Instance.new("ImageLabel")
                            local v512 = math.random() * 0.2 + 0.5
                            v511.Size = UDim2.new(v512, 0, v512, 0)
                            v511.Position = UDim2.new(math.random() - v512 / 2, 0, math.random() - v512 / 2, 0)
                            v511.SizeConstraint = Enum.SizeConstraint.RelativeXX
                            v511.Transparency = 1
                            v511.Image = "http://www.roblox.com/asset/?id=" .. v_u_236[math.random(1, #v_u_236)]
                            v511.Parent = v_u_19.SNOWBALLFRAME
                            game:GetService("Debris"):AddItem(v511, 5 + math.random() * 2)
                            for _ = 1, 20 do
                                local v513 = Instance.new("ImageLabel")
                                local v514 = math.random() * 0.05 + 0.05
                                v513.Size = UDim2.new(v514, 0, v514, 0)
                                v513.Position = UDim2.new(math.random() - v514 / 2, 0, math.random() - v514 / 2, 0)
                                v513.SizeConstraint = Enum.SizeConstraint.RelativeXX
                                v513.Transparency = 1
                                v513.Image = "http://www.roblox.com/asset/?id=" .. v_u_235[math.random(1, #v_u_235)]
                                v513.Parent = v_u_235
                                game:GetService("Debris"):AddItem(v513, 3 + math.random() * 6)
                            end
                            return
                        end
                        if p350 == "UpdateEdit" then
                            updateEditFurniture()
                            if v_u_240 then
                                v_u_240:setSkins((v_u_192(v_u_9:JSONDecode(v_u_2.DataFolder.Skins.Value), (v_u_9:JSONDecode(v_u_2.DataFolder.Information.HouseSave.Value)))))
                                return
                            end
                        elseif p350 == "AddSelectionToItem" then
                            local v515, v516 = ...
                            local v517 = v516.Price.Value
                            if v515 then
                                if v516:FindFirstChild("SelectionBox") == nil then
                                    local v518 = Instance.new("SelectionBox")
                                    v518.Name = "SelectionBox"
                                    v518.LineThickness = 0.02
                                    v518.Color3 = BrickColor.Green().Color
                                    v518.SurfaceTransparency = 0.75
                                    v518.SurfaceColor3 = BrickColor.Green().Color
                                    v518.Adornee = v516
                                    v518.Parent = v516
                                    local v519 = Instance.new("BillboardGui")
                                    v519.Name = "BillboardGui"
                                    v519.AlwaysOnTop = true
                                    v519.Size = UDim2.new(3, 0, 3, 0)
                                    local v520 = Instance.new("TextLabel")
                                    v520.BackgroundTransparency = 1
                                    v520.TextScaled = true
                                    v520.Size = UDim2.new(1, 0, 1, 0)
                                    v520.Text = "$" .. v_u_3.AddComma(v517)
                                    v520.Font = Enum.Font.GothamBold
                                    v520.TextStrokeColor3 = Color3.new(0, 0, 0)
                                    v520.TextStrokeTransparency = 0
                                    v520.TextColor3 = BrickColor.Green().Color
                                    v520.Parent = v519
                                    v519.Parent = v516
                                    return
                                end
                            elseif v516:FindFirstChild("SelectionBox") then
                                v516.SelectionBox:Destroy()
                                v516.BillboardGui:Destroy()
                                return
                            end
                        elseif p350 == "SelectionBoxAdd" then
                            local v521, v522 = ...
                            if v522 then
                                if v521:FindFirstChild("SelectionBox") == nil then
                                    local v523 = false
                                    if v521.Parent.Name == "Apartment" then
                                        local v524 = Instance.new("BillboardGui")
                                        v524.Name = "BillboardGui"
                                        v524.AlwaysOnTop = true
                                        v524.Size = UDim2.new(3, 0, 3, 0)
                                        local v525 = Instance.new("TextLabel")
                                        v525.BackgroundTransparency = 1
                                        v525.TextScaled = true
                                        v525.Size = UDim2.new(1, 0, 1, 0)
                                        v525.Text = "Rent $" .. v_u_3.AddComma(game.ReplicatedStorage.HouseRentValue.Value)
                                        v525.Font = Enum.Font.GothamBold
                                        v525.TextStrokeColor3 = Color3.new(0, 0, 0)
                                        v525.TextStrokeTransparency = 0
                                        v525.TextColor3 = BrickColor.Green().Color
                                        v525.Parent = v524
                                        v524.Parent = v521
                                    else
                                        local v526 = Instance.new("BillboardGui")
                                        v526.Name = "BillboardGui"
                                        v526.AlwaysOnTop = true
                                        v526.Size = UDim2.new(3, 0, 3, 0)
                                        local v527 = Instance.new("TextLabel")
                                        v527.BackgroundTransparency = 1
                                        v527.TextScaled = true
                                        v527.Size = UDim2.new(1, 0, 1, 0)
                                        v527.Text = v521.Parent.Name .. "\'s House"
                                        v527.Font = Enum.Font.SourceSansItalic
                                        v527.TextColor3 = Color3.new(1, 1, 1)
                                        v527.Parent = v526
                                        v526.Parent = v521
                                        v523 = true
                                    end
                                    local v528 = Instance.new("SelectionBox")
                                    v528.Name = "SelectionBox"
                                    v528.LineThickness = 0.02
                                    v528.Color3 = v523 and BrickColor.Red().Color or BrickColor.Green().Color
                                    v528.SurfaceTransparency = 0.75
                                    v528.SurfaceColor3 = v523 and BrickColor.Red().Color or BrickColor.Green().Color
                                    v528.Adornee = v521
                                    v528.Parent = v521
                                    return
                                end
                            else
                                if v521:FindFirstChild("SelectionBox") then
                                    v521.SelectionBox:Destroy()
                                end
                                if v521:FindFirstChild("BillboardGui") then
                                    v521.BillboardGui:Destroy()
                                    return
                                end
                            end
                        else
                            if p350 == "ReportSent" then
                                return
                            end
                            if p350 == "CheckPlayerClose" then
                                if _G.GUN_COMBAT_TOGGLE then
                                    for _, v529 in pairs(workspace.Players:GetChildren()) do
                                        if v529 ~= v_u_5 and (v529:FindFirstChild("Humanoid") and (v529.Humanoid.Health > 0 and (v529:FindFirstChild("UpperTorso") and (v529.UpperTorso.Position - v_u_5.UpperTorso.Position).magnitude < 5))) then
                                            v_u_17:FireServer("GunCombatToggle", true)
                                            return
                                        end
                                    end
                                    v_u_17:FireServer("GunCombatToggle", false)
                                else
                                    v_u_17:FireServer("GunCombatToggle", false)
                                end
                            end
                            if p350 == "BOOMBOX" then
                                local v530 = ...
                                v_u_19.BoomboxFrame.TextButton.MouseButton1Click:connect(function()
                                    v_u_17:FireServer("Boombox", v_u_19.BoomboxFrame.TextBox.Text)
                                end)
                                v_u_19.BoomboxFrame.TextButton2.MouseButton1Click:connect(function()
                                    v_u_17:FireServer("BoomboxStop")
                                end)
                                v_u_19.BoomboxFrame.Visible = true
                                v530.Equipped:connect(function()
                                    v_u_19.BoomboxFrame.Visible = true
                                end)
                                v530.Unequipped:connect(function()
                                    v_u_19.BoomboxFrame.Visible = false
                                end)
                                return
                            end
                            if p350 == "updateCrewStuff" then
                                updateCrewStuff()
                                return
                            end
                            if p350 == "SecurityCamera" then
                                local v531 = (...).Eye.CFrame
                                v_u_6.CameraType = Enum.CameraType.Scriptable
                                v_u_6.CFrame = CFrame.new(v531.Position, v531.Position + v531.upVector)
                                v_u_19.SecurityCamera.Visible = true
                                local v_u_532 = nil
                                v_u_532 = v_u_5.Humanoid.Jumping:connect(function()
                                    v_u_532:disconnect()
                                    v_u_19.SecurityCamera.Visible = false
                                    v_u_6.CameraType = Enum.CameraType.Custom
                                end)
                                return
                            end
                            if p350 == "FireworkText" then
                                if not v_u_19:FindFirstChild("Fireworktext_") then
                                    local v_u_533 = Instance.new("TextBox")
                                    v_u_533.Name = "Fireworktext_"
                                    v_u_533.Size = UDim2.new(0, 300, 0, 50)
                                    v_u_533.BackgroundColor3 = Color3.new(1, 1, 1)
                                    v_u_533.BorderSizePixel = 0
                                    v_u_533.AnchorPoint = Vector2.new(0.5, 0.5)
                                    v_u_533.Position = UDim2.new(0.5, 0, 0.5, 0)
                                    v_u_533.Text = "Write anything less than 40 characters"
                                    local v534 = Instance.new("TextButton")
                                    v534.AnchorPoint = Vector2.new(0.5, 0)
                                    v534.Position = UDim2.new(0.5, 0, 1.25, 0)
                                    v534.BorderSizePixel = 0
                                    v534.Size = UDim2.new(0.5, 0, 1, 0)
                                    v534.Text = "CONFIRM"
                                    v534.Font = Enum.Font.SourceSansSemibold
                                    v534.TextSize = 30
                                    v534.TextStrokeTransparency = 0
                                    v534.TextColor3 = Color3.new(1, 1, 1)
                                    v534.TextStrokeColor3 = Color3.new(0, 0, 0)
                                    v534.BackgroundColor3 = Color3.new(0.333333, 1, 0.498039)
                                    v534.Parent = v_u_533
                                    local v535 = Instance.new("UICorner")
                                    v535.CornerRadius = UDim.new(0.5, 0)
                                    v535.Parent = v534
                                    v535:Clone().Parent = v_u_533
                                    v_u_533.Parent = v_u_19
                                    local v_u_536 = false
                                    v_u_533.Changed:connect(function()
                                        local v537 = v_u_533
                                        local v538 = v_u_533.Text
                                        v537.Text = string.sub(v538, 0, 40)
                                    end)
                                    v534.Activated:connect(function()
                                        v_u_17:FireServer("FireworkText", v_u_533.Text)
                                        v_u_536 = true
                                    end)
                                    local v539 = v_u_536
                                    repeat
                                        v_u_8.Heartbeat:wait()
                                    until v_u_5:FindFirstChild("[Firework]") == nil or v539 == true
                                    v_u_533:Destroy()
                                end
                            end
                            if p350 == "EXPLODE_FIREWORK" then
                                local v540, v541 = ...
                                v_u_247:Fire(v540, v541)
                                return
                            end
                            if p350 == "DropMoney" then
                                if ... == false then
                                    v_u_19.WalletDrop.Visible = false
                                else
                                    v_u_19.WalletDrop.Visible = not v_u_19.WalletDrop.Visible
                                end
                                if not _G.WalletDropConnections then
                                    _G.WalletDropConnections = true
                                    local v_u_542 = false
                                    v_u_19.WalletDrop.TextButton.MouseButton1Click:connect(function()
                                        if v_u_542 == false then
                                            v_u_542 = true
                                            v_u_17:FireServer("DropMoney", v_u_19.WalletDrop.TextBox.Text)
                                            wait(0.1)
                                            v_u_542 = false
                                        end
                                    end)
                                    return
                                end
                            else
                                if p350 == "GiantRigSpawnEffects" then
                                    local v_u_543 = CFrame.new(-760.803467, 251.037582, -293.688263, -0.235467896, 0.0744867176, 0.968997359, -7.27595761e-12, 0.99704361, -0.0766368881, -0.971863568, -0.0180464182, -0.234774619)
                                    workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
                                    local v544 = tick()
                                    local v_u_545 = (1 - (tick() - v544) / 3) * 4
                                    local v546 = v_u_22.RenderStepped:Connect(function()
                                        v_u_6.CFrame = v_u_543 * CFrame.new(math.random() * v_u_545 - v_u_545 / 2, math.random() * v_u_545 - v_u_545 / 2, math.random() * v_u_545 - v_u_545 / 2)
                                    end)
                                    local v_u_547 = Instance.new("Sound")
                                    v_u_547.Parent = v_u_11.Dump
                                    v_u_547.SoundId = "rbxassetid://9125484526"
                                    v_u_547.Volume = 1
                                    v_u_547:Play()
                                    v_u_547.Ended:Once(function()
                                        v_u_547:Destroy()
                                        v_u_547 = nil
                                    end)
                                    task.wait(3)
                                    v546:Disconnect()
                                    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                                    return
                                end
                                if p350 == "GiantRigSpawnMoney" then
                                    local v_u_548 = CFrame.new(-760.803467, 251.037582, -293.688263, -0.235467896, 0.0744867176, 0.968997359, -7.27595761e-12, 0.99704361, -0.0766368881, -0.971863568, -0.0180464182, -0.234774619)
                                    workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
                                    local v549 = v_u_22.RenderStepped:Connect(function()
                                        v_u_6.CFrame = v_u_548
                                    end)
                                    task.wait(0.75)
                                    task.spawn(function()
                                        for _ = 1, math.random(1, 3) do
                                            local v_u_550 = Instance.new("Sound")
                                            v_u_550.Parent = v_u_11.Dump
                                            v_u_550.SoundId = "rbxassetid://8506497442"
                                            v_u_550.Volume = 1
                                            v_u_550:Play()
                                            v_u_550.Ended:Once(function()
                                                v_u_550:Destroy()
                                                v_u_550 = nil
                                            end)
                                            local v551 = task.wait
                                            local v552 = math.random() * 0.9
                                            v551((math.max(v552, 0.5)))
                                        end
                                    end)
                                    task.wait((...))
                                    v549:Disconnect()
                                    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                                    return
                                end
                                if p350 == "FocusCameraOnTarget" then
                                    local v553 = ...
                                    if v553 then
                                        workspace.CurrentCamera.CameraSubject = v553:FindFirstChild("Humanoid") or v553
                                    end
                                end
                                if p350 == "ResetCameraTarget" then
                                    workspace.CurrentCamera.CameraSubject = v_u_5.Humanoid
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)
v_u_19:WaitForChild("GunCombatToggle")
if _G.GUN_COMBAT_TOGGLE then
    v_u_19.GunCombatToggle.BackgroundColor3 = Color3.fromRGB(176, 255, 102)
else
    v_u_19.GunCombatToggle.BackgroundColor3 = Color3.fromRGB(255, 108, 89)
end
game.ReplicatedStorage.MainEvent:FireServer("ToggleCloseCombat")
v_u_19.GunCombatToggle.MouseButton1Click:connect(function()
    _G.GUN_COMBAT_TOGGLE = not _G.GUN_COMBAT_TOGGLE
    game.ReplicatedStorage.MainEvent:FireServer("ToggleCloseCombat", _G.GUN_COMBAT_TOGGLE)
    if _G.GUN_COMBAT_TOGGLE then
        v_u_19.GunCombatToggle.BackgroundColor3 = Color3.fromRGB(176, 255, 102)
    else
        v_u_19.GunCombatToggle.BackgroundColor3 = Color3.fromRGB(255, 108, 89)
    end
end)
local v_u_554 = nil
local v_u_555 = false
local function v_u_558(p556, p557)
    if CursorImageCheck and CursorImageCheck() then
        v_u_21.BackgroundTransparency = 1
        v_u_21.CursorImage.Visible = true
        v_u_21.Top.Visible = false
        v_u_21.Bottom.Visible = false
        v_u_21.Right.Visible = false
        v_u_21.Left.Visible = false
    else
        v_u_21.BackgroundTransparency = 0
        v_u_21.CursorImage.Visible = false
        v_u_21.Top.Visible = true
        v_u_21.Bottom.Visible = true
        v_u_21.Right.Visible = true
        v_u_21.Left.Visible = true
    end
    if p556 or v_u_40 and (v_u_554 and v_u_554.Parent == v_u_5) then
        _G.Aimed = true
        _G.UpdateAimed(true)
        v_u_21.Visible = true
        v_u_21.CursorImage.Size = v_u_21.CursorImage.Size:lerp(UDim2.new(0, 20, 0, 20), 0.8)
        v_u_21.Top.Position = v_u_21.Top.Position:lerp(UDim2.new(0.5, 0, 0.5, -9), 0.8)
        v_u_21.Bottom.Position = v_u_21.Bottom.Position:lerp(UDim2.new(0.5, 0, 0.5, 9), 0.8)
        v_u_21.Right.Position = v_u_21.Right.Position:lerp(UDim2.new(0.5, 9, 0.5, 0), 0.8)
        v_u_21.Left.Position = v_u_21.Left.Position:lerp(UDim2.new(0.5, -9, 0.5, 0), 0.8)
        if _G.MobileShiftLock or v_u_40 then
            v_u_21.Position = UDim2.fromScale(0.5, 0.5)
            if v_u_21.Parent ~= v_u_20 then
                v_u_21.Parent = v_u_20
            end
            local _ = (v_u_6.CFrame.Position - v_u_5.Head.Position).Magnitude
            if v_u_40 then
                v_u_5.Humanoid.CameraOffset = Vector3.new(1.75, 0, 0)
            end
        else
            v_u_21.Position = UDim2.new(0, v_u_7.x, 0, v_u_7.y)
        end
        v_u_555 = false
        if v_u_554 and not v_u_31.IsPlaying then
            v_u_31:Play()
        end
        v_u_7.Icon = "rbxassetid://33410686"
    else
        if not _G.MobileShiftLock then
            _G.Aimed = false
        end
        v_u_21.Visible = p557 and true or false
        v_u_21.CursorImage.Size = v_u_21.CursorImage.Size:lerp(UDim2.new(0, 28, 0, 28), 1)
        v_u_21.Top.Position = v_u_21.Top.Position:lerp(UDim2.new(0.5, 0, 0.5, -15), 1)
        v_u_21.Bottom.Position = v_u_21.Bottom.Position:lerp(UDim2.new(0.5, 0, 0.5, 15), 1)
        v_u_21.Right.Position = v_u_21.Right.Position:lerp(UDim2.new(0.5, 15, 0.5, 0), 1)
        v_u_21.Left.Position = v_u_21.Left.Position:lerp(UDim2.new(0.5, -15, 0.5, 0), 1)
        if _G.MobileShiftLock then
            v_u_21.Position = UDim2.fromScale(0.5, 0.5)
            if v_u_21.Parent ~= v_u_20 then
                v_u_21.Parent = v_u_20
            end
        else
            v_u_21.Position = UDim2.new(0, v_u_7.x, 0, v_u_7.y)
            if v_u_21.Parent ~= v_u_19 then
                v_u_21.Parent = v_u_19
            end
        end
        if not v_u_555 then
            v_u_5.Humanoid.CameraOffset = Vector3.new(0, 0, 0)
            v_u_555 = true
        end
        v_u_7.Icon = p557 and "rbxassetid://33410686" or ""
        if v_u_31.IsPlaying then
            v_u_31:Stop()
            if not _G.MobileShiftLock then
                _G.UpdateAimed(false)
            end
        end
    end
end
v_u_19.AmmoFrame:WaitForChild("Frame")
v_u_5.ChildAdded:connect(function(p559)
    local v560 = p559:IsA("Tool") and v_u_3.GunHold(v_u_5)
    if v560 then
        v_u_554 = p559
        for _, v561 in pairs(v_u_19.AmmoFrame.Frame:GetChildren()) do
            if v561:IsA("ImageLabel") then
                v561:Destroy()
            end
        end
        local v562 = v560[1].MaxAmmo.Value
        for v563 = 1, v562 do
            local v564 = game.ReplicatedStorage.AmmoG:Clone()
            v564.Name = v562 + 1 - v563
            v564.Parent = v_u_19.AmmoFrame.Frame
        end
    end
end)
v_u_6.ChildAdded:Connect(function(p565)
    if p565:IsA("Model") then
        task.wait(0.5)
        for _, v566 in p565:GetDescendants() do
            if v566:IsA("BasePart") then
                v566.CanCollide = false
                v566.CanQuery = false
            end
        end
    end
end)
local v_u_567 = {
    ["Health"] = v_u_5.Humanoid.Health,
    ["Armor"] = v_u_14.Armor.Value,
    ["FireArmor"] = v_u_14.FireArmor.Value
}
local function v_u_575(p_u_568, p_u_569, p_u_570, p571)
    if p571:FindFirstChild("UIGradient") == nil then
        local v_u_572 = p571:Clone()
        v_u_572.Size = UDim2.new(1, 0, 1, 0)
        v_u_572.Position = UDim2.new(0, 0, 0, 0)
        v_u_572.Name = "UIGradient"
        v_u_572.BackgroundColor3 = Color3.new(1, 1, 1)
        v_u_572.Parent = p571
        local v_u_573 = Instance.new("UIGradient")
        v_u_573.Name = "UIGradient"
        v_u_573.Color = ColorSequence.new(Color3.new(1, 1, 1))
        v_u_573.Enabled = true
        v_u_573.Parent = v_u_572
        task.spawn(function()
            if p_u_568 < p_u_569 and p_u_569 - p_u_568 > p_u_570 * 0.05 then
                for v574 = 0.01, 0.99, 0.05 do
                    v_u_573.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(v574, 0.95), NumberSequenceKeypoint.new(1, 0) })
                    task.wait(0.01)
                end
            end
            v_u_572:Destroy()
        end)
    end
end
v_u_19.Bar.Armor.bar.Size = UDim2.new(v_u_14.Armor.Value / game.ReplicatedStorage.MaxArmor.Value * 0.95, 0, 0.83, 0)
v_u_19.Bar.Armor.firebar.Size = UDim2.new(v_u_14.FireArmor.Value / game.ReplicatedStorage.MaxArmor.Value * 0.95, 0, 0.83, 0)
v_u_19.Bar.HP.bar.Size = UDim2.new(v_u_5.Humanoid.Health / v_u_5.Humanoid.MaxHealth * 0.95, 0, 0.83, 0)
v_u_5.Humanoid.HealthChanged:Connect(function(p576)
    v_u_575(v_u_567.Health, p576, v_u_5.Humanoid.MaxHealth, v_u_19.Bar.HP.bar)
    v_u_19.Bar.HP.bar.Size = UDim2.new(p576 / v_u_5.Humanoid.MaxHealth * 0.95, 0, 0.83, 0)
    v_u_567.Health = p576
end)
v_u_14.FireArmor.Changed:Connect(function(_)
    v_u_575(v_u_567.FireArmor, v_u_14.FireArmor.Value, game.ReplicatedStorage.MaxArmor.Value, v_u_19.Bar.Armor.firebar)
    v_u_19.Bar.Armor.firebar.Size = UDim2.new(v_u_14.FireArmor.Value / game.ReplicatedStorage.MaxArmor.Value * 0.95, 0, 0.83, 0)
    v_u_567.FireArmor = v_u_14.FireArmor.Value
end)
v_u_14.Armor.Changed:Connect(function()
    v_u_575(v_u_567.Armor, v_u_14.Armor.Value, game.ReplicatedStorage.MaxArmor.Value, v_u_19.Bar.Armor.bar)
    v_u_19.Bar.Armor.bar.Size = UDim2.new(v_u_14.Armor.Value / game.ReplicatedStorage.MaxArmor.Value * 0.95, 0, 0.83, 0)
    v_u_567.Armor = v_u_14.Armor.Value
end)
v_u_8:BindToRenderStep("GunAmmo", Enum.RenderPriority.Last.Value - 1, function()
    local v577 = v_u_3.GunHold(v_u_5)
    if v577 then
        if v_u_19.AmmoFrame.Visible == false then
            v_u_19.AmmoFrame.Visible = true
        end
        if v577[1] then
            local v578 = v577[1].Ammo.Value
            local v579 = v577[1].MaxAmmo.Value
            local v580 = not v_u_2.DataFolder.Inventory:FindFirstChild(v577[1].Name) and 0 or v_u_2.DataFolder.Inventory[v577[1].Name].Value
            v_u_19.AmmoFrame.AmmoText.Text = v580
            for v581 = 1, v579 do
                if v581 <= v578 then
                    v_u_19.AmmoFrame.Frame[tostring(v581)].ImageColor3 = Color3.fromRGB(255, 255, 255)
                else
                    v_u_19.AmmoFrame.Frame[tostring(v581)].ImageColor3 = Color3.fromRGB(121, 121, 121)
                end
            end
            if v577[1]:FindFirstChild("Default") and (v577[1].Default:FindFirstChild("Mesh") and v577[1].Default.Mesh:FindFirstChild("Aim")) then
                if _G.Aimed then
                    v577[1].Default.Mesh.Aim.Transparency = 0
                    if v577[1].Default.Mesh.Aim:FindFirstChild("SpotLight") then
                        v577[1].Default.Mesh.Aim.SpotLight.Enabled = true
                        return
                    end
                else
                    v577[1].Default.Mesh.Aim.Transparency = 1
                    if v577[1].Default.Mesh.Aim:FindFirstChild("SpotLight") then
                        v577[1].Default.Mesh.Aim.SpotLight.Enabled = false
                        return
                    end
                end
            end
        end
    elseif v_u_19:WaitForChild("AmmoFrame").Visible == true then
        v_u_19.AmmoFrame.Visible = false
    end
end)
_G.TimerMoney = _G.TimerMoney or tick()
local v_u_582 = false
local v_u_583 = false
v_u_5:WaitForChild("Humanoid")
local v_u_584 = {
    ["Timer"] = tick(),
    ["Time"] = 0
}
v_u_5.Humanoid.Jumping:connect(function()
    if game.Lighting:GetAttribute("Minigames") ~= "DA UP" then
        if tick() - v_u_584.Timer > 2 then
            v_u_584.Time = 0
        end
        v_u_584.Time = v_u_584.Time + 1
        v_u_584.Timer = tick()
        if v_u_584.Time > 4 and v_u_42 == false then
            v_u_42 = true
            wait(1.5)
            v_u_42 = false
        end
    end
end)
local function v_u_588(p_u_585, p586)
    local v_u_587 = Instance.new("TextLabel")
    v_u_587.TextScaled = true
    v_u_587.Text = p_u_585.Name
    v_u_587.Size = UDim2.new(1, 0, 0, 25)
    v_u_587.Name = p_u_585.Name
    v_u_587.Parent = p586
    spawn(function()
        repeat
            wait()
        until game.Players:FindFirstChild(p_u_585.Name) == nil or game.ReplicatedStorage.BattleRoyale.Starting.Value == true
        v_u_587:Destroy()
    end)
end
local v_u_589 = tick()
local v_u_590 = false
local v_u_591 = 0
local v_u_592 = false
game.Lighting.PepperSprayBlur.Enabled = false
local v_u_593 = Instance.new("ProximityPrompt")
v_u_593.ActionText = "Pick"
v_u_593.ObjectText = "Snow"
v_u_593.HoldDuration = 1
v_u_593.KeyboardKeyCode = Enum.KeyCode.Q
local v_u_594 = false
v_u_593.Triggered:connect(function()
    if v_u_594 == false then
        v_u_594 = true
        v_u_17:FireServer("PickSnow")
        task.wait(2)
        v_u_594 = false
    end
end)
local function v_u_598()
    local v595 = {
        ["Min"] = (Vector3.new(-865.715, 37.253, -109.145)).X - (Vector3.new(64.645, 55.31, 48.705)).X,
        ["Max"] = (Vector3.new(-865.715, 37.253, -109.145)).X + (Vector3.new(64.645, 55.31, 48.705)).X
    }
    local v596 = {
        ["Min"] = (Vector3.new(-865.715, 37.253, -109.145)).Y - (Vector3.new(64.645, 55.31, 48.705)).Y,
        ["Max"] = (Vector3.new(-865.715, 37.253, -109.145)).Y + (Vector3.new(64.645, 55.31, 48.705)).Y
    }
    local v597 = {
        ["Min"] = (Vector3.new(-865.715, 37.253, -109.145)).Z - (Vector3.new(64.645, 55.31, 48.705)).Z,
        ["Max"] = (Vector3.new(-865.715, 37.253, -109.145)).Z + (Vector3.new(64.645, 55.31, 48.705)).Z
    }
    if v_u_5.PrimaryPart.Position.X > v595.Min and (v_u_5.PrimaryPart.Position.X < v595.Max and (v_u_5.PrimaryPart.Position.Y > v596.Min and (v_u_5.PrimaryPart.Position.Y < v596.Max and (v_u_5.PrimaryPart.Position.Z > v597.Min and v_u_5.PrimaryPart.Position.Z < v597.Max)))) then
        if not v_u_19.GamblingContentMessage.Visible then
            v_u_19.GamblingContentMessage.Visible = true
            return
        end
    elseif v_u_19.GamblingContentMessage.Visible then
        v_u_19.GamblingContentMessage.Visible = false
    end
end
local v_u_599 = false
local v_u_600 = tick()
v_u_5:WaitForChild("FULLY_LOADED_CHAR", 32)
v_u_14:WaitForChild("Movement")
v_u_8.Heartbeat:connect(function()
    v_u_5 = v_u_5 or v_u_2.Character
    if v_u_5 then
        local v601 = v_u_14:findFirstChild("SuperSpeed") and 70 or 16
        local v602 = v_u_14:findFirstChild("HighJump") and 75 or 50
        if v_u_41 or v_u_5:FindFirstChild("Head"):FindFirstChild("GOT_PEPPER_SPRAY") then
            v601 = v601 * 0.4
        end
        if v_u_5.Head:FindFirstChild("GOT_PEPPER_SPRAY") then
            if v_u_19.PepperSpray.Visible == false then
                v_u_19.PepperSpray.Visible = true
                game.Lighting.PepperSprayBlur.Enabled = true
            end
            local v603 = tick() / 2 % 1
            v_u_19.PepperSpray.BackgroundTransparency = 0.6 + v603 * 0.2
            local v604 = Color3.fromRGB(255, 33, 33)
            local v605 = Color3.fromRGB(255, 120, 75)
            v_u_19.PepperSpray.BackgroundColor3 = v604:Lerp(v605, v603)
            local v606 = tick() * 10
            local v607 = v606 / 6
            local v608 = math.floor(v607) % 2 == 0 and v606 % 6 or 6 - v606 % 6
            game.Lighting.PepperSprayBlur.Size = 8 + v608
        elseif v_u_19:WaitForChild("PepperSpray").Visible == true then
            v_u_19.PepperSpray.Visible = false
            game.Lighting.PepperSprayBlur.Enabled = false
        end
        if v_u_5:FindFirstChild("[Knife]") then
            v601 = v601 * 1.3
            v602 = 59.5
        end
        if v_u_5.Humanoid.Health < 55 then
            v601 = v601 * 0.8
        end
        if v_u_14.Grabbed.Value ~= nil then
            v601 = v601 - 4
        end
        if v_u_5.Humanoid.FloorMaterial == Enum.Material.Snow and (v_u_594 == false and v_u_41 == true) then
            v_u_593.Parent = v_u_5
        else
            v_u_593.Parent = nil
        end
        if v_u_5.Humanoid.FloorMaterial == Enum.Material.Basalt then
            if not v_u_36.IsPlaying then
                v_u_36:Play()
            end
        elseif v_u_36.IsPlaying then
            v_u_36:Stop()
        end
        if not v_u_41 and (v_u_24 and (v_u_5.Humanoid.Health > 55 and (v_u_5.Humanoid.MoveDirection.magnitude > 0 and (v_u_14["K.O"].Value == false and (v_u_14.Movement:FindFirstChild("NoWalkSpeed") == nil and (v_u_14.Movement:FindFirstChild("ReduceWalk") == nil and (v_u_14.Movement:FindFirstChild("NoJumping") == nil and v_u_14:FindFirstChild("Block") == nil))))))) and (not v_u_14:findFirstChild("Symbiote") or v_u_14.Symbiote.Value ~= false) then
            v601 = v601 + 6
            if v_u_14.Movement:findFirstChild("SuperSpeed") then
                v601 = v601 + 30
            end
            if v_u_14.Movement:findFirstChild("FastSprint") then
                v601 = v601 + 9
            end
        end
        local v609 = v_u_14:FindFirstChild("Block") and 5 or v601
        local v610 = (v_u_14["K.O"].Value == true or v_u_14.Movement:FindFirstChild("NoWalkSpeed")) and 0 or v609
        local v611 = v_u_14.Movement:FindFirstChild("HulkJump") and 90 or v602
        local v612 = (v_u_14["K.O"].Value == true or (v_u_14.Movement:FindFirstChild("NoJumping") or v_u_42)) and 0 or v611
        if v_u_14.Movement:FindFirstChild("ReduceWalk") or v_u_14.Reload.Value == true then
            v610 = v610 - 9
        end
        if v_u_5:FindFirstChild("Parachute-BattleRoyale") then
            v610 = 65
            if workspace.Gravity > 150 then
                workspace.Gravity = 5
            end
            local v613 = Ray.new
            local v614 = v_u_5.HumanoidRootPart.Position
            local v615 = -5 * v_u_5.HumanoidRootPart.Size.y
            local v616 = v613(v614, (Vector3.new(0, v615, 0)))
            if workspace:FindPartOnRayWithWhitelist(v616, { workspace.MAP }) then
                v_u_17:FireServer("RemoveParachute")
            end
        elseif workspace.Gravity < 150 and v_u_2.UserId ~= 439942262 then
            workspace.Gravity = 196.2
        end
        local v617 = v_u_5.HumanoidRootPart.Anchored and 0 or v610
        if v_u_14["K.O"].Value == false and (v_u_5:FindFirstChild("GRABBING_CONSTRAINT") == nil and (not v_u_5.Humanoid.PlatformStand and (tick() - v_u_600 > 0.65 and (not v_u_3.isMacroAllowed() and (not v_u_2:GetAttribute("ShotFlintlock") and (v_u_14.Movement:findFirstChild("FastSprint") == nil and (v_u_14.Movement:findFirstChild("SuperSpeed") == nil and (not v_u_599 and (v_u_5.HumanoidRootPart.AssemblyLinearVelocity * Vector3.new(1, 0, 1)).magnitude > 40)))))))) then
            v_u_599 = true
            v_u_6.CameraType = Enum.CameraType.Scriptable
            task.spawn(function()
                local v618 = 0.5
                repeat
                    v618 = v618 - task.wait()
                until v618 < 0 or v_u_2:GetAttribute("ShotFlintlock")
                v_u_599 = false
                v_u_6.CameraType = Enum.CameraType.Custom
            end)
        end
        local v619 = v_u_599 and 0 or v617
        local v620 = math.max(0, v619)
        local v621 = math.max(0, v612)
        _G.CurrentWS = v620
        v_u_19.Bar.Energy.bar.Size = UDim2.new(v_u_14.Defense.Value / 100 * 0.95, 0, 0.83, 0)
        if v_u_41 then
            local v622 = v_u_5.HumanoidRootPart.AssemblyLinearVelocity
            if v_u_5.Humanoid.FloorMaterial ~= Enum.Material.Air then
                if not v_u_35.IsPlaying and v_u_27.slide == false then
                    v_u_35:Play()
                end
                if v_u_5.Humanoid.MoveDirection.magnitude > 0 then
                    v_u_35:AdjustSpeed(1)
                else
                    v_u_35:AdjustSpeed(0)
                end
                if v_u_41 and not v_u_3.isMacroAllowed() then
                    if v_u_5.Humanoid.MoveDirection.magnitude > 0 and (v_u_5.Humanoid.FloorMaterial ~= Enum.Material.Air and (v622.Magnitude < 1000 and v622.Magnitude > 1)) then
                        if v_u_27.slide == false and (v_u_27.slidedebounce == false and v_u_5.Humanoid:GetState() == Enum.HumanoidStateType.Landed) then
                            v_u_27.slidedebounce = true
                            local v623 = v622 * Vector3.new(1, 0, 1)
                            local v624 = v_u_5.Humanoid.Health < 55 and 16 or 24
                            v_u_27.slide = v623.Unit * v624 * 3
                            v_u_600 = tick()
                            task.delay(v_u_27.slidecd, function()
                                v_u_27.slidedebounce = false
                            end)
                        end
                    else
                        v_u_27.slide = false
                    end
                else
                    v_u_27.slide = false
                end
            end
        else
            if v_u_35.IsPlaying then
                v_u_35:Stop()
            end
            v_u_27.slide = false
        end
        if v_u_27.slide then
            if not v_u_30.IsPlaying then
                v_u_30:Play()
            end
            if v_u_35.IsPlaying then
                v_u_35:Stop()
            end
        elseif v_u_30.IsPlaying then
            v_u_30:Stop()
        end
        v_u_5.Humanoid.WalkSpeed = v620
        v_u_5.Humanoid.JumpPower = v621
        v_u_27.slideFunction(v_u_5)
        if v_u_5:GetAttribute("BasketballHolder") then
            if v_u_38 == false then
                v_u_38 = true
                if v_u_37 then
                    if not v_u_39.DribbleLeft.IsPlaying then
                        v_u_39.DribbleLeft:Play()
                    end
                    if v_u_39.DribbleRight.IsPlaying then
                        v_u_39.DribbleRight:Stop()
                    end
                else
                    if v_u_39.DribbleLeft.IsPlaying then
                        v_u_39.DribbleLeft:Stop()
                    end
                    if not v_u_39.DribbleRight.IsPlaying then
                        v_u_39.DribbleRight:Play()
                    end
                end
            end
        else
            if v_u_39.DribbleLeft.IsPlaying then
                v_u_39.DribbleLeft:Stop()
            end
            if v_u_39.DribbleRight.IsPlaying then
                v_u_39.DribbleRight:Stop()
            end
            v_u_38 = false
        end
        local v625 = v_u_3.GunHold(v_u_5)
        _G.HoldGunBool = v625
        local v626
        if _G.MobileShiftLock then
            v626 = v_u_6.CFrame.p + v_u_6.CFrame.LookVector * 60
        else
            v626 = v_u_7.Hit.p
        end
        if v625 and v_u_14:FindFirstChild("Block") == nil then
            v_u_17:FireServer("UpdateMousePosI2", v626)
            if v_u_3.IsMobile() then
                v_u_19.MobileLayout.Fire.Visible = true
                v_u_19.MobileLayout.RightClick.Visible = true
            end
            if v_u_25 then
                v_u_558(true, nil)
            else
                v_u_558(false, true)
            end
            v_u_19.GunCombatToggle.Visible = true
        else
            v_u_19.MobileLayout.Fire.Visible = false
            v_u_19.MobileLayout.RightClick.Visible = false
            v_u_19.GunCombatToggle.Visible = false
            v_u_558(false)
        end
        if tick() - _G.TimerMoney > 360 then
            _G.TimerMoney = tick()
            v_u_17:FireServer("TimerMoney")
        end
        if v_u_2.DataFolder.Information:FindFirstChild("Jail") then
            local v627 = v_u_2.DataFolder.Information.Jail.Value
            if tonumber(v627) > 0 then
                if (v_u_2.Character.HumanoidRootPart.Position - workspace.Ignored.JAILLOCATION1.Position).magnitude < game.ReplicatedStorage.JailRadius.Value then
                    v_u_19.TimerJail.Text = "Jail Timer: " .. v_u_2.DataFolder.Information.Jail.Value
                else
                    v_u_19.TimerJail.Text = "Jail Timer: Stay in cage for countdown"
                end
                v_u_19.TimerJail.Visible = true
                if v_u_582 == false then
                    v_u_582 = true
                    v_u_17:FireServer("TimerDecrease")
                    delay(1, function()
                        v_u_582 = false
                    end)
                end
            else
                v_u_19.TimerJail.Visible = false
                if v_u_5.BodyEffects.Cuff.Value == true then
                    v_u_17:FireServer("UNCUFF")
                end
            end
        else
            v_u_19.TimerJail.Visible = false
        end
        v_u_598()
        if v_u_3.IsMobile() then
            if v_u_5:FindFirstChild("Combat") or (v_u_5:FindFirstChild("[Pitchfork]") or (v_u_5:FindFirstChild("[Knife]") or (v_u_5:FindFirstChild("[Bat]") or (v_u_5:FindFirstChild("[Shovel]") or (v_u_5:FindFirstChild("[SledgeHammer]") or v_u_5:FindFirstChild("[StopSign]")))))) then
                v_u_19.ChargeButton.Visible = true
            else
                v_u_19.ChargeButton.Visible = false
            end
            if v_u_5:FindFirstChild("[Taser]") then
                v_u_19.TaseButton.Visible = true
            else
                v_u_19.TaseButton.Visible = false
            end
            v_u_19.Leaderboard.Visible = false
            v_u_19.MobileLayout.Visible = true
            v_u_19.Crew.Settings.Frame.InnerFrame.List.MobileEditor.Visible = true
            if v_u_583 == false then
                v_u_583 = true
                game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
            end
        else
            v_u_19.Leaderboard.Size = UDim2.new(0, 200, 0, 320)
            v_u_19.Leaderboard.TextButton.Visible = false
            v_u_19.MobileLayout.Visible = false
            v_u_19.Crew.Settings.Frame.InnerFrame.List.MobileEditor.Visible = false
            if v_u_583 then
                v_u_583 = false
                game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
            end
        end
        if _G.Snowing and _G.Reduce_Lag ~= true then
            if _G.SnowingDebug == nil then
                _G.SnowingDebug = tick()
            end
            local v628 = _G.SnowBlock
            if v628 == nil then
                v628 = game.ReplicatedStorage.SnowBlock:Clone()
                v628.Parent = workspace.Ignored
                _G.SnowBlock = v628
            end
            v628.CFrame = CFrame.new(v_u_6.CFrame.p) + Vector3.new(0, 10, 0) + v_u_6.CFrame.lookVector * Vector3.new(3, 0, 3)
            if tick() - _G.SnowingDebug > 0.8 then
                local v629 = v_u_6.CFrame.p
                local v630 = Ray.new
                local v631 = v629.x
                local v632 = v629.z
                local v633 = Vector3.new(v631, 250, v632)
                local v634 = v629.y - 250
                local v635 = v630(v633, (Vector3.new(0, v634, 0)))
                local v636 = workspace:FindPartOnRayWithWhitelist(v635, { workspace.MAP })
                if v636 and v636.Material ~= Enum.Material.Grass then
                    v628.ParticleEmitter.Enabled = false
                    game.Lighting.SnowBlur.Enabled = false
                else
                    game.Lighting.SnowBlur.Enabled = true
                    v628.ParticleEmitter.Enabled = true
                end
                _G.SnowingDebug = tick()
            end
        end
        if v_u_2:FindFirstChild("OwnHouseTag") and v_u_19.Crew.BottomLeft.Frame.Edit.Visible == false then
            v_u_19.Crew.BottomLeft.Frame.Edit.Visible = true
        elseif not v_u_2:FindFirstChild("OwnHouseTag") then
            v_u_19.Crew.BottomLeft.Frame.Edit.Visible = false
            unselectHouseItem()
            v_u_19.EditFrame.Visible = false
        end
        if v_u_242 ~= false then
            local v637 = v_u_6:FindFirstChild(v_u_242[1])
            if v637 == nil then
                v637 = game.ReplicatedStorage.HouseItemSale[v_u_242[1]]:Clone()
                for _, v638 in v637:GetDescendants() do
                    if v638:IsA("BasePart") then
                        v638.CanCollide = false
                    end
                end
                local v639 = Instance.new("SelectionBox")
                v639.Name = "SelectionBox"
                v639.Adornee = v637
                v639.Color3 = BrickColor.Green().Color
                v639.SurfaceColor3 = BrickColor.Green().Color
                v639.SurfaceTransparency = 0.5
                v639.LineThickness = 0.01
                v639.Parent = v637
                v637.Parent = v_u_6
            end
            local v640 = v_u_3.GetFurniturePosLocation(v_u_2, v637)
            local _, v641 = v_u_3.GetHouseItemCFrame(v_u_2, v637.Name, v640, v_u_239)
            local v642 = v637.SelectionBox
            if v641 then
                v642.Color3 = BrickColor.Green().Color
                v642.SurfaceColor3 = BrickColor.Green().Color
            else
                v642.Color3 = BrickColor.Red().Color
                v642.SurfaceColor3 = BrickColor.Red().Color
            end
            local v643 = v_u_239
            v637:SetPrimaryPartCFrame(CFrame.new(v640) * CFrame.Angles(0, math.rad(v643), 0))
        end
        if v_u_5:FindFirstChild("[!VIRUS!]") and _G.Coughing ~= true then
            _G.Coughing = true
            v_u_17:FireServer("VirusCough")
            delay(10 + math.random(10, 60), function()
                _G.Coughing = false
            end)
        end
        if game.Lighting:GetAttribute("Minigames") and game.ReplicatedStorage.MiniGameClient:FindFirstChild(game.Lighting:GetAttribute("Minigames")) then
            require(game.ReplicatedStorage.MiniGameClient[game.Lighting:GetAttribute("Minigames")])(v_u_2, v_u_19)
        end
        if game.ReplicatedStorage.BattleRoyale.Value then
            if workspace.Ignored.Siren.Radius:FindFirstChild("CylinderFF") then
                local v644 = workspace.Ignored.Siren.Radius.CylinderFF.Size.x * 0.5
                local v645 = workspace.Ignored.Siren.Radius.CylinderFF.Position
                local v646 = v_u_6.CFrame.x
                local v647 = v645.y
                local v648 = v_u_6.CFrame.z
                if v644 <= (Vector3.new(v646, v647, v648) - v645).magnitude then
                    if v_u_19:FindFirstChild("ZONE_FF") == nil then
                        local v649 = Instance.new("Frame")
                        v649.Name = "ZONE_FF"
                        v649.BackgroundColor3 = workspace.Ignored.Siren.Radius.CylinderFF.Color
                        v649.BackgroundTransparency = 0.5
                        v649.Size = UDim2.new(1, 0, 1, 50)
                        v649.Position = UDim2.new(0, 0, 0, -50)
                        v649.Parent = v_u_19
                    end
                elseif v_u_19:FindFirstChild("ZONE_FF") then
                    v_u_19.ZONE_FF:Destroy()
                end
                local v650 = v_u_5.LowerTorso.Position.x
                local v651 = v645.y
                local v652 = v_u_5.LowerTorso.Position.z
                if v644 <= (Vector3.new(v650, v651, v652) - v645).magnitude then
                    v_u_17:FireServer("TakePoisonDamage")
                end
                if v_u_592 == true then
                    local v653 = v_u_6:FindFirstChild("Confetti")
                    if v653 == nil then
                        game.ReplicatedStorage.Confetti.Parent = v_u_6
                    else
                        v653.CFrame = v_u_6.CFrame * CFrame.new(0, 0, -10) * CFrame.Angles(1.5707963267948966, 0, 0)
                        for _, v654 in pairs(v653:GetChildren()) do
                            if v654:IsA("ParticleEmitter") and v654.Enabled == false then
                                v654.Enabled = true
                            end
                        end
                    end
                end
            end
            if tick() - v_u_589 > 1 then
                v_u_589 = tick()
                return
            end
            if game.ReplicatedStorage.BattleRoyale.FFA.Value == true then
                if v_u_19.BattleRoyaleFFA.Visible == false then
                    v_u_19.BattleRoyaleFFA.Visible = true
                end
                if game.ReplicatedStorage.BattleRoyale.Starting.Value == true and v_u_19.BattleRoyaleFFA.BackgroundTransparency ~= 1 then
                    v_u_19.BattleRoyaleFFA.BackgroundTransparency = 1
                    v_u_19.BattleRoyaleFFA.TextLabel.Visible = false
                end
                local v655 = {}
                for _, v656 in pairs(game.Players:GetPlayers()) do
                    if v656 and (v656:FindFirstChild("DataFolder") and v656.DataFolder.Information:FindFirstChild("Crew")) then
                        local v_u_657 = v656.DataFolder.Information.Crew.Value
                        if tonumber(v_u_657) then
                            if v_u_26[v_u_657] == nil and v_u_19.BattleRoyaleFFA.Teams:FindFirstChild(v_u_657) == nil then
                                local v_u_658 = v_u_19.BattleRoyaleFFA.TeamFrame:Clone()
                                v_u_658.Name = v_u_657
                                delay(1, function()
                                    local v659 = v_u_657
                                    local v660 = game:GetService("GroupService"):GetGroupInfoAsync((tonumber(v659))).EmblemUrl
                                    v_u_658.TeamIcon.Image = v660
                                end)
                                v_u_658.Visible = true
                                v_u_658.Parent = v_u_19.BattleRoyaleFFA.Teams
                                v_u_26[v_u_657] = v_u_658
                            end
                            local v661 = v656.Character.BodyEffects.Dead.Value
                            v655[v_u_657] = v655[v_u_657] or 0
                            if not v661 then
                                v655[v_u_657] = v655[v_u_657] + 1
                            end
                        end
                    end
                end
                for _, v662 in pairs(v_u_19.BattleRoyaleFFA.Teams:GetChildren()) do
                    if v662:IsA("Frame") then
                        local v663 = v655[v662.Name]
                        v662.AliveText.Text = (v663 or "0") .. " Players Left"
                        if v663 == 0 or v663 == nil then
                            v662.AliveText.Visible = false
                            v662.TeamIcon.ImageColor3 = Color3.new(0.388235, 0.388235, 0.388235)
                            v662.TeamIcon.ImageTransparency = 0.5
                        else
                            v662.AliveText.Visible = true
                            v662.TeamIcon.ImageColor3 = Color3.new(1, 1, 1)
                            v662.TeamIcon.ImageTransparency = 0
                        end
                    end
                end
                local v664 = 0
                for v665, v666 in pairs(v_u_26) do
                    v664 = v664 + 1
                    local v667 = v_u_19.BattleRoyaleFFA.Teams:FindFirstChild(v665)
                    if v667 ~= v666 then
                        v667:Destroy()
                    end
                end
                v_u_19.BattleRoyaleFFA.Teams.CanvasSize = UDim2.new(0, 0, 0, v664 * 70)
                if workspace.Ignored:FindFirstChild("HELICOPTER1") and workspace.Ignored:FindFirstChild("HELICOPTER2") then
                    v_u_6.CameraType = Enum.CameraType.Custom
                    local v668 = v_u_2.Name
                    local v669 = string.byte
                    if tonumber(v669(v668)) % 2 == 0 then
                        v_u_6.CameraSubject = workspace.Ignored.HELICOPTER1.PrimaryPart
                    else
                        v_u_6.CameraSubject = workspace.Ignored.HELICOPTER2.PrimaryPart
                    end
                end
                if game.ReplicatedStorage.BattleRoyale.CTF.Value == false then
                    if v_u_14.Dead.Value == false then
                        v_u_6.CameraSubject = v_u_5.Humanoid
                    else
                        v_u_19.BattleRoyaleFFA.Next.Visible = true
                        v_u_19.BattleRoyaleFFA.Back.Visible = true
                        v_u_19.BattleRoyaleFFA.Spectate.Visible = true
                        local v670 = game.Players:GetChildren()[v_u_591 % #game.Players:GetChildren() + 1]
                        v_u_6.CameraSubject = v670.Character.Humanoid
                        v_u_19.BattleRoyaleFFA.Spectate.Text = v670.Name
                    end
                end
            else
                if game.ReplicatedStorage.BattleRoyale.Starting.Value == false then
                    local v671 = CFrame.new(-483.752075, 31.9074516, -513.836365, -0.0257620476, 0.0197308436, -0.999473453, -0, 0.999805391, 0.0197373927, 0.999668181, 0.000508475641, -0.0257570297)
                    local v672 = CFrame.new(-486.555328, 31.9074516, -405.040649, -0.0257620476, 0.0197308436, -0.999473453, -0, 0.999805391, 0.0197373927, 0.999668181, 0.000508475641, -0.0257570297)
                    if v_u_19.BattleRoyale.Visible == false then
                        v_u_19.BattleRoyale.Visible = true
                        v_u_5.HumanoidRootPart.CFrame = v671:Lerp(v672, 0.5)
                    end
                    _G.BattleRoyaleTeam1 = _G.BattleRoyaleTeam1 or game:GetService("GroupService"):GetGroupInfoAsync(game.ReplicatedStorage.BattleRoyale.Team1.Value).EmblemUrl
                    _G.BattleRoyaleTeam2 = _G.BattleRoyaleTeam2 or game:GetService("GroupService"):GetGroupInfoAsync(game.ReplicatedStorage.BattleRoyale.Team2.Value).EmblemUrl
                    v_u_19.BattleRoyale.Team1.Image = _G.BattleRoyaleTeam1
                    v_u_19.BattleRoyale.Team2.Image = _G.BattleRoyaleTeam2
                    local v_u_673 = 0
                    local v_u_674 = 0
                    for _, v_u_675 in pairs(game.Players:GetChildren()) do
                        pcall(function()
                            if v_u_675 and (v_u_675:FindFirstChild("DataFolder") and v_u_675.DataFolder.Information:FindFirstChild("Crew")) then
                                local v676 = v_u_675.DataFolder.Information.Crew.Value
                                local v677 = tonumber(v676)
                                if v677 == game.ReplicatedStorage.BattleRoyale.Team1.Value then
                                    v_u_673 = v_u_673 + 1
                                    if v_u_19.BattleRoyale.Team1Player:FindFirstChild(v_u_675.Name) == nil then
                                        v_u_588(v_u_675, v_u_19.BattleRoyale.Team1Player)
                                        return
                                    end
                                elseif v677 == game.ReplicatedStorage.BattleRoyale.Team2.Value then
                                    v_u_674 = v_u_674 + 1
                                    if v_u_19.BattleRoyale.Team2Player:FindFirstChild(v_u_675.Name) == nil then
                                        v_u_588(v_u_675, v_u_19.BattleRoyale.Team2Player)
                                    end
                                end
                            end
                        end)
                    end
                    v_u_19.BattleRoyale.TextLabel.Text = tostring(v_u_673) .. "-WAITING-" .. tostring(v_u_674)
                    return
                end
                v_u_19.BattleRoyale.Visible = false
                v_u_19.BattleRoyaleAlives.Visible = true
                local v_u_678 = 0
                local v_u_679 = 0
                for _, v_u_680 in pairs(game.Players:GetChildren()) do
                    pcall(function()
                        if v_u_680 and (v_u_680.Character and (v_u_680.Character.BodyEffects.Dead.Value ~= true and v_u_680.DataFolder.Information:FindFirstChild("Crew"))) then
                            local v681 = v_u_680.DataFolder.Information.Crew.Value
                            if tonumber(v681) == game.ReplicatedStorage.BattleRoyale.Team1.Value then
                                v_u_678 = v_u_678 + 1
                                return
                            end
                            local v682 = v_u_680.DataFolder.Information.Crew.Value
                            if tonumber(v682) == game.ReplicatedStorage.BattleRoyale.Team2.Value then
                                v_u_679 = v_u_679 + 1
                            end
                        end
                    end)
                end
                v_u_19.BattleRoyaleAlives.Team1.Image = _G.BattleRoyaleTeam1
                v_u_19.BattleRoyaleAlives.Team2.Image = _G.BattleRoyaleTeam2
                v_u_19.BattleRoyaleAlives.Team1.TextLabel.Text = v_u_678
                v_u_19.BattleRoyaleAlives.Team2.TextLabel.Text = v_u_679
                if v_u_678 == 0 and game.ReplicatedStorage.BattleRoyale.CTF.Value == false then
                    if v_u_592 == false then
                        v_u_592 = true
                        v_u_250(2)
                    end
                elseif v_u_679 == 0 and (game.ReplicatedStorage.BattleRoyale.CTF.Value == false and v_u_592 == false) then
                    v_u_592 = true
                    v_u_250(1)
                end
                if workspace.Ignored:FindFirstChild("HELICOPTER1") and workspace.Ignored:FindFirstChild("HELICOPTER2") then
                    v_u_6.CameraType = Enum.CameraType.Custom
                    local v683 = v_u_2.DataFolder.Information.Crew.Value
                    if tonumber(v683) == game.ReplicatedStorage.BattleRoyale.Team1.Value then
                        v_u_6.CameraSubject = workspace.Ignored.HELICOPTER1.PrimaryPart
                    else
                        v_u_6.CameraSubject = workspace.Ignored.HELICOPTER2.PrimaryPart
                    end
                elseif v_u_14.Dead.Value == false then
                    if v_u_590 == false then
                        v_u_590 = true
                        v_u_6.CameraSubject = v_u_5.Humanoid
                    end
                else
                    v_u_19.BattleRoyaleAlives.Next.Visible = true
                    v_u_19.BattleRoyaleAlives.Back.Visible = true
                    v_u_19.BattleRoyaleAlives.Spectate.Visible = true
                    local v684 = game.Players:GetChildren()[v_u_591 % #game.Players:GetChildren() + 1]
                    v_u_6.CameraSubject = v684.Character.Humanoid
                    v_u_19.BattleRoyaleAlives.Spectate.Text = v684.Name
                end
            end
        end
    end
end)
v_u_19.BattleRoyaleFFA.Next.MouseButton1Click:connect(function()
    v_u_591 = v_u_591 + 1
end)
v_u_19.BattleRoyaleFFA.Back.MouseButton1Click:connect(function()
    v_u_591 = v_u_591 - 1
end)
v_u_19.BattleRoyaleAlives.Next.MouseButton1Click:connect(function()
    v_u_591 = v_u_591 + 1
end)
v_u_19.BattleRoyaleAlives.Back.MouseButton1Click:connect(function()
    v_u_591 = v_u_591 - 1
end)
v_u_19.Crew.BottomLeft.Frame.Edit.MouseButton1Click:connect(function()
    if v_u_241 == false then
        v_u_241 = true
        updateEditFurniture()
        v_u_208()
        if v_u_19.EditFrame.Visible == true then
            local v685 = v_u_242
            if typeof(v685) == "table" then
                v_u_242[3]:Destroy()
            end
            v_u_178:Cleanup()
            v_u_242 = false
            v_u_6:ClearAllChildren()
        end
        v_u_19.EditFrame.Visible = not v_u_19.EditFrame.Visible
        wait(0.2)
        v_u_241 = false
    end
end)
if v_u_19.Crew.BottomLeft.Frame:WaitForChild("Event", 8) then
    v_u_19.Crew.BottomLeft.Frame.Event.Activated:Connect(function()
        v_u_19["EVENT!"].Visible = not v_u_19["EVENT!"].Visible
    end)
    v_u_19["EVENT!"].CloseButton.Activated:Connect(function()
        v_u_19["EVENT!"].Visible = false
    end)
    v_u_19["EVENT!"].RemindButton.Activated:Connect(function()
        v_u_12:PromptRsvpToEventAsync("6713187885999981107")
    end)
end
local v686 = game:GetService("Players").LocalPlayer
if not v686:GetAttribute("EventShown") then
    v686:SetAttribute("EventShown", true)
    task.delay(6.44, function()
        v_u_19["EVENT!"].Visible = true
    end)
end
local v_u_687 = false
local v_u_688 = false
local function v_u_689()
    if v_u_688 == false then
        v_u_688 = true
        v_u_19.WeaponSkinsGUI.Visible = not v_u_19.WeaponSkinsGUI.Visible
        task.wait(0.01)
        if v_u_14["K.O"].Value == false then
            if v_u_19.WeaponSkinsGUI.Visible then
                game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
            else
                game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
            end
        end
        task.wait(0.5)
        v_u_688 = false
    end
end
function OpenWeaponSkinsGUI()
    v_u_689()
    if v_u_687 == false then
        v_u_687 = true
        local v_u_690 = require(game.ReplicatedStorage.SkinModules)
        local v691 = require(game.ReplicatedStorage.SkinModules.Icon)
        local v_u_692 = game.ReplicatedStorage.SkinModules.GunModels
        local v_u_693 = game.ReplicatedStorage.SkinModules.Knives
        local v_u_694 = game.ReplicatedStorage.SkinModules.Masks
        local v_u_695 = game.ReplicatedStorage.SkinModules.Houses
        local v_u_696 = game.ReplicatedStorage.SkinModules.Wallets
        local v_u_697 = game.ReplicatedStorage.SkinModules.Bats
        local v_u_698 = game:GetService("TweenService")
        local v699 = v_u_19:WaitForChild("WeaponSkinsGUI")
        local v700 = v699:WaitForChild("Body")
        local v_u_701 = v699:WaitForChild("PurchaseFrame")
        local v702 = v700:WaitForChild("Wrapper")
        local v_u_703 = v702:WaitForChild("SkinView"):WaitForChild("Frame")
        local v_u_704 = v702:WaitForChild("CrateOpening")
        local v705 = v_u_703:WaitForChild("Guns")
        local v_u_706 = v_u_703:WaitForChild("Skins")
        local v_u_707 = v702:WaitForChild("SkinView"):WaitForChild("Trading")
        local function v_u_710(p708, p709)
            if p709 then
                return p709[1]
            end
            if p708 == "Common" then
                return Color3.new(0.176471, 1, 0.164706)
            end
            if p708 == "Rare" then
                return Color3.new(0.807843, 0.109804, 0.109804)
            end
            if p708 == "Epic" then
                return Color3.new(0.419608, 0.243137, 1)
            end
            if p708 == "Legendary" then
                return Color3.new(1, 0.764706, 0.207843)
            end
            if p708 == "Exclusive" then
                return Color3.new(0.533333, 0.52549, 0.517647)
            end
        end
        local function v_u_713(p711, p712)
            if p712 then
                return p712[2]
            end
            if p711 == "Common" then
                return v_u_706.Contents.Rarities.Container.Common.UIGradient.Color
            end
            if p711 == "Rare" then
                return v_u_706.Contents.Rarities.Container.Rare.UIGradient.Color
            end
            if p711 == "Epic" then
                return v_u_706.Contents.Rarities.Container.Epic.UIGradient.Color
            end
            if p711 == "Legendary" then
                return v_u_706.Contents.Rarities.Container.Legendary.UIGradient.Color
            end
            if p711 == "Exclusive" then
                return ColorSequence.new(Color3.new(1, 1, 1), Color3.new(0.890196, 0.839216, 0.0980392))
            end
        end
        local v_u_714 = true
        local v_u_715 = false
        local v_u_716 = nil
        local v_u_717 = game:GetService("PolicyService")
        local v_u_718, v_u_719 = pcall(function()
            return v_u_717:GetPolicyInfoForPlayerAsync(v_u_2)
        end)
        local function v_u_730(p720)
            if p720 and v_u_714 then
                v_u_714 = false
                local v_u_721 = p720[1]
                local v_u_722 = p720[2]
                v_u_701.TextLabel.Text = "Sell (10K DHC)\n" .. string.gsub(string.gsub(v_u_721, "%[", ""), "%]", "") .. ": " .. (v_u_690[v_u_721][v_u_722].DisplayName or v_u_722)
                v_u_701.Frame.Confirm1Button.Visible = false
                v_u_701.Frame.Confirm2Button.Visible = false
                v_u_701.Frame.ConfirmButton.Visible = true
                v_u_701.Frame.Amount.Visible = true
                script.ClickSound:Play()
                v_u_701.Visible = true
                local v_u_723 = false
                local v724 = v_u_701.Frame.ConfirmButton.Activated:Connect(function()
                    v_u_723 = true
                    v_u_17:FireServer("SellSkins", v_u_721, v_u_722, v_u_701.Frame.Amount.Text)
                end)
                local v725 = v_u_701.Frame.CancelButton.Activated:Connect(function()
                    v_u_723 = true
                end)
                repeat
                    task.wait()
                until v_u_723
                v724:Disconnect()
                v725:Disconnect()
                v_u_701.Visible = false
                v_u_714 = true
            elseif v_u_714 then
                v_u_714 = false
                if v_u_716 == nil then
                    if v_u_715 then
                        v_u_701.TextLabel.Text = "Purchase & Open\n10x Crate (1M)"
                    else
                        v_u_701.TextLabel.Text = "Purchase & Open\nCrate (100K)"
                    end
                    v_u_701.Frame.Confirm1Button.Visible = false
                    v_u_701.Frame.Confirm2Button.Visible = false
                    v_u_701.Frame.ConfirmButton.Visible = true
                    v_u_701.Frame.Amount.Visible = false
                else
                    if v_u_716 == 2 then
                        v_u_701.TextLabel.Text = "Knife Crate"
                    elseif v_u_716 == 3 then
                        v_u_701.TextLabel.Text = "Winter Crate"
                    else
                        v_u_701.TextLabel.Text = "Premium Crate"
                    end
                    v_u_701.Frame.Confirm1Button.Visible = true
                    v_u_701.Frame.Confirm2Button.Visible = true
                    v_u_701.Frame.ConfirmButton.Visible = false
                    v_u_701.Frame.Amount.Visible = false
                end
                v_u_701.Visible = true
                script.ClickSound:Play()
                local v_u_726 = false
                local v727 = nil
                local v728
                if v_u_716 == nil then
                    v728 = v_u_701.Frame.ConfirmButton.Activated:Connect(function()
                        v_u_726 = true
                        v_u_17:FireServer("PurchaseSkinCrate", v_u_715)
                    end)
                else
                    v728 = v_u_701.Frame.Confirm1Button.Activated:Connect(function()
                        v_u_726 = true
                        if (not v_u_718 and true or not v_u_719.ArePaidRandomItemsRestricted) == true then
                            GiftPrompt("PurchaseSkinCrateNumber", "Skin Crate", v_u_716)
                        end
                    end)
                    v727 = v_u_701.Frame.Confirm2Button.Activated:Connect(function()
                        v_u_726 = true
                        if (not v_u_718 and true or not v_u_719.ArePaidRandomItemsRestricted) == true then
                            GiftPrompt("PurchaseSkinCrateNumber", "Skin Crate", v_u_716, true)
                        end
                    end)
                end
                local v729 = v_u_701.Frame.CancelButton.Activated:Connect(function()
                    v_u_726 = true
                end)
                repeat
                    task.wait()
                until v_u_726
                v728:Disconnect()
                if v727 then
                    v727:Disconnect()
                end
                v729:Disconnect()
                v_u_701.Visible = false
                v_u_714 = true
            end
        end
        local v_u_731 = {}
        local v_u_732 = {}
        local v_u_733 = nil
        local v_u_734 = false
        local v_u_735 = true
        local function v_u_738(p736)
            for v737 = 1, #v_u_731[p736] do
                if v_u_735 then
                    v_u_731[p736][v737].Visible = true
                elseif v_u_731[p736][v737].Preview.LockImageLabel.Visible then
                    v_u_731[p736][v737].Visible = false
                else
                    v_u_731[p736][v737].Visible = true
                end
            end
        end
        local function v_u_741(p739)
            if v_u_734 == false then
                v_u_734 = true
                if p739 == nil then
                    p739 = v_u_733
                    if p739 == nil then
                        v_u_734 = false
                        return
                    end
                end
                if p739 == "Trading" then
                    v_u_703.Skins.Contents.Entries.Visible = false
                    v_u_703.Skins.Contents.TradingEntry.Visible = true
                    v_u_703.Skins.Contents.ShopEntry.Visible = false
                    v_u_703.Header.Title.Text = "Trades Viewer"
                    v_u_703.Guns.Contents.Shop.UIStroke.Enabled = false
                elseif p739 == "Shop" then
                    v_u_703.Skins.Contents.Entries.Visible = false
                    v_u_703.Skins.Contents.TradingEntry.Visible = false
                    v_u_703.Skins.Contents.ShopEntry.Visible = true
                    v_u_703.Header.Title.Text = "Shop"
                    v_u_703.Guns.Contents.Trading.UIStroke.Enabled = false
                else
                    v_u_703.Skins.Contents.Entries.Visible = true
                    v_u_703.Skins.Contents.TradingEntry.Visible = false
                    v_u_703.Skins.Contents.ShopEntry.Visible = false
                    v_u_703.Header.Title.Text = string.gsub(string.gsub(p739, "%[", ""), "%]", "") .. " Skins"
                    v_u_703.Guns.Contents.Trading.UIStroke.Enabled = false
                    v_u_703.Guns.Contents.Shop.UIStroke.Enabled = false
                end
                if v_u_733 and (v_u_733 ~= "Trading" and v_u_733 ~= "Shop") then
                    for v740 = 1, #v_u_731[v_u_733] do
                        v_u_731[v_u_733][v740].Visible = false
                    end
                    v_u_703.Guns.Contents[v_u_733].UIStroke.Enabled = false
                end
                if p739 == "Trading" or p739 == "Shop" then
                    v_u_703.Header.SearchText.Visible = false
                else
                    v_u_703.Header.SearchText.Visible = true
                    v_u_738(p739)
                end
                v_u_703.Guns.Contents[p739].UIStroke.Enabled = true
                v_u_733 = p739
                v_u_734 = false
            end
        end
        v_u_703.Header.SearchText.Search.TextBox.FocusLost:Connect(function()
            if not v_u_734 then
                v_u_734 = true
                local v742 = v_u_703.Header.SearchText.Search.TextBox.Text:lower()
                if v_u_733 and (v_u_733 ~= "Trading" and v_u_733 ~= "Shop") then
                    for v743 = 1, #v_u_731[v_u_733] do
                        local v744 = v_u_731[v_u_733][v743].Name:lower() .. " " .. v_u_731[v_u_733][v743].SkinInfo.Container.SkinName.Text:lower()
                        if v742 == "" or string.match(v744, v742) then
                            v_u_731[v_u_733][v743].Visible = true
                        elseif v_u_731[v_u_733][v743].Visible then
                            v_u_731[v_u_733][v743].Visible = false
                        end
                    end
                end
                v_u_734 = false
            end
        end)
        local v_u_745 = false
        local function v_u_751()
            if not v_u_745 then
                v_u_745 = true
                local v_u_746 = false
                v_u_707.Inventory.TextLabel.Search.TextBox.FocusLost:connect(function()
                    if not v_u_746 then
                        v_u_746 = true
                        local v747 = v_u_707.Inventory.TextLabel.Search.TextBox.Text:lower()
                        for _, v748 in pairs(v_u_707.Inventory.Frame.ScrollingFrame:GetChildren()) do
                            if v748:IsA("Frame") then
                                local v749 = v748.Name:lower() .. " " .. v748.SkinInfo.Container.SkinName.Text:lower()
                                if v747 == "" or string.match(v749, v747) then
                                    v748.Visible = true
                                else
                                    v748.Visible = false
                                end
                            end
                        end
                        v_u_746 = false
                    end
                end)
                v_u_707.Buttons.Frame.Accept.Activated:Connect(function()
                    if not v_u_746 then
                        v_u_746 = true
                        if v_u_707.Buttons.Frame.Accept.Text == "Ready" then
                            v_u_17:FireServer("Trading", "Ready", "", "")
                        else
                            v_u_17:FireServer("Trading", "Confirm", "", "")
                        end
                        task.wait(0.25)
                        v_u_746 = false
                    end
                end)
                v_u_707.Buttons.Frame.Decline.Activated:Connect(function()
                    if not v_u_746 then
                        v_u_746 = true
                        v_u_17:FireServer("Trading", "Cancel", "", "")
                        v_u_746 = false
                    end
                end)
                v_u_707.Inventory.Chat.TextBox.FocusLost:Connect(function()
                    local v750 = v_u_707.Inventory.Chat.TextBox.Text
                    v_u_707.Inventory.Chat.TextBox.Text = ""
                    v_u_17:FireServer("Trading", "Chat", v750, "")
                end)
            end
        end
        function _G.ReadyTrade(p752, p753)
            if p752 == v_u_2 then
                if p753 then
                    v_u_707.Offer1.TextLabel.TextColor3 = Color3.new(0, 1, 0)
                    v_u_707.Buttons.Frame.Accept.Text = "CONFIRMED!"
                    _G.AddTradeChat(p752.Name .. " CONFIRMED!", Color3.new(0, 0.760784, 0))
                else
                    v_u_707.Offer1.TextLabel.TextColor3 = Color3.new(1, 1, 0)
                    _G.AddTradeChat(p752.Name .. " ready up!", Color3.new(1, 0.74902, 0.243137))
                    _G.AddTradeChat("[IMPORTANT 1]: DO NOT LEAVE AFTER TRADING! (WAIT A MINUTE)", Color3.new(1, 0, 0))
                    _G.AddTradeChat("[IMPORTANT 2]: TRADES ARE IRREVERSIBLE", Color3.new(1, 0, 0))
                end
            elseif p753 then
                v_u_707.Offer2.TextLabel.TextColor3 = Color3.new(0, 1, 0)
                _G.AddTradeChat(p752.Name .. " CONFIRMED!", Color3.new(0, 0.760784, 0))
            else
                v_u_707.Offer2.TextLabel.TextColor3 = Color3.new(1, 1, 0)
                _G.AddTradeChat(p752.Name .. " ready up!", Color3.new(1, 0.74902, 0.243137))
            end
            if v_u_707.Offer1.TextLabel.TextColor3 == Color3.new(1, 1, 0) and v_u_707.Offer2.TextLabel.TextColor3 == Color3.new(1, 1, 0) then
                v_u_707.Buttons.Frame.Accept.Text = "Confirm?"
            end
        end
        function _G.ClearTrades(p754)
            if not p754 then
                _G.Notification("Trade cancelled!")
            end
            v_u_707.Buttons.Frame.Accept.Text = "Ready"
            v_u_707.Offer1.TextLabel.TextColor3 = Color3.new(1, 1, 1)
            v_u_707.Offer2.TextLabel.TextColor3 = Color3.new(1, 1, 1)
            for _, v755 in pairs(v_u_707.Inventory.Frame.ScrollingFrame:GetChildren()) do
                if v755:IsA("Frame") then
                    v755:Destroy()
                end
            end
            for _, v756 in pairs(v_u_707.Offer1.Frame.ScrollingFrame:GetChildren()) do
                if v756:IsA("Frame") then
                    v756:Destroy()
                end
            end
            for _, v757 in pairs(v_u_707.Offer2.Frame.ScrollingFrame:GetChildren()) do
                if v757:IsA("Frame") then
                    v757:Destroy()
                end
            end
            for _, v758 in pairs(v_u_707.Inventory.Chat.ScrollingFrame:GetChildren()) do
                if v758:IsA("TextLabel") and v758.Name ~= "TextTemplate" then
                    v758:Destroy()
                end
            end
            v_u_703.Visible = true
            v_u_707.Visible = false
        end
        function _G.AddTradeChat(p759, p760)
            local v761 = v_u_707.Inventory.Chat.ScrollingFrame.TextTemplate:Clone()
            v761.Visible = true
            v761.Text = p759
            v761.Name = "TEXT"
            v761.TextColor3 = p760 or Color3.new(0, 0, 0)
            v761.Parent = v_u_707.Inventory.Chat.ScrollingFrame
            v_u_707.Inventory.Chat.ScrollingFrame.CanvasPosition = Vector2.new(0, v_u_707.Inventory.Chat.ScrollingFrame.AbsoluteCanvasSize.y)
        end
        local function v_u_782(p762, p763)
            local v764 = v_u_690[p762][p763]
            local v765 = v_u_706.Contents.Entries.SkinEntryTemplate:Clone()
            v765.Name = p762 .. p763
            v765.Visible = true
            v765.SkinInfo.Container.Rarity.Text = v764.Rarity
            v765.SkinInfo.Container.SkinName.Text = v764.DisplayName or p763
            v765.SkinInfo.Container.Rarity.TextColor3 = v_u_710(v764.Rarity, v764.BorderColor)
            v765.UIStroke.UIGradient.Color = v_u_713(v764.Rarity, v764.BorderColor)
            local v766 = Instance.new("ViewportFrame")
            v766.Size = UDim2.new(1, 0, 1, 0)
            v766.BackgroundTransparency = 0
            v766.Ambient = Color3.new(1, 1, 1)
            v766.LightColor = Color3.new(1, 1, 1)
            local v767
            if p762 == "[Knife]" then
                v767 = v_u_693.Default:Clone()
            elseif p762 == "[Vehicle]" then
                v767 = game.ReplicatedStorage:WaitForChild("Bike").Skins:WaitForChild(p763):Clone()
            elseif p762 == "[House]" then
                v767 = v_u_695:WaitForChild(p763):Clone()
            elseif p762 == "[Mask]" then
                v767 = v_u_694:WaitForChild(p763):Clone()
            elseif p762 == "[Wallet]" then
                v767 = v_u_696:WaitForChild(p763):Clone()
            elseif p762 == "[Bat]" then
                v767 = v_u_697:WaitForChild(p763):Clone()
            else
                v767 = v_u_692[p762]:Clone()
            end
            v767.Parent = v766
            local v768
            if v767:IsA("Model") then
                v768 = v767.PrimaryPart or v767
            else
                v768 = v767
            end
            if p762 == "[Knife]" then
                local v769 = v_u_693[p763]:Clone()
                v767.CFrame = v769.CFrame * v764.CFrame:inverse()
                local v770 = Instance.new("Weld")
                v770.Part0 = v767
                v770.Part1 = v769
                v770.C0 = v764.CFrame
                v770.Parent = v769
                v767.Transparency = 1
                v769.Parent = v767
            elseif p762 == "[Bat]" then
                local v771 = v_u_697[p763]:Clone()
                v767.CFrame = v771.CFrame * v764.CFrame:inverse()
                local v772 = Instance.new("Weld")
                v772.Part0 = v767
                v772.Part1 = v771
                v772.C0 = v764.CFrame
                v772.Parent = v771
                v767.Transparency = 1
                v771.Parent = v767
            elseif p762 ~= "[Mask]" and (p762 ~= "[Vehicle]" and (p762 ~= "[House]" and p762 ~= "[Wallet]")) then
                local v773 = v764.TextureID
                if type(v773) == "string" then
                    v768.TextureID = v764.TextureID
                else
                    v768.Transparency = 1
                    local v774 = v764.TextureID:Clone()
                    v768.CFrame = v774.CFrame * v764.CFrame:inverse()
                    local v775 = Instance.new("WeldConstraint")
                    v775.Part0 = v768
                    v775.Part1 = v774
                    v775.Parent = v774
                    v774.Parent = v768
                end
            end
            local v776 = v768.CFrame:ToObjectSpace(CFrame.new(v768.CFrame.p + Vector3.new(0.9, 0.9, 0.9) * v768.Size.magnitude * 0.4, v768.CFrame.p))
            if p762 == "[Mask]" then
                v776 = v776 * CFrame.new(0, 0, 1.5)
            elseif p762 == "[House]" then
                v776 = v776 * CFrame.new(0, 2, 35)
            end
            local v777 = Instance.new("Camera")
            local v778 = CFrame.new
            local v779 = v768.CFrame.p
            local v780 = Vector3.new(0.9, 0.9, 0.9)
            local v781
            if p762 == "[House]" then
                v781 = v768.Size.magnitude * 0.8
            else
                v781 = v768.Size.magnitude * 0.4
            end
            v777.CFrame = v778(v779 + v780 * v781, v768.CFrame.p)
            v777.Parent = v766
            v766.CurrentCamera = v777
            v766.BackgroundTransparency = 1
            v766.Parent = v765.Preview.Frame
            return v765, v777, v768, v776
        end
        local function v800(p783, p_u_784, p_u_785, p786)
            local v787
            if p783 == v_u_2 then
                v787 = v_u_707.Offer1.Frame.ScrollingFrame
            else
                v787 = v_u_707.Offer2.Frame.ScrollingFrame
            end
            if p786 == 0 then
                if v787:FindFirstChild(p_u_784 .. p_u_785) then
                    v787[p_u_784 .. p_u_785]:Destroy()
                end
                return
            elseif v787:FindFirstChild(p_u_784 .. p_u_785) == nil then
                local v788, v_u_789, v_u_790, v_u_791 = v_u_782(p_u_784, p_u_785)
                v788.SkinInfo.Container.SkinName.Text = string.gsub(string.gsub(p_u_784, "%[", ""), "%]", "") .. "/" .. v788.SkinInfo.Container.SkinName.Text
                local v792 = Instance.new("TextLabel")
                v792.Name = "AmountValue"
                v792.Text = "x" .. p786
                v792.TextColor3 = Color3.new(1, 1, 1)
                v792.TextStrokeTransparency = 0
                v792.TextStrokeColor3 = Color3.new(0, 0, 0)
                v792.Size = UDim2.new(0.4, 0, 0.4, 0)
                v792.Position = UDim2.new(0.01, 0, 0, 0)
                v792.Font = Enum.Font.Oswald
                v792.TextScaled = true
                v792.BackgroundTransparency = 1
                v792.Visible = true
                v792.Parent = v788.Preview
                v788.Parent = v787
                local v_u_793 = false
                v788.MouseEnter:Connect(function()
                    v_u_793 = true
                    while v_u_793 do
                        v_u_789.CFrame = v_u_789.CFrame:Lerp(v_u_790.CFrame * CFrame.Angles(0, tick() * 0.5 % 3.141592653589793 * 2, 0) * v_u_791, 0.25)
                        task.wait()
                    end
                    local v794 = v_u_789
                    local v795 = CFrame.new
                    local v796 = v_u_790.CFrame.p
                    local v797 = Vector3.new(0.9, 0.9, 0.9)
                    local v798 = v_u_790
                    local v799
                    if p_u_784 == "[House]" then
                        v799 = v798.Size.magnitude * 0.8
                    else
                        v799 = v798.Size.magnitude * 0.4
                    end
                    v794.CFrame = v795(v796 + v797 * v799, v_u_790.CFrame.p)
                end)
                v788.MouseLeave:Connect(function()
                    v_u_793 = false
                end)
                v788.Button.Activated:Connect(function()
                    v_u_17:FireServer("Trading", "Remove", p_u_784, p_u_785)
                end)
            else
                v787[p_u_784 .. p_u_785].Preview.AmountValue.Text = "x" .. p786
            end
        end
        _G.AddSkinToTradingView = v800
        local function v824(p_u_801)
            v_u_751()
            for _, v802 in pairs(v_u_707.Inventory.Frame.ScrollingFrame:GetChildren()) do
                if v802:IsA("Frame") then
                    v802:Destroy()
                end
            end
            v_u_703.Visible = false
            v_u_707.Visible = true
            v_u_707.Offer1.TextLabel.Text = "@" .. v_u_2.Name
            v_u_707.Offer1.TextLabel2.Text = "ID: " .. v_u_2.UserId
            v_u_707.Offer1.TextLabel2.TextColor3 = v_u_3.ComputeUserColor(v_u_2.UserId)
            v_u_707.Offer2.TextLabel.Text = "@" .. p_u_801.Name
            v_u_707.Offer2.TextLabel2.Text = "ID: " .. p_u_801.UserId
            v_u_707.Offer2.TextLabel2.TextColor3 = v_u_3.ComputeUserColor(p_u_801.UserId)
            task.spawn(function()
                local v803 = tick()
                local v804 = game.Players:GetUserThumbnailAsync(v_u_2.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180)
                local v805 = game.Players:GetUserThumbnailAsync(p_u_801.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180)
                if tick() - v803 < 10 then
                    v_u_707.Offer1.ImageLabel.Image = v804
                    v_u_707.Offer2.ImageLabel.Image = v805
                end
            end)
            local v806 = v_u_2:WaitForChild("DataFolder"):FindFirstChild("Skins")
            if v806 then
                local v807 = game:GetService("HttpService"):JSONDecode(v806.Value)
                for v_u_808, v809 in pairs(v807) do
                    for v_u_810, v811 in pairs(v809) do
                        if v811 > 0 then
                            local _ = v_u_690[v_u_808][v_u_810]
                            local v812, v_u_813, v_u_814, v_u_815 = v_u_782(v_u_808, v_u_810)
                            local v816 = Instance.new("TextLabel")
                            v816.Name = "AmountValue"
                            v816.Text = "x" .. v811
                            v816.TextColor3 = Color3.new(1, 1, 1)
                            v816.TextStrokeTransparency = 0
                            v816.TextStrokeColor3 = Color3.new(0, 0, 0)
                            v816.Size = UDim2.new(0.4, 0, 0.4, 0)
                            v816.Position = UDim2.new(0.01, 0, 0, 0)
                            v816.Font = Enum.Font.Oswald
                            v816.TextScaled = true
                            v816.BackgroundTransparency = 1
                            v816.Visible = true
                            v816.Parent = v812.Preview
                            v812.Parent = v_u_707.Inventory.Frame.ScrollingFrame
                            local v_u_817 = false
                            v812.MouseEnter:Connect(function()
                                v_u_817 = true
                                while v_u_817 do
                                    v_u_813.CFrame = v_u_813.CFrame:Lerp(v_u_814.CFrame * CFrame.Angles(0, tick() * 0.5 % 3.141592653589793 * 2, 0) * v_u_815, 0.25)
                                    task.wait()
                                end
                                local v818 = v_u_813
                                local v819 = CFrame.new
                                local v820 = v_u_814.CFrame.p
                                local v821 = Vector3.new(0.9, 0.9, 0.9)
                                local v822 = v_u_814
                                local v823
                                if v_u_808 == "[House]" then
                                    v823 = v822.Size.magnitude * 0.8
                                else
                                    v823 = v822.Size.magnitude * 0.4
                                end
                                v818.CFrame = v819(v820 + v821 * v823, v_u_814.CFrame.p)
                            end)
                            v812.MouseLeave:Connect(function()
                                v_u_817 = false
                            end)
                            v812.Button.Activated:Connect(function()
                                v_u_17:FireServer("Trading", "Add", v_u_808, v_u_810)
                            end)
                        end
                    end
                end
            end
        end
        _G.LoadTradingInventory = v824
        function _G.AddTradingRequest(p_u_825)
            if not v_u_703.Skins.Contents.TradingEntry:FindFirstChild(p_u_825.Name) then
                local v_u_826 = v_u_703.Skins.Contents.TradingEntry.EntryTemplate:Clone()
                v_u_826.Visible = true
                v_u_826.Name = p_u_825.Name
                v_u_826.TextLabel.Text = "@" .. p_u_825.Name
                v_u_826.TextLabel2.Text = "ID: " .. p_u_825.UserId
                v_u_826.TextLabel2.TextColor3 = v_u_3.ComputeUserColor(p_u_825.UserId)
                v_u_826.Parent = v_u_703.Skins.Contents.TradingEntry
                task.spawn(function()
                    local v827 = game.Players:GetUserThumbnailAsync(p_u_825.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180)
                    if v_u_826 then
                        v_u_826.ImageLabel.Image = v827
                    end
                end)
                v_u_826.Accept.Activated:Connect(function()
                    if not v_u_718 and true or (v_u_719.IsPaidItemTradingAllowed and true or false) then
                        v_u_17:FireServer("Trading", "Accept", p_u_825)
                    else
                        _G.Notification("Trading policy restricted you from trading!")
                    end
                    v_u_826:Destroy()
                end)
                v_u_826.Decline.Activated:Connect(function()
                    v_u_826:Destroy()
                end)
            end
        end
        local v828 = v705.Contents.GunEntry:Clone()
        v828.Visible = true
        v828.Container.Preview.Image = "rbxassetid://100508832197286"
        v828.Container.Info.WeaponName.Text = "Shop"
        v828.Container.Info.AvailableCount.Text = "LIMITED TIME"
        v828.Name = "Shop"
        local v829 = Instance.new("ImageLabel")
        v829.Position = UDim2.new(0.718, 0, 0, 0)
        v829.Size = UDim2.new(0.316, 0, 0.444, 0)
        v829.Image = "rbxassetid://109219151737345"
        v829.BackgroundTransparency = 1
        v829.Parent = v828
        local v830 = Instance.new("UIGradient")
        v830.Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(1, 1, 1))
        v830.Parent = v828
        v828.Parent = v705.Contents
        v828.Button.Activated:Connect(function()
            v_u_741("Shop")
        end)
        local v831 = v705.Contents.GunEntry:Clone()
        v831.Visible = true
        v831.Container.Preview.Image = "rbxassetid://13458181164"
        v831.Container.Info.WeaponName.Text = "Trading"
        v831.Container.Info.AvailableCount.Text = "View Trades"
        v831.Name = "Trading"
        v831.Parent = v705.Contents
        v831.Button.Activated:Connect(function()
            v_u_741("Trading")
        end)
        local v_u_832 = false
        if v_u_718 and not v_u_719.IsPaidItemTradingAllowed then
            v_u_703.Skins.Contents.TradingEntry["[RequestTemplate]"].TextBox.TextEditable = false
            v_u_703.Skins.Contents.TradingEntry["[RequestTemplate]"].TextBox.PlaceholderText = "UNABLE TO TRADE: Region Trade Policy"
            v_u_703.Skins.Contents.TradingEntry["[RequestTemplate]"].TextBox.PlaceholderColor3 = Color3.new(1, 0, 0)
        end
        v_u_703.Skins.Contents.TradingEntry["[RequestTemplate]"].TextBox.FocusLost:Connect(function()
            if not v_u_832 then
                v_u_832 = true
                local v833 = v_u_703.Skins.Contents.TradingEntry["[RequestTemplate]"].TextBox
                local v834 = v833.Text
                v833.TextEditable = false
                local v835 = game.Players:FindFirstChild(v834)
                if v835 and (v835.Character and v835.Character:FindFirstChild("HumanoidRootPart")) then
                    if (v835.Character.HumanoidRootPart.Position - v_u_5.HumanoidRootPart.Position).magnitude < 100 then
                        v833.Text = "Sent request to: " .. v834
                        v833.TextColor3 = Color3.new(0, 1, 0)
                        v_u_17:FireServer("Trading", "Request", v835)
                    else
                        v833.Text = v834 .. " is not in range!"
                        v833.TextColor3 = Color3.new(1, 0, 0)
                    end
                    task.wait(1)
                else
                    v833.TextColor3 = Color3.new(1, 0, 0)
                    v833.Text = "Couldn\'t find player!"
                    task.wait(1)
                end
                v833.TextColor3 = Color3.new(1, 1, 1)
                v833.Text = ""
                v833.TextEditable = true
                v_u_832 = false
            end
        end)
        local v836 = v705.Contents.GunEntry:Clone()
        v836.Visible = true
        v836.Name = "[Vehicle]"
        v836.Parent = v705.Contents
        local v837 = v705.Contents.GunEntry:Clone()
        v837.Visible = true
        v837.Name = "[House]"
        v837.Parent = v705.Contents
        local v_u_838 = v_u_735
        local v_u_839 = v_u_715
        local v_u_840 = v_u_714
        local v_u_841 = v_u_716
        for v_u_842, v843 in pairs(v_u_690) do
            v_u_731[v_u_842] = {}
            local v844 = 0
            local v845 = {
                ["Name"] = v_u_842,
                ["Skins"] = {},
                ["CrateNumSkins"] = {}
            }
            for v_u_846, v_u_847 in pairs(v843) do
                v844 = v844 + 1
                local v848, v_u_849, v_u_850, v_u_851 = v_u_782(v_u_842, v_u_846)
                v848.Visible = false
                v848.Parent = v_u_706.Contents.Entries
                local v_u_852 = false
                v848.MouseEnter:Connect(function()
                    v_u_852 = true
                    while v_u_852 do
                        v_u_849.CFrame = v_u_849.CFrame:Lerp(v_u_850.CFrame * CFrame.Angles(0, tick() * 0.5 % 3.141592653589793 * 2, 0) * v_u_851, 0.25)
                        task.wait()
                    end
                    local v853 = v_u_849
                    local v854 = CFrame.new
                    local v855 = v_u_850.CFrame.p
                    local v856 = Vector3.new(0.9, 0.9, 0.9)
                    local v857 = v_u_850
                    local v858
                    if v_u_842 == "[House]" then
                        v858 = v857.Size.magnitude * 0.8
                    else
                        v858 = v857.Size.magnitude * 0.4
                    end
                    v853.CFrame = v854(v855 + v856 * v858, v_u_850.CFrame.p)
                end)
                v848.MouseLeave:Connect(function()
                    v_u_852 = false
                end)
                local v_u_859 = Instance.new("ImageLabel")
                v_u_859.Name = "LockImageLabel"
                v_u_859.Image = v_u_847.Crate == nil and "rbxassetid://5743022869" or "rbxassetid://9546076937"
                v_u_859.Size = UDim2.new(0.4, 0, 0.4, 0)
                v_u_859.BackgroundTransparency = 1
                v_u_859.Position = UDim2.new(0.6, 0, 0.6, 0)
                v_u_859.ImageColor3 = Color3.new(0.807843, 0.203922, 0.203922)
                v_u_859.Parent = v848.Preview
                local v860 = Instance.new("TextLabel")
                v860.Name = "Equipped"
                v860.Text = "E"
                v860.TextColor3 = Color3.new(0.321569, 1, 0.490196)
                v860.TextStrokeTransparency = 0
                v860.TextStrokeColor3 = Color3.new(0, 0, 0)
                v860.Size = UDim2.new(0.4, 0, 0.4, 0)
                v860.Position = UDim2.new(0.6, 0, 0.6, 0)
                v860.Font = Enum.Font.Oswald
                v860.TextScaled = true
                v860.BackgroundTransparency = 1
                v860.Visible = false
                v860.Parent = v848.Preview
                local v861 = Instance.new("TextLabel")
                v861.Name = "AmountValue"
                v861.Text = "x0"
                v861.TextColor3 = Color3.new(1, 1, 1)
                v861.TextStrokeTransparency = 0
                v861.TextStrokeColor3 = Color3.new(0, 0, 0)
                v861.Size = UDim2.new(0.4, 0, 0.4, 0)
                v861.Position = UDim2.new(0.01, 0, 0, 0)
                v861.Font = Enum.Font.Oswald
                v861.TextScaled = true
                v861.BackgroundTransparency = 1
                v861.Visible = false
                v861.Parent = v848.Preview
                if v_u_847.Crate == 2 then
                    v_u_859.Image = "rbxassetid://10597737967"
                elseif v_u_847.Crate == 3 then
                    v_u_859.Image = "rbxassetid://11710426402"
                end
                v848.Button.Activated:Connect(function()
                    if v_u_859.Visible then
                        if v_u_847.Rarity == "Exclusive" then
                            return
                        end
                        v_u_841 = v_u_847.Crate
                        if v_u_840 then
                            v_u_730()
                            return
                        end
                    else
                        v_u_17:FireServer("EquipWeaponSkins", v_u_842, v_u_846)
                    end
                end)
                v848.SkinInfo.Container.SellButton.Activated:Connect(function()
                    v_u_730({ v_u_842, v_u_846 })
                end)
                local v862 = v_u_731[v_u_842]
                table.insert(v862, v848)
                if v_u_847.Rarity ~= "Exclusive" then
                    if v_u_847.Crate == nil then
                        local v863 = v845.Skins
                        local v864 = {
                            ["Name"] = v_u_846,
                            ["TextureID"] = v_u_847.TextureID,
                            ["Rarity"] = v_u_847.Rarity,
                            ["CFrame"] = v_u_847.CFrame,
                            ["BorderColor"] = v_u_847.BorderColor
                        }
                        table.insert(v863, v864)
                    else
                        local v865 = v845.CrateNumSkins
                        local v866 = v_u_847.Crate
                        if v865[tostring(v866)] == nil then
                            local v867 = v845.CrateNumSkins
                            local v868 = v_u_847.Crate
                            v867[tostring(v868)] = {}
                        end
                        local v869 = v845.CrateNumSkins
                        local v870 = v_u_847.Crate
                        local v871 = v869[tostring(v870)]
                        local v872 = {
                            ["Name"] = v_u_846,
                            ["TextureID"] = v_u_847.TextureID,
                            ["Rarity"] = v_u_847.Rarity,
                            ["CFrame"] = v_u_847.CFrame,
                            ["BorderColor"] = v_u_847.BorderColor
                        }
                        table.insert(v871, v872)
                    end
                end
            end
            table.insert(v_u_732, v845)
            local v873 = v705.Contents:FindFirstChild(v_u_842) or v705.Contents.GunEntry:Clone()
            v873.Visible = true
            v873.Container.Preview.Image = v691[v_u_842]
            v873.Container.Info.WeaponName.Text = string.gsub(string.gsub(v_u_842, "%[", ""), "%]", "")
            v873.Container.Info.AvailableCount.Text = v844 .. " available"
            v873.Name = v_u_842
            v873.Parent = v705.Contents
            v873.Button.Activated:Connect(function()
                v_u_741(v_u_842)
            end)
        end
        function UpdateSkinUnlock()
            local v874 = v_u_2:WaitForChild("DataFolder")
            local v875 = v874:FindFirstChild("Skins")
            if v875 then
                local v876 = game:GetService("HttpService"):JSONDecode(v875.Value)
                for v877, v878 in pairs(v876) do
                    for v879, v880 in pairs(v878) do
                        if v_u_706.Contents.Entries:FindFirstChild(v877 .. v879) then
                            if v880 > 0 then
                                v_u_706.Contents.Entries:FindFirstChild(v877 .. v879).Preview.LockImageLabel.Visible = false
                                v_u_706.Contents.Entries:FindFirstChild(v877 .. v879).Preview.AmountValue.Text = "x" .. v880
                                v_u_706.Contents.Entries:FindFirstChild(v877 .. v879).Preview.AmountValue.Visible = true
                                v_u_706.Contents.Entries:FindFirstChild(v877 .. v879).SkinInfo.Container.SellButton.Visible = true
                            else
                                v_u_706.Contents.Entries:FindFirstChild(v877 .. v879).Preview.LockImageLabel.Visible = true
                                v_u_706.Contents.Entries:FindFirstChild(v877 .. v879).Preview.AmountValue.Visible = false
                                v_u_706.Contents.Entries:FindFirstChild(v877 .. v879).SkinInfo.Container.SellButton.Visible = false
                            end
                        end
                    end
                end
                if v_u_240 then
                    v_u_240:setSkins((v_u_192(v876, (v_u_9:JSONDecode(v_u_2.DataFolder.Information.HouseSave.Value)))))
                end
            end
            local v881 = v874.Information:FindFirstChild("EquipSkins")
            if v881 then
                local v882 = game:GetService("HttpService"):JSONDecode(v881.Value)
                for v883, v884 in pairs(v882) do
                    for v885 = 1, #v_u_731[v883] do
                        v_u_731[v883][v885].Preview.Equipped.Visible = false
                    end
                    if v884 ~= false then
                        v_u_706.Contents.Entries:FindFirstChild(v883 .. v884).Preview.Equipped.Visible = true
                    end
                end
            end
        end
        UpdateSkinUnlock()
        local function v_u_941(p886, p887, p888)
            v_u_703.Visible = false
            v_u_704.Crate.ViewportFrame:ClearAllChildren()
            local v889 = Instance.new("WorldModel")
            v889.Parent = v_u_704.Crate.ViewportFrame
            local v890
            if tonumber(p888) then
                v890 = game.ReplicatedStorage.SkinModules.Crate2:Clone()
            else
                v890 = game.ReplicatedStorage.SkinModules.Crate:Clone()
            end
            v890.Parent = v889
            local v891 = Instance.new("Camera")
            v891.CFrame = CFrame.new(v890.HumanoidRootPart.Position + v890.HumanoidRootPart.CFrame.LookVector * 5 + v890.HumanoidRootPart.CFrame.UpVector * 4, v890.HumanoidRootPart.Position)
            v891.Parent = v_u_704.Crate.ViewportFrame
            v891.FieldOfView = 50
            v_u_704.Crate.ViewportFrame.CurrentCamera = v891
            local v892 = v890.AnimationController.Animator:LoadAnimation(v890.AnimationController.IdleAnimation)
            local v893 = v890.AnimationController.Animator:LoadAnimation(v890.AnimationController.OpenAnimation)
            v892:Play()
            local v894 = script.SpinSound:Clone()
            v894.Parent = script
            v894.Volume = 0
            v894:Play()
            local v895 = v_u_698:Create(v894, TweenInfo.new(0.8, Enum.EasingStyle.Linear), {
                ["Volume"] = 0.5
            })
            v895:Play()
            local v896 = {}
            local v897 = nil
            for v898 = 1, 30 do
                local v899 = nil
                local v900 = nil
                if p888 then
                    if p888 == "Unlock" then
                        v900 = {
                            ["Name"] = p887,
                            ["TextureID"] = v_u_690[p886][p887].TextureID,
                            ["Rarity"] = v_u_690[p886][p887].Rarity,
                            ["CFrame"] = v_u_690[p886][p887].CFrame,
                            ["BorderColor"] = v_u_690[p886][p887].BorderColor
                        }
                        v899 = {
                            ["Name"] = p886
                        }
                    end
                    if tonumber(p888) then
                        v899 = v_u_732[math.random(#v_u_732)]
                        if not v899.CrateNumSkins[tostring(p888)] then
                            for v901 = 1, #v_u_732 do
                                if v_u_732[v901].CrateNumSkins[tostring(p888)] then
                                    v899 = v_u_732[v901]
                                    break
                                end
                            end
                        end
                        local v902 = math.random(#v899.CrateNumSkins[tostring(p888)])
                        v900 = v899.CrateNumSkins[tostring(p888)][v902]
                    end
                else
                    v899 = v_u_732[math.random(#v_u_732)]
                    if #v899.Skins <= 0 and #v899.Skins <= 0 then
                        for v903 = 1, #v_u_732 do
                            if #v_u_732[v903].Skins > 0 then
                                v899 = v_u_732[v903]
                                break
                            end
                        end
                    end
                    local v904 = math.random(#v899.Skins)
                    v900 = v899.Skins[v904]
                end
                if v898 == 18 then
                    v900 = {
                        ["Name"] = p887,
                        ["TextureID"] = v_u_690[p886][p887].TextureID,
                        ["Rarity"] = v_u_690[p886][p887].Rarity,
                        ["CFrame"] = v_u_690[p886][p887].CFrame,
                        ["BorderColor"] = v_u_690[p886][p887].BorderColor
                    }
                    v899 = {
                        ["Name"] = p886
                    }
                end
                local v905 = v_u_704.Entries.Container.Contents.SkinEntryTemplate:Clone()
                v905.Visible = true
                v905.SkinInfo.Container.Rarity.Text = v900.Rarity
                v905.SkinInfo.Container.Rarity.TextColor3 = v_u_710(v900.Rarity, v900.BorderColor)
                v905.SkinInfo.Container.SkinName.Text = v_u_690[v899.Name][v900.Name].DisplayName or v900.Name
                v905.UIStroke.UIGradient.Color = v_u_713(v900.Rarity, v900.BorderColor)
                local v906 = Instance.new("ViewportFrame")
                v906.Size = UDim2.new(1, 0, 1, 0)
                v906.BackgroundTransparency = 0
                v906.Ambient = Color3.new(1, 1, 1)
                v906.LightColor = Color3.new(1, 1, 1)
                local v907
                if v899.Name == "[Knife]" then
                    v907 = v_u_693.Default:Clone()
                elseif v899.Name == "[Mask]" then
                    v907 = v_u_694:WaitForChild(v900.Name):Clone()
                elseif v899.Name == "[Vehicle]" then
                    v907 = game.ReplicatedStorage:WaitForChild("Bike").Skins:WaitForChild(v900.Name):Clone()
                elseif v899.Name == "[House]" then
                    v907 = v_u_695:WaitForChild(v900.Name):Clone()
                elseif v899.Name == "[Wallet]" then
                    v907 = v_u_696:WaitForChild(v900.Name):Clone()
                elseif v899.Name == "[Bat]" then
                    v907 = v_u_697:WaitForChild(v900.Name):Clone()
                else
                    v907 = v_u_692[v899.Name]:Clone()
                end
                v907.Parent = v906
                local v908
                if v907:IsA("Model") then
                    v908 = v907.PrimaryPart or v907
                else
                    v908 = v907
                end
                if v899.Name == "[Knife]" then
                    local v909 = v_u_693[v900.Name]:Clone()
                    v909.CFrame = v907.CFrame * v900.CFrame
                    local v910 = Instance.new("Weld")
                    v910.Part0 = v907
                    v910.Part1 = v909
                    v910.C0 = v900.CFrame
                    v910.Parent = v909
                    v907.Transparency = 1
                    v909.Parent = v907
                elseif v899.Name ~= "[Mask]" and (v899.Name ~= "[Vehicle]" and (v899.Name ~= "[House]" and v899.Name ~= "[Wallet]")) then
                    local v911 = v900.TextureID
                    if type(v911) == "string" then
                        v908.TextureID = v900.TextureID
                    else
                        v908.Transparency = 1
                        local v912 = v900.TextureID:Clone()
                        v912.CFrame = v908.CFrame * v900.CFrame
                        local v913 = Instance.new("WeldConstraint")
                        v913.Part0 = v908
                        v913.Part1 = v912
                        v913.Parent = v912
                        v912.Parent = v908
                    end
                end
                v908.CFrame:ToObjectSpace(CFrame.new(v908.CFrame.p + Vector3.new(0.9, 0.9, 0.9) * v908.Size.magnitude * 0.4, v908.CFrame.p))
                local v914 = Instance.new("Camera")
                local v915 = CFrame.new
                local v916 = v908.CFrame.p
                local v917 = Vector3.new(0.9, 0.9, 0.9)
                local v918
                if v899.Name == "[House]" then
                    v918 = v908.Size.magnitude * 0.8
                else
                    v918 = v908.Size.magnitude * 0.4
                end
                v914.CFrame = v915(v916 + v917 * v918, v908.CFrame.p)
                v914.Parent = v906
                v906.CurrentCamera = v914
                v906.BackgroundTransparency = 1
                v906.Parent = v905.Preview
                v905.Parent = v_u_704.Entries.Container.Contents
                table.insert(v896, v905)
                if v898 == 18 then
                    v897 = v905
                end
            end
            v_u_704.Visible = true
            local v_u_919 = false
            local v920 = v_u_704.Skip.Activated:Connect(function()
                v_u_919 = true
            end)
            local v921 = v_u_704.Entries.Container.Contents.AbsoluteSize
            local v922 = v_u_698:Create(v_u_704.Entries.Container.Contents, TweenInfo.new(3, Enum.EasingStyle.Quad), {
                ["Position"] = UDim2.new(0, -v921.X * 0.5 + v897.AbsoluteSize.X * 0.5, 0, 0)
            })
            v922:Play()
            local v923 = v_u_919
            local v924 = 0
            while v924 < 3 and v923 == false do
                v924 = v924 + task.wait()
            end
            v920:Disconnect()
            if v923 then
                v922:Cancel()
            else
                task.wait(0.6)
            end
            if v895.PlaybackState == Enum.PlaybackState.Playing then
                v895:Cancel()
            end
            v_u_698:Create(v894, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
                ["Volume"] = 0
            }):Play()
            v_u_698:Create(v_u_704.Entries, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
                ["Size"] = UDim2.new(1, 0, 0, 0)
            }):Play()
            v_u_698:Create(v_u_704.Crate, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
                ["Size"] = UDim2.new(1, 0, 0.822, 0)
            }):Play()
            task.wait(0.4)
            v894:Destroy()
            v_u_704.Entries.Visible = false
            v_u_698:Create(v891, TweenInfo.new(0.75, Enum.EasingStyle.Bounce), {
                ["FieldOfView"] = 70,
                ["CFrame"] = CFrame.new(v890.HumanoidRootPart.Position + v890.HumanoidRootPart.CFrame.LookVector * 8 + v890.HumanoidRootPart.CFrame.UpVector * 8, v890.HumanoidRootPart.Position)
            }):Play()
            local v925
            if p886 == "[Knife]" then
                v925 = v_u_693.Default:Clone()
            elseif p886 == "[Mask]" then
                v925 = v_u_694:WaitForChild(p887):Clone()
            elseif p886 == "[Vehicle]" then
                v925 = game.ReplicatedStorage:WaitForChild("Bike").Skins:WaitForChild(p887):Clone()
            elseif p886 == "[House]" then
                v925 = v_u_695:WaitForChild(p887):Clone()
            elseif p886 == "[Wallet]" then
                v925 = v_u_696:WaitForChild(p887):Clone()
            elseif p886 == "[Bat]" then
                v925 = v_u_697:WaitForChild(p887):Clone()
            else
                v925 = v_u_692[p886]:Clone()
            end
            v925.Parent = v889
            local v926
            if v925:IsA("Model") then
                v926 = v925.PrimaryPart or v925
            else
                v926 = v925
            end
            if p886 == "[Knife]" then
                local v927 = v_u_693[p887]:Clone()
                v927.CFrame = v925.CFrame * v_u_690[p886][p887].CFrame
                local v928 = Instance.new("Weld")
                v928.Part0 = v925
                v928.Part1 = v927
                v928.C0 = v_u_690[p886][p887].CFrame
                v928.Parent = v927
                v925.Transparency = 1
                v927.Parent = v925
            else
                if p886 ~= "[Mask]" and (p886 ~= "[Vehicle]" and (p886 ~= "[House]" and p886 ~= "[Wallet]")) then
                    local v929 = v_u_690[p886][p887].TextureID
                    if type(v929) == "string" then
                        v926.TextureID = v_u_690[p886][p887].TextureID
                    else
                        v926.Transparency = 1
                        local v930 = v_u_690[p886][p887].TextureID:Clone()
                        v930.CFrame = v926.CFrame * v_u_690[p886][p887].CFrame
                        local v931 = Instance.new("WeldConstraint")
                        v931.Part0 = v926
                        v931.Part1 = v930
                        v931.Parent = v930
                        v930.Parent = v926
                    end
                end
                if p886 == "[Vehicle]" or p886 == "[House]" then
                    for _, v932 in pairs(v925:GetDescendants()) do
                        if v932:IsA("BasePart") and v932 ~= v925.PrimaryPart then
                            v932.Anchored = false
                            local v933 = Instance.new("WeldConstraint")
                            v933.Part0 = v925.PrimaryPart
                            v933.Part1 = v932
                            v933.Parent = v932
                        end
                    end
                end
            end
            local v934 = v926.Size
            v926.Size = Vector3.new(0, 0, 0)
            v926.CFrame = v890.HumanoidRootPart.CFrame
            v892:Stop()
            v893:Play()
            task.wait(0.5)
            v_u_698:Create(v926, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
                ["CFrame"] = v926.CFrame + Vector3.new(0, 4, 0),
                ["Size"] = v934
            }):Play()
            script.OpenSound:Play()
            task.wait(0.5)
            v893:AdjustSpeed(0)
            local v935 = v_u_704.ATitle
            local v936 = p886 .. " " .. (v_u_690[p886][p887].DisplayName or p887)
            v935.Text = string.gsub(string.gsub(v936, "%[", ""), "%]", "")
            v_u_704.ATitle.TextColor3 = v_u_710(v_u_690[p886][p887].Rarity, v_u_690[p886][p887].BorderColor)
            v_u_704.Skip.Text = "CLOSE"
            task.wait(0.3)
            v_u_698:Create(v891, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
                ["CFrame"] = CFrame.new((v926.CFrame * CFrame.new(0, 0, -v934.magnitude)).p, v926.Position)
            }):Play()
            for _, v937 in pairs(v890:GetChildren()) do
                if v937:IsA("BasePart") and v937.Name ~= "HumanoidRootPart" then
                    v_u_698:Create(v937, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
                        ["Transparency"] = 1
                    }):Play()
                end
            end
            task.wait(0.2)
            local v_u_938 = false
            local v939 = v_u_704.Skip.Activated:Connect(function()
                v_u_938 = true
            end)
            while v_u_938 == false do
                v926.CFrame = v926.CFrame * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), 0.017453292519943295)
                task.wait()
            end
            v939:Disconnect()
            v_u_704.Visible = false
            for v940 = 1, #v896 do
                v896[v940]:Destroy()
            end
            v_u_704.Skip.Text = "SKIP"
            v_u_704.ATitle.Text = "Unboxing Crate Skins"
            v_u_704.ATitle.TextColor3 = Color3.new(1, 1, 1)
            v_u_704.Entries.Size = UDim2.new(1, 0, 0.474, 0)
            v_u_704.Crate.Size = UDim2.new(1, 0, 0.348, 0)
            v_u_704.Entries.Visible = true
            v_u_704.Entries.Container.Contents.Position = UDim2.new(0, 0, 0, 0)
            v_u_703.Visible = true
        end
        local v_u_942 = true
        function CrateOpen(p943, p944, p945)
            if v_u_942 then
                v_u_942 = false
                v_u_941(p943, p944, p945)
                v_u_942 = true
            else
                repeat
                    wait()
                until v_u_942
                CrateOpen(p943, p944, p945)
            end
        end
        v_u_703.Header.AdClick.Activated:Connect(function()
            if require(game.ReplicatedStorage.AdModule).checkForAds() then
                v_u_17:FireServer("GamePurchase", "AdVideo")
            else
                _G.Notification("No Ads at the moment")
            end
        end)
        v_u_703.Header.Unlock.Activated:Connect(function()
            if v_u_840 then
                v_u_839 = false
                v_u_841 = nil
                v_u_730()
            end
        end)
        v_u_703.Header.Unlock10x.Activated:Connect(function()
            if v_u_840 then
                v_u_839 = true
                v_u_841 = nil
                v_u_730()
            end
        end)
        local v_u_946 = false
        v_u_703.Header.ShowAll.Frame.SwitchFrame.Switch.BackgroundColor3 = Color3.new(0, 1, 0)
        v_u_703.Header.ShowAll.Frame.SwitchFrame.Switch.Position = UDim2.new(0.5, 0, 0, 0)
        v_u_703.Header.ShowAll.Frame.SwitchFrame.TextButton.Activated:Connect(function()
            if v_u_946 == false then
                v_u_946 = true
                v_u_838 = not v_u_838
                if v_u_838 then
                    v_u_703.Header.ShowAll.Frame.SwitchFrame.Switch.BackgroundColor3 = Color3.new(0, 1, 0)
                    v_u_703.Header.ShowAll.Frame.SwitchFrame.Switch.Position = UDim2.new(0.5, 0, 0, 0)
                else
                    v_u_703.Header.ShowAll.Frame.SwitchFrame.Switch.BackgroundColor3 = Color3.new(0.839216, 0.180392, 0.180392)
                    v_u_703.Header.ShowAll.Frame.SwitchFrame.Switch.Position = UDim2.new(0, 0, 0, 0)
                end
                v_u_741()
                v_u_946 = false
            end
        end)
        v_u_703.Header.CloseButton.Activated:connect(function()
            v_u_689()
        end)
        v_u_703.Code.Submit.Activated:Connect(function()
            v_u_17:FireServer("EnterPromoCode", v_u_703.Code.Entry.Input.Text)
        end)
    end
end
v_u_19.Crew.BottomLeft.Frame.Skins.Activated:Connect(function()
    OpenWeaponSkinsGUI()
end)
v_u_14.ChildAdded:connect(function(p_u_947)
    if p_u_947.Name == "CharCam" and (p_u_947.Value ~= nil and p_u_947.Value:findFirstChild("Humanoid")) then
        v_u_6.CameraSubject = p_u_947.Value.Humanoid
        p_u_947.Value.Changed:connect(function()
            if p_u_947.Value.Parent == nil then
                p_u_947:Destroy()
                v_u_6.CameraSubject = v_u_5.Humanoid
            end
        end)
    end
end)
v_u_14.ChildRemoved:connect(function(p948)
    if p948.Name == "CharCam" then
        v_u_6.CameraSubject = v_u_5.Humanoid
    end
end)
local v949 = v_u_19.WeaponSkinsGUI.Body.Wrapper.SkinView.Frame.Skins.Contents.ShopEntry
for _, v_u_950 in pairs(v949:GetChildren()) do
    if v_u_950:IsA("Frame") and v_u_950:GetAttribute("SkinPack") then
        v_u_950.Buy.Activated:Connect(function()
            GiftPrompt("GamePurchase", v_u_950.Name .. " Purchase", v_u_950.Name)
        end)
        local v_u_951 = nil
        local v_u_952 = false
        v_u_950.info.InputBegan:connect(function()
            if v_u_951 == nil then
                local v953 = v_u_950.info.AbsolutePosition.X
                local v954 = v_u_950.info.AbsolutePosition.Y
                v_u_951 = Instance.new("TextLabel")
                v_u_951.Size = UDim2.new(0, 0, 0, 40)
                v_u_951.BackgroundTransparency = 0
                v_u_951.ClipsDescendants = true
                v_u_951.BackgroundColor3 = Color3.new(1, 1, 1)
                v_u_951.AnchorPoint = Vector2.new(0.5, 0.5)
                v_u_951.Position = UDim2.new(0, v953, 0, v954)
                v_u_951.Font = Enum.Font.GothamBold
                v_u_951.TextColor3 = Color3.new(1, 1, 1)
                v_u_951.TextStrokeTransparency = 0
                v_u_951.TextStrokeTransparency = 0
                v_u_951.TextSize = 15
                v_u_951.TextStrokeColor3 = Color3.new(0, 0, 0)
                v_u_951.Text = v_u_950.info.NewTextValue.Value
                local v955 = Instance.new("UICorner")
                v955.CornerRadius = UDim.new(0.1, 0)
                v955.Parent = v_u_951
                v_u_951.Parent = v_u_19
                game:GetService("TweenService"):Create(v_u_951, TweenInfo.new(0.5), {
                    ["Size"] = UDim2.new(0, v_u_951.TextBounds.X + 25, 0, 40)
                }):Play()
            end
        end)
        v_u_950.info.InputEnded:Connect(function()
            if not v_u_952 and v_u_951 then
                v_u_952 = true
                game:GetService("TweenService"):Create(v_u_951, TweenInfo.new(0.5), {
                    ["Size"] = UDim2.new(0, 0, 0, 40)
                }):Play()
                task.wait(0.5)
                v_u_951:Destroy()
                v_u_952 = false
                v_u_951 = nil
            end
        end)
    elseif v_u_950.Name == "CashList" then
        for _, v_u_956 in pairs(v_u_950:GetChildren()) do
            if v_u_956:IsA("ImageButton") then
                v_u_956.Activated:Connect(function()
                    GiftPrompt("GamePurchase", v_u_956.Name .. " Purchase", v_u_956.Name)
                end)
            end
        end
    elseif v_u_950.Name == "ItemFrame" then
        for _, v_u_957 in pairs(v_u_950.ItemList:GetChildren()) do
            if v_u_957:IsA("Frame") and v_u_957:FindFirstChild("Buy") then
                v_u_957.Buy.Activated:Connect(function()
                    GiftPrompt("GamePurchase", v_u_957.Name .. " Purchase", v_u_957.Name)
                end)
            end
        end
    end
end
v_u_19.Promote.ImageButton.MouseButton1Click:connect(function()
    OpenWeaponSkinsGUI()
end)
v_u_19:WaitForChild("ChargeButton")
local v_u_958 = false
v_u_19.ChargeButton.MouseButton1Click:connect(function()
    if v_u_958 == false then
        v_u_958 = true
        v_u_17:FireServer("ChargeButton")
        wait(0.5)
        v_u_958 = false
    end
end)
v_u_19.MobileLayout.Fire.Activated:connect(function()
    if v_u_958 == false then
        v_u_958 = true
        v_u_17:FireServer("ShootButton")
        wait()
        v_u_958 = false
    end
end)
v_u_19:WaitForChild("TaseButton")
v_u_19.TaseButton.MouseButton1Click:connect(function()
    if v_u_958 == false then
        v_u_958 = true
        v_u_17:FireServer("TaserSHOCK")
        wait()
        v_u_958 = false
    end
end)
local v959 = v_u_11:WaitForChild("Remotes"):WaitForChild("ToggleLeaderboardVisibility")
local v_u_960 = v_u_19:WaitForChild("Leaderboard")
local v_u_961 = {}
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
local function v_u_975(p_u_962)
    if not v_u_961[p_u_962.UserId] then
        local v_u_963 = v_u_960.PlayerScroll.CloneExample:Clone()
        local v964 = p_u_962.UserId
        v_u_963.Name = tostring(v964)
        v_u_963.Visible = true
        v_u_963.PlayerName.Text = p_u_962.DisplayName
        task.spawn(function()
            p_u_962:WaitForChild("leaderstats")
            p_u_962.leaderstats:WaitForChild("Wanted")
            local v965 = v_u_963.PlayerWanted
            local v966 = p_u_962.leaderstats.Wanted.Value
            v965.Text = math.abs(v966)
            v_u_963.LayoutOrder = -p_u_962.leaderstats.Wanted.Value
            local v_u_969 = p_u_962.leaderstats.Wanted.Changed:Connect(function()
                local v967 = v_u_963.PlayerWanted
                local v968 = p_u_962.leaderstats.Wanted.Value
                v967.Text = math.abs(v968)
                v_u_963.LayoutOrder = -p_u_962.leaderstats.Wanted.Value
            end)
            p_u_962:WaitForChild("DataFolder")
            p_u_962.DataFolder:WaitForChild("Officer")
            local function v971()
                local v970
                if p_u_962.DataFolder.Officer.Value == 0 then
                    v_u_963.PlayerName.TextColor3 = Color3.new(1, 1, 1)
                    v_u_963.PlayerName.TextStrokeColor3 = Color3.new(0, 0, 0)
                    v970 = v_u_3.GroupImage(p_u_962)
                else
                    v_u_963.BackgroundColor3 = Color3.new(0.00784314, 0.521569, 1)
                    v970 = "rbxassetid://5078542968"
                end
                if table.find({
                    8195210,
                    93101606,
                    163721789,
                    439942262
                }, p_u_962.UserId) then
                    v_u_963.Check.Image = "rbxassetid://85641602162884"
                    v_u_963.Check.Visible = true
                    v_u_963.Check.Size = UDim2.new(0, 15, 0, 15)
                elseif table.find({ 3944434729, 2395613299 }, p_u_962.UserId) then
                    v_u_963.Check.Image = "rbxassetid://135969516158478"
                    v_u_963.Check.Visible = true
                    v_u_963.Check.Size = UDim2.new(0, 14, 0, 14)
                elseif p_u_962:IsInGroup(8068202) then
                    v_u_963.Check.Image = "rbxassetid://5078542968"
                    v_u_963.Check.Visible = true
                    v_u_963.Check.Size = UDim2.new(0, 14, 0, 14)
                elseif p_u_962:IsInGroup(10604500) then
                    v_u_963.Check.Image = "rbxassetid://78795738082312"
                    v_u_963.Check.Visible = true
                    v_u_963.Check.Size = UDim2.new(0, 15, 0, 15)
                elseif p_u_962:IsInGroup(1200769) then
                    v_u_963.Check.Image = "rbxassetid://12153049196"
                    v_u_963.Check.Visible = true
                    v_u_963.Check.Size = UDim2.new(0, 16, 0, 16)
                elseif p_u_962.HasVerifiedBadge then
                    v_u_963.Check.Visible = true
                    v_u_963.Check.Size = UDim2.new(0, 15, 0, 15)
                else
                    v_u_963.Check.Visible = false
                end
                if v970 then
                    v_u_963.ImageLabel.Image = v970
                    v_u_963.ImageLabel.Visible = true
                else
                    v_u_963.ImageLabel.Visible = false
                end
            end
            v971()
            local v_u_972 = p_u_962.DataFolder.Officer.Changed:Connect(v971)
            local v_u_973 = p_u_962.CharacterAdded:Connect(v971)
            v_u_963.PlayerName.MouseEnter:Connect(function()
                v_u_963.PlayerName.Text = p_u_962.Name
            end)
            v_u_963.PlayerName.MouseLeave:Connect(function()
                v_u_963.PlayerName.Text = p_u_962.DisplayName
            end)
            local v974 = Instance.new("BindableEvent")
            v974.Name = "bindableevent"
            v974.Event:Connect(function()
                v_u_969:Disconnect()
                v_u_972:Disconnect()
                v_u_973:Disconnect()
                v_u_963:Destroy()
            end)
            v974.Parent = v_u_963
            v_u_963.Parent = v_u_960.PlayerScroll
        end)
    end
end
v_u_975(v_u_2)
for _, v976 in pairs(game.Players:GetPlayers()) do
    if v976 ~= v_u_2 then
        v_u_975(v976)
    end
end
v959.OnClientEvent:Connect(function(p977, p978)
    v_u_961[p977] = p978
    for _, v979 in pairs(v_u_960.PlayerScroll:GetChildren()) do
        if v979:FindFirstChild("bindableevent") then
            v979.bindableevent:Fire()
        end
    end
    for _, v980 in pairs(game.Players:GetPlayers()) do
        v_u_975(v980)
    end
end)
game.Players.PlayerAdded:Connect(function(p981)
    v_u_975(p981)
end)
game.Players.PlayerRemoving:Connect(function(p982)
    local v983 = v_u_960.PlayerScroll:FindFirstChild(p982.UserId)
    if v983 then
        v983:WaitForChild("bindableevent")
        v983.bindableevent:Fire()
    end
end)
local v984 = v_u_19.Crew.BottomLeft.Frame.Report
local v_u_985 = v_u_19.Report
local v_u_986 = v_u_985.ReportFrame
local v_u_987 = v_u_986.ScrollingFrame
local v_u_988 = v_u_987.Template
local v_u_989 = v_u_985.SelectReport
local v_u_990 = v_u_989.SelectedPlr
local v_u_991 = v_u_985.ReportSent
local v_u_992 = nil
local v_u_993 = v_u_986.SearchBar
local function v_u_1007()
    for _, v994 in ipairs(v_u_987:GetChildren()) do
        if v994:IsA("Frame") and v994.Name ~= "Template" then
            v994:Destroy()
        end
    end
    local v995 = game.Players:GetPlayers()
    table.sort(v995, function(p996, p997)
        return p996.Name:lower() < p997.Name:lower()
    end)
    local v998 = v_u_993.Text:lower()
    for _, v_u_999 in ipairs(v995) do
        if v_u_999 ~= v_u_2 then
            local v1000 = v_u_999.DisplayName:lower()
            local v1001 = v_u_999.Name:lower()
            if v1000:find(v998) or v1001:find(v998) then
                local v1002 = v_u_988:Clone()
                v1002.Name = v_u_999.Name
                local v1003 = v1002.UserID
                local v1004 = v_u_999.UserId
                v1003.Text = tostring(v1004)
                v1002.PlayerName.Text = v_u_999.DisplayName .. " (@" .. v_u_999.Name .. ")"
                v1002.PlayerAvatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. v_u_999.UserId .. "&w=150&h=150"
                v1002.Visible = true
                v1002.Parent = v_u_987
                v1002.Report.MouseButton1Click:Connect(function()
                    v_u_990.Visible = true
                    local v1005 = v_u_990.UserID
                    local v1006 = v_u_999.UserId
                    v1005.Text = tostring(v1006)
                    v_u_990.PlayerName.Text = v_u_999.DisplayName .. " (@" .. v_u_999.Name .. ")"
                    v_u_990.AvatarIcon.Image = "rbxthumb://type=AvatarHeadShot&id=" .. v_u_999.UserId .. "&w=150&h=150"
                    v_u_992 = v_u_999
                    v_u_986.Visible = false
                    v_u_989.Visible = true
                end)
            end
        end
    end
end
v_u_993:GetPropertyChangedSignal("Text"):Connect(function()
    v_u_1007()
end)
local function v_u_1013(p1008)
    local v1009 = v_u_992
    if v1009 then
        v_u_17:FireServer("REPORT_PLAYER", v1009, p1008)
        v_u_992 = nil
        v_u_990.Visible = false
        v_u_989.Visible = false
        v_u_986.Visible = false
        v_u_991.Visible = true
        task.wait(2)
        local v1010 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local v1011 = {
            ["Position"] = UDim2.new(3.394, 0, -0.322, 0)
        }
        local v1012 = game:GetService("TweenService"):Create(v_u_991, v1010, v1011)
        v1012:Play()
        v1012.Completed:Connect(function()
            v_u_991.Visible = false
            v_u_991.Position = UDim2.new(0.224, 0, -0.375, 0)
            v_u_986.Visible = true
            v_u_1007()
        end)
    end
end
v984.MouseButton1Click:Connect(function()
    v_u_985.Visible = not v_u_985.Visible
    if v_u_985.Visible then
        v_u_986.Visible = true
        v_u_1007()
    else
        v_u_986.Visible = false
        v_u_989.Visible = false
        v_u_991.Visible = false
        for _, v1014 in ipairs(v_u_987:GetChildren()) do
            if v1014:IsA("Frame") and v1014.Name ~= "Template" then
                v1014:Destroy()
            end
        end
    end
end)
v_u_986.Parent.CloseButton.MouseButton1Click:Connect(function()
    v_u_985.Visible = false
    v_u_986.Visible = false
    v_u_989.Visible = false
    v_u_991.Visible = false
    for _, v1015 in ipairs(v_u_987:GetChildren()) do
        if v1015:IsA("Frame") and v1015.Name ~= "Template" then
            v1015:Destroy()
        end
    end
end)
local v1016 = v_u_989.ScrollingFrame
v1016.AimManipulation.ImageButton.MouseButton1Click:Connect(function()
    v_u_1013("AimManipulation")
end)
v1016.Teleport.ImageButton.MouseButton1Click:Connect(function()
    v_u_1013("Teleport")
end)
v1016.Flying.ImageButton.MouseButton1Click:Connect(function()
    v_u_1013("Flying")
end)
local v_u_1017 = v1016.Other
v_u_1017.ImageButton.MouseButton1Click:Connect(function()
    local v1018 = v_u_1017.NOTE.Text
    if v1018 and v1018 ~= "" then
        v_u_1013(v1018)
        v_u_1017.NOTE.Text = ""
    else
        print("notext lol")
    end
end)
v_u_989:GetPropertyChangedSignal("Visible"):Connect(function()
    if not v_u_989.Visible then
        v_u_1017.NOTE.Text = ""
    end
end)
local v1019 = v_u_19.Crew.BottomLeft.Frame.Crew
local v1020 = v_u_19.Crew.CrewJoin.CloseJoin
closeTop25Button = v_u_19.Crew.Top50.CloseButton
local v1021 = v_u_19.Crew.Current.CloseCurrent
local v1022 = v_u_19.Crew.Current.LeaveCrew
local v_u_1023 = v_u_19.Crew.ImageLabel.Image
local v_u_1024 = v_u_19.Crew.CrewJoin
local v_u_1025 = v_u_19.Crew.Current
function openCrewUI()
    if v_u_3.CheckInCrew(v_u_2) then
        updateCrewStuff()
        v_u_1024.Visible = false
        v_u_1025.Visible = true
        v_u_1025.Parent.TopButton.Visible = true
        v_u_1025.Parent.CurrentButton.Visible = true
        v_u_1024.Parent.Top50.Visible = false
    else
        v_u_1024.Visible = true
        v_u_1025.Visible = false
        v_u_1025.Parent.TopButton.Visible = false
        v_u_1025.Parent.CurrentButton.Visible = false
        v_u_1024.Parent.Top50.Visible = false
    end
end
function closeCrewUI()
    v_u_1024.Visible = false
    v_u_1025.Visible = false
    v_u_1025.Parent.TopButton.Visible = false
    v_u_1025.Parent.CurrentButton.Visible = false
    v_u_1024.Parent.Top50.Visible = false
end
function updateCrewStuff()
    v_u_1024.Visible = false
    v_u_1025.Visible = true
    v_u_1025.Parent.TopButton.Visible = true
    v_u_1025.Parent.CurrentButton.Visible = true
    local v_u_1026 = v_u_1025.ScrollingFrame
    for _, v1027 in ipairs(v_u_1026:GetChildren()) do
        if v1027:IsA("Frame") then
            v1027:Destroy()
        end
    end
    for _, v_u_1028 in ipairs(game:GetService("Players"):GetPlayers()) do
        pcall(function()
            if v_u_3.CheckTeam(v_u_2, v_u_1028, true) then
                local v1029 = v_u_1025.TemplateHolder:Clone()
                v1029.Visible = true
                local v1030 = v1029.Template
                v1030.Visible = true
                v1030.PlrName.Text = v_u_1028.Name
                v1030.Icon.Image = "rbxthumb://type=AvatarHeadShot&id=" .. v_u_1028.UserId .. "&w=150&h=150"
                v1029.Parent = v_u_1026
            end
        end)
    end
    local v1031 = v_u_3.GetGroupInfo(v_u_2)
    if v1031 then
        v_u_1025.GroupIcon.Image = v1031.EmblemUrl
        local v1032 = v_u_1025.Frame.GroupID
        local v1033 = v1031.Id
        v1032.Text = tostring(v1033)
        v_u_1025.Frame.GroupName.Text = v1031.Name
    else
        v_u_1025.GroupIcon.Image = v_u_1023
        v_u_1025.Frame.GroupID.Text = ""
        v_u_1025.Frame.GroupName.Text = ""
    end
end
local v1034 = v_u_3.GetGroupInfo(v_u_2)
if v1034 then
    v_u_1025.GroupIcon.Image = v1034.EmblemUrl
    local v1035 = v_u_1025.Frame.GroupID
    local v1036 = v1034.Id
    v1035.Text = tostring(v1036)
    v_u_1025.Frame.GroupName.Text = v1034.Name
else
    v_u_1025.GroupIcon.Image = v_u_1023
    v_u_1025.Frame.GroupID.Text = ""
    v_u_1025.Frame.GroupName.Text = ""
end
v1019.MouseButton1Click:Connect(function()
    if v_u_1024.Visible or v_u_1025.Visible then
        closeCrewUI()
    else
        openCrewUI()
    end
end)
v_u_1025.Parent.TopButton.MouseButton1Click:Connect(function()
    v_u_1025.Visible = false
    v_u_1024.Parent.Top50.Visible = true
end)
v_u_1025.Parent.CurrentButton.MouseButton1Click:Connect(function()
    v_u_1025.Visible = true
    v_u_1024.Parent.Top50.Visible = false
end)
v1020.MouseButton1Click:Connect(function()
    closeCrewUI()
end)
closeTop25Button.MouseButton1Click:Connect(function()
    closeCrewUI()
end)
v1021.MouseButton1Click:Connect(function()
    closeCrewUI()
end)
v1022.MouseButton1Click:Connect(function()
    if v_u_3.CheckInCrew(v_u_2) then
        v_u_17:FireServer("LeaveCrew")
        v_u_1025.GroupIcon.Image = v_u_1023
        v_u_1025.Frame.GroupID.Text = ""
        v_u_1025.Frame.GroupName.Text = ""
        closeCrewUI()
        v_u_1024.Visible = true
    end
end)
v_u_1024.TypeHolder.TextBox.FocusLost:Connect(function(p1037)
    if p1037 and not v_u_3.CheckInCrew(v_u_2) then
        v_u_17:FireServer("JoinCrew", v_u_1024.TypeHolder.TextBox.Text)
    end
end)
local function v1047()
    local v1038 = v_u_1024.ScrollingFrame
    local v1039 = v1038.Template
    v1039.Visible = false
    for _, v1040 in ipairs(v1038:GetChildren()) do
        if v1040:IsA("Frame") and v1040 ~= v1039 then
            v1040:Destroy()
        end
    end
    local v1041, v1042 = pcall(function()
        return game:GetService("GroupService"):GetGroupsAsync(v_u_2.UserId)
    end)
    if v1041 and v1042 then
        for _, v_u_1043 in ipairs(v1042) do
            if v_u_1043.Name and v_u_1043.Id then
                local v1044 = v1039:Clone()
                v1044.Parent = v1038
                v1044.Visible = true
                v1044.GroupIcon.Image = "rbxthumb://type=GroupIcon&id=" .. v_u_1043.Id .. "&w=150&h=150"
                v1044.GroupName.Text = v_u_1043.Name
                local v1045 = v1044.ID
                local v1046 = v_u_1043.Id
                v1045.Text = tostring(v1046)
                v1044.ImageButton.MouseButton1Click:Connect(function()
                    v_u_17:FireServer("JoinCrew", v_u_1043.Id)
                end)
            end
        end
    end
end
v_u_1024.Refresh.MouseButton1Click:Connect(v1047)
v1047()
v_u_17.OnClientEvent:Connect(function(p1048)
    if p1048 == "updateCrewStuff" then
        updateCrewStuff()
    end
end)
task.spawn(function()
    local v_u_1049 = game:GetService("Players")
    local v_u_1050 = game:GetService("UserInputService")
    local v_u_1051 = game:GetService("TweenService")
    local v_u_1052 = game:GetService("GuiService")
    local v_u_1053 = game:GetService("RunService")
    local v_u_1054 = v_u_1049.LocalPlayer
    local v_u_1055 = v_u_1054:GetAttribute("reporter") == true
    v_u_1054:GetAttributeChangedSignal("reporter"):Connect(function()
        v_u_1055 = v_u_1054:GetAttribute("reporter") == true
    end);
    (function()
        local v1056 = workspace:FindFirstChild("Players") or workspace
        for _, v1057 in ipairs(v1056:GetDescendants()) do
            if v1057:IsA("Highlight") and v1057.Name == "ReporterHoverHL_" .. v_u_1054.UserId then
                v1057:Destroy()
            end
        end
    end)()
    local v1058 = v_u_1054:WaitForChild("PlayerGui")
    local v1059 = v1058:FindFirstChild("ReporterUI")
    if v1059 then
        v1059:Destroy()
    end
    local v1060 = Instance.new("ScreenGui")
    v1060.Name = "ReporterUI"
    v1060.ResetOnSpawn = false
    v1060.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    v1060.Parent = v1058
    local v_u_1061 = Instance.new("Frame")
    v_u_1061.Name = "ReporterBox"
    v_u_1061.AnchorPoint = Vector2.new(1, 0.5)
    v_u_1061.Position = UDim2.new(0.98, 0, 0.5, 0)
    v_u_1061.Size = UDim2.new(0.22, 0, 0.13, 0)
    v_u_1061.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    v_u_1061.Visible = false
    v_u_1061.Parent = v1060
    local v1062 = Instance.new("UICorner")
    v1062.CornerRadius = UDim.new(0, 10)
    v1062.Parent = v_u_1061
    local v1063 = Instance.new("UIStroke")
    v1063.Thickness = 1
    v1063.Color = Color3.fromRGB(70, 70, 70)
    v1063.Parent = v_u_1061
    local v1064 = Instance.new("UIPadding")
    v1064.PaddingTop = UDim.new(0, 34)
    v1064.PaddingBottom = UDim.new(0, 10)
    v1064.PaddingLeft = UDim.new(0, 10)
    v1064.PaddingRight = UDim.new(0, 10)
    v1064.Parent = v_u_1061
    local v1065 = Instance.new("Frame")
    v1065.BackgroundTransparency = 1
    v1065.Size = UDim2.new(1, -40, 0, 26)
    v1065.Position = UDim2.fromOffset(10, 6)
    v1065.Active = true
    v1065.Parent = v_u_1061
    local v1066 = Instance.new("TextLabel")
    v1066.BackgroundTransparency = 1
    v1066.Size = UDim2.new(1, 0, 1, 0)
    v1066.Font = Enum.Font.GothamMedium
    v1066.TextScaled = true
    v1066.Text = "Reporter"
    v1066.TextColor3 = Color3.fromRGB(225, 225, 225)
    v1066.TextXAlignment = Enum.TextXAlignment.Left
    v1066.Parent = v1065
    local v1067 = Instance.new("TextButton")
    v1067.Text = "X"
    v1067.ZIndex = 5
    v1067.Font = Enum.Font.GothamBold
    v1067.TextScaled = true
    v1067.TextColor3 = Color3.fromRGB(255, 255, 255)
    v1067.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    v1067.Size = UDim2.fromOffset(24, 24)
    v1067.Position = UDim2.new(1, -30, 0, 6)
    v1067.Parent = v_u_1061
    local v1068 = Instance.new("UICorner")
    v1068.CornerRadius = UDim.new(1, 0)
    v1068.Parent = v1067
    local v_u_1069 = Instance.new("TextBox")
    v_u_1069.Size = UDim2.new(1, 0, 1, 0)
    v_u_1069.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    v_u_1069.TextColor3 = Color3.fromRGB(240, 240, 240)
    v_u_1069.TextXAlignment = Enum.TextXAlignment.Left
    v_u_1069.TextYAlignment = Enum.TextYAlignment.Top
    v_u_1069.Font = Enum.Font.Gotham
    v_u_1069.TextScaled = true
    v_u_1069.TextWrapped = true
    v_u_1069.MultiLine = true
    v_u_1069.ClearTextOnFocus = false
    v_u_1069.TextEditable = false
    v_u_1069.Parent = v_u_1061
    local v1070 = Instance.new("UICorner")
    v1070.CornerRadius = UDim.new(0, 8)
    v1070.Parent = v_u_1069
    local v_u_1071 = Instance.new("TextLabel")
    v_u_1071.BackgroundTransparency = 0.2
    v_u_1071.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    v_u_1071.TextColor3 = Color3.fromRGB(255, 255, 255)
    v_u_1071.Font = Enum.Font.GothamMedium
    v_u_1071.TextScaled = true
    v_u_1071.Size = UDim2.new(0, 0, 0, 0)
    v_u_1071.AnchorPoint = Vector2.new(0.5, 0)
    v_u_1071.Position = UDim2.new(0.5, 0, 0.02, 0)
    v_u_1071.Visible = false
    v_u_1071.Parent = v1060
    local v1072 = Instance.new("UICorner")
    v1072.CornerRadius = UDim.new(0, 8)
    v1072.Parent = v_u_1071
    local function v_u_1075(p1073, p1074)
        v_u_1071.Text = p1073
        v_u_1071.TextColor3 = p1074
        v_u_1071.Visible = true
        v_u_1071.Size = UDim2.new(0.18, 0, 0.045, 0)
        v_u_1071.BackgroundTransparency = 0.2
        v_u_1071.TextTransparency = 0
        v_u_1051:Create(v_u_1071, TweenInfo.new(0.15), {
            ["BackgroundTransparency"] = 0,
            ["TextTransparency"] = 0
        }):Play()
        task.delay(0.9, function()
            v_u_1051:Create(v_u_1071, TweenInfo.new(0.25), {
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 1
            }):Play()
            task.delay(0.3, function()
                v_u_1071.Visible = false
            end)
        end)
    end
    local v_u_1076 = false
    local v_u_1077 = nil
    local v_u_1078 = nil
    v1065.InputBegan:Connect(function(p1079)
        if p1079.UserInputType == Enum.UserInputType.MouseButton1 or p1079.UserInputType == Enum.UserInputType.Touch then
            v_u_1076 = true
            v_u_1077 = p1079.Position
            v_u_1078 = v_u_1061.Position
        end
    end)
    v_u_1050.InputChanged:Connect(function(p1080)
        if v_u_1076 and (p1080.UserInputType == Enum.UserInputType.MouseMovement or p1080.UserInputType == Enum.UserInputType.Touch) then
            local v1081 = p1080.Position - v_u_1077
            v_u_1061.Position = UDim2.new(v_u_1078.X.Scale, v_u_1078.X.Offset + v1081.X, v_u_1078.Y.Scale, v_u_1078.Y.Offset + v1081.Y)
        end
    end)
    v_u_1050.InputEnded:Connect(function(p1082)
        if p1082.UserInputType == Enum.UserInputType.MouseButton1 or p1082.UserInputType == Enum.UserInputType.Touch then
            v_u_1076 = false
        end
    end)
    v1067.MouseButton1Click:Connect(function()
        v_u_1061.Visible = false
    end)
    local v_u_1083 = false
    local v_u_1084 = nil
    local v_u_1085 = nil
    local v_u_1086 = nil
    local v_u_1087 = nil
    local v_u_1088 = 0
    local v_u_1089 = 0
    local v_u_1090 = 0
    local v_u_1091 = nil
    local v1092 = workspace:FindFirstChild("Players") or workspace
    local v_u_1093 = RaycastParams.new()
    v_u_1093.FilterType = Enum.RaycastFilterType.Whitelist
    v_u_1093.IgnoreWater = true
    v_u_1093.FilterDescendantsInstances = { v1092 }
    local function v_u_1101()
        local v1094 = workspace.CurrentCamera
        if v1094 then
            local v1095 = v_u_1052:GetGuiInset()
            local v1096 = v_u_1050:GetMouseLocation()
            local v1097 = v1094:ScreenPointToRay(v1096.X, v1096.Y - v1095.Y)
            local v1098 = workspace:Raycast(v1097.Origin, v1097.Direction * 1000, v_u_1093)
            if v1098 then
                local v1099 = v1098.Instance:FindFirstAncestorWhichIsA("Model")
                if v1099 then
                    if v1099:FindFirstChildOfClass("Humanoid") then
                        local v1100 = v_u_1049:GetPlayerFromCharacter(v1099)
                        if v1100 and v1100 ~= v_u_1054 then
                            return v1100, v1099
                        else
                            return nil, nil
                        end
                    else
                        return nil, nil
                    end
                else
                    return nil, nil
                end
            else
                return nil, nil
            end
        else
            return nil, nil
        end
    end
    local function v_u_1104(p1102, p1103)
        if p1102 ~= v_u_1085 or p1103 ~= v_u_1084 then
            v_u_1085 = p1102
            v_u_1084 = p1103
            if v_u_1091 and v_u_1091.Parent then
                v_u_1091.Parent = nil
                v_u_1091.Adornee = nil
            end
            if p1102 and p1103 then
                if not v_u_1091 then
                    v_u_1091 = Instance.new("Highlight")
                    v_u_1091.Name = "ReporterHoverHL_" .. v_u_1054.UserId
                    v_u_1091.FillTransparency = 0.7
                    v_u_1091.OutlineTransparency = 0
                end
                v_u_1091.Adornee = p1102
                v_u_1091.Parent = p1102
                v_u_1091.Enabled = true
            end
        end
    end
    local v_u_1105 = nil
    local v_u_1106 = 0
    v_u_1050.InputBegan:Connect(function(p1107, p1108)
        if p1108 then
            return
        elseif p1107.KeyCode == Enum.KeyCode.P and (v_u_1050:GetFocusedTextBox() == nil and v_u_1055) then
            v_u_1083 = not v_u_1083
            v_u_1075(v_u_1083 and "Reporter ON" or "Reporter OFF", v_u_1083 and Color3.fromRGB(80, 200, 120) or Color3.fromRGB(220, 80, 80))
            if v_u_1083 then
                if v_u_1105 then
                    v_u_1105:Disconnect()
                end
                v_u_1090 = 0
                v_u_1086 = nil
                v_u_1087 = nil
                v_u_1088 = 0
                v_u_1089 = 0
                v_u_1105 = v_u_1053.Heartbeat:Connect(function(p1109)
                    v_u_1090 = v_u_1090 + p1109
                    if v_u_1090 < 0.05 then
                        return
                    else
                        v_u_1090 = 0
                        if v_u_1083 and (v_u_1055 and v_u_1050:GetFocusedTextBox() == nil) then
                            local v1110, v1111 = v_u_1101()
                            local v1112 = os.clock()
                            if v1110 and v1111 then
                                if v_u_1084 == v1110 then
                                    v_u_1089 = v1112
                                else
                                    if v_u_1086 == v1110 then
                                        v_u_1088 = v_u_1088 + 1
                                    else
                                        v_u_1086 = v1110
                                        v_u_1087 = v1111
                                        v_u_1088 = 1
                                    end
                                    if v_u_1088 >= 2 then
                                        v_u_1104(v_u_1087, v_u_1086)
                                        v_u_1089 = v1112
                                        v_u_1086 = nil
                                        v_u_1087 = nil
                                        v_u_1088 = 0
                                    end
                                end
                            elseif v_u_1084 then
                                if v_u_1089 == 0 then
                                    v_u_1089 = v1112
                                end
                                if v1112 - v_u_1089 > 0.25 then
                                    v_u_1104(nil, nil)
                                end
                            end
                            if v_u_1085 and not v_u_1085.Parent then
                                v_u_1104(nil, nil)
                            end
                        elseif v_u_1084 then
                            v_u_1104(nil, nil)
                        end
                    end
                end)
            else
                if v_u_1105 then
                    v_u_1105:Disconnect()
                    v_u_1105 = nil
                end
                v_u_1104(nil, nil)
                v_u_1061.Visible = false
            end
        else
            if p1107.UserInputType == Enum.UserInputType.MouseButton1 and (v_u_1083 and (v_u_1050:GetFocusedTextBox() == nil and v_u_1055)) then
                local v1113 = os.clock()
                if v1113 - v_u_1106 < 0.15 then
                    return
                end
                v_u_1106 = v1113
                if v_u_1084 then
                    v_u_1069.Text = v_u_1084.DisplayName .. "\n" .. v_u_1084.Name .. " (" .. v_u_1084.UserId .. ")"
                    v_u_1061.Visible = true
                end
            end
            return
        end
    end)
    local function v_u_1116(p1114)
        local v1115 = p1114:FindFirstChildOfClass("Humanoid") or p1114:WaitForChild("Humanoid", 5)
        if v1115 then
            v1115.Died:Connect(function()
                v_u_1104(nil, nil)
                v_u_1061.Visible = false
                v_u_1086 = nil
                v_u_1087 = nil
                v_u_1088 = 0
                v_u_1089 = 0
            end)
        end
    end
    if v_u_1054.Character then
        v_u_1116(v_u_1054.Character)
    end
    v_u_1054.CharacterAdded:Connect(function(p1117)
        v_u_1104(nil, nil)
        v_u_1061.Visible = false
        v_u_1086 = nil
        v_u_1087 = nil
        v_u_1088 = 0
        v_u_1089 = 0
        v_u_1116(p1117)
    end)
end)
local v_u_1118 = game:GetService("GroupService")
local v_u_1119 = game:GetService("ReplicatedStorage")
local v_u_1120 = v_u_19.Crew.Top50.ScrollingFrame
local v_u_1121 = v_u_1120.Template
local function v_u_1123()
    for _, v1122 in ipairs(v_u_1120:GetChildren()) do
        if v1122:IsA("Frame") and (v1122.Name == v_u_1121.Name and v1122 ~= v_u_1121) then
            v1122:Destroy()
        end
    end
end
local function v_u_1130()
    local v_u_1124 = v_u_1119:WaitForChild("MainRemoteFunction", 5)
    if not v_u_1124 then
        warn("MainRemoteFunction not found in ReplicatedStorage.")
        return nil
    end
    local v_u_1125 = nil
    local v1126, v1127 = pcall(function()
        v_u_1125 = v_u_1124:InvokeServer("GetCrewTopLeaderboard")
    end)
    if not v1126 then
        warn("Error invoking MainRemoteFunction: " .. tostring(v1127))
        return nil
    end
    local v1128 = v_u_1125
    if typeof(v1128) == "table" then
        return v_u_1125
    end
    local v1129 = v_u_1125
    warn("MainRemoteFunction did not return a table. Received:", (typeof(v1129)))
    return nil
end
function GetDaysRemainingInMonth()
    local v1131 = os.date("*t")
    local v1132 = v1131.month
    local v1133 = v1131.year
    return os.date("%d", os.time({
        ["year"] = v1133,
        ["month"] = v1132 + 1,
        ["day"] = 0
    })) - v1131.day
end
local function v_u_1144()
    v_u_1123()
    local v1134 = v_u_1130()
    if v1134 then
        local v1135 = GetDaysRemainingInMonth()
        if v1135 ~= nil then
            local v1136 = v_u_19.Crew.Top50:FindFirstChild("DaysTillResetLabel")
            if v1136 and v1136:IsA("TextLabel") then
                v1136.Text = "Days till reset: " .. tostring(v1135)
            else
                warn("DaysTillResetLabel not found or is not a TextLabel.")
            end
        end
        for _, v1137 in ipairs(v1134) do
            local v_u_1138 = v1137[1]
            local v1139 = v1137[2]
            local v1140 = v1137[3]
            local v1141 = v_u_1121:Clone()
            v1141.Visible = true
            if v1141:FindFirstChild("GroupId") and v1141.GroupId:IsA("TextLabel") then
                v1141.GroupId.Text = tostring(v_u_1138)
            end
            if v1141:FindFirstChild("Amount") and v1141.Amount:IsA("TextLabel") then
                v1141.Amount.Text = tostring(v1139)
            end
            local v1142, v1143 = pcall(function()
                return v_u_1118:GetGroupInfoAsync(v_u_1138)
            end)
            if v1142 and v1143 then
                if v1141:FindFirstChild("GroupIcon") and v1141.GroupIcon:IsA("ImageLabel") then
                    v1141.GroupIcon.Image = "rbxthumb://type=GroupIcon&id=" .. v_u_1138 .. "&w=150&h=150"
                end
                if v1141:FindFirstChild("GroupName") and v1141.GroupName:IsA("TextLabel") then
                    v1141.GroupName.Text = v1143.Name
                end
            end
            if v1140 == 1 and (v1141:FindFirstChild("1") and v1141["1"]:IsA("Frame")) then
                v1141["1"].Visible = true
            elseif v1140 == 2 and (v1141:FindFirstChild("2") and v1141["2"]:IsA("Frame")) then
                v1141["2"].Visible = true
            elseif v1140 == 3 and (v1141:FindFirstChild("3") and v1141["3"]:IsA("Frame")) then
                v1141["3"].Visible = true
            end
            v1141.LayoutOrder = v1140
            v1141.Parent = v_u_1120
        end
    end
end
v_u_1144()
task.spawn(function()
    while wait(60) do
        v_u_1144()
    end
end)
if v_u_3.HasGamePass(v_u_2, 6412475) then
    v_u_19:WaitForChild("AnimationPack")
    v_u_19.AnimationPack.Visible = true
    v_u_19.AnimationPack.MouseButton1Click:connect(function()
        v_u_19.AnimationPack.ScrollingFrame.Visible = true
        v_u_19.AnimationPack.CloseButton.Visible = true
        v_u_19.AnimationPlusPack.Position = UDim2.new(-1, 0, 0.5, 12)
    end)
    v_u_19.AnimationPack.CloseButton.MouseButton1Click:connect(function()
        v_u_19.AnimationPack.ScrollingFrame.Visible = false
        v_u_19.AnimationPack.CloseButton.Visible = false
        v_u_19.AnimationPlusPack.Position = UDim2.new(0, 0, 0.5, 12)
    end)
    local v_u_1145 = false
    for _, v_u_1146 in pairs(v_u_19.AnimationPack.ScrollingFrame:GetChildren()) do
        if v_u_1146:IsA("TextButton") then
            v_u_1146.MouseButton1Click:connect(function()
                if v_u_1145 == false then
                    v_u_1145 = true
                    v_u_17:FireServer("AnimationPack", v_u_1146.Text)
                    wait(0.2)
                    v_u_1145 = false
                end
            end)
        end
    end
end
if v_u_3.HasGamePass(v_u_2, 106912041) then
    v_u_19:WaitForChild("AnimationPlusPack")
    v_u_19.AnimationPlusPack.Visible = true
    v_u_19.AnimationPlusPack.MouseButton1Click:connect(function()
        v_u_19.AnimationPlusPack.ScrollingFrame.Visible = true
        v_u_19.AnimationPlusPack.CloseButton.Visible = true
        v_u_19.AnimationPack.Position = UDim2.new(-1, 0, 0.5, -12)
    end)
    v_u_19.AnimationPlusPack.CloseButton.MouseButton1Click:connect(function()
        v_u_19.AnimationPlusPack.ScrollingFrame.Visible = false
        v_u_19.AnimationPlusPack.CloseButton.Visible = false
        v_u_19.AnimationPack.Position = UDim2.new(0, 0, 0.5, -12)
    end)
    local v_u_1147 = false
    for _, v_u_1148 in pairs(v_u_19.AnimationPlusPack.ScrollingFrame:GetChildren()) do
        if v_u_1148:IsA("TextButton") then
            v_u_1148.MouseButton1Click:connect(function()
                if v_u_1147 == false then
                    v_u_1147 = true
                    v_u_17:FireServer("AnimationPack2", v_u_1148.Text)
                    wait(0.2)
                    v_u_1147 = false
                end
            end)
        end
    end
end
v_u_19.Crew.Settings.Frame.CloseButton.MouseButton1Click:Connect(function()
    v_u_19.Crew.Settings.Visible = false
end)
local v_u_1149 = game:GetService("MarketplaceService")
function findImageDecal(p1150)
    local v_u_1151 = p1150
    local v_u_1152 = nil
    pcall(function()
        v_u_1152 = v_u_1149:GetProductInfo(v_u_1151)
    end)
    if not v_u_1152 then
        return false
    end
    v_u_19.Crew.Settings.Frame.InnerFrame.List.Crosshair.Icon.Image = "rbxassetid://6646175684"
    local v1153 = v_u_1152
    while p1150 - v_u_1151 < 300 do
        local v_u_1154 = nil
        pcall(function()
            v_u_1154 = v_u_1149:GetProductInfo(v_u_1151)
        end)
        if v_u_1154 and (v_u_1154.AssetTypeId == 1 and v1153.Creator.Id == v_u_1154.Creator.Id) then
            return v_u_1151
        end
        v_u_1151 = v_u_1151 - 1
        if (p1150 - v_u_1151) % 25 == 0 then
            task.wait()
        end
        if (p1150 - v_u_1151) % 2 == 0 then
            v_u_19.Crew.Settings.Frame.InnerFrame.List.Crosshair.Icon.BackgroundColor3 = Color3.new(1, 0, 0)
        else
            v_u_19.Crew.Settings.Frame.InnerFrame.List.Crosshair.Icon.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        end
    end
    return false
end
local v_u_1155 = false
local v_u_1156 = nil
local v_u_1157 = nil
function CursorImageCheck()
    local v1158 = v_u_1157
    return tonumber(v1158)
end
local function v_u_1160(p1159)
    v_u_19.Crew.Settings.Frame.InnerFrame.List.Crosshair.Icon.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    if p1159 and tonumber(p1159) then
        v_u_19.Crew.Settings.Frame.InnerFrame.List.Crosshair.IDBox.Text = p1159
        v_u_1156 = p1159
        v_u_19.Crew.Settings.Frame.InnerFrame.List.Crosshair.Icon.Image = "rbxassetid://" .. p1159
        v_u_21.CursorImage.Image = "rbxassetid://" .. v_u_1157
    else
        v_u_19.Crew.Settings.Frame.InnerFrame.List.Crosshair.IDBox.Text = "Enter a valid Image-ID"
        v_u_1156 = nil
        v_u_19.Crew.Settings.Frame.InnerFrame.List.Crosshair.Icon.Image = "rbxassetid://6312476440"
    end
end
v_u_19.Crew.Settings.Frame.InnerFrame.List.Crosshair.IDBox.FocusLost:connect(function()
    if v_u_1155 == false then
        v_u_1155 = true
        v_u_19.Crew.Settings.Frame.InnerFrame.List.Crosshair.IDBox.Active = false
        v_u_19.Crew.Settings.Frame.InnerFrame.List.Crosshair.IDBox.TextEditable = false
        local v1161 = v_u_19.Crew.Settings.Frame.InnerFrame.List.Crosshair.IDBox.Text
        v_u_19.Crew.Settings.Frame.InnerFrame.List.Crosshair.IDBox.Text = "Searching: " .. v1161
        if tonumber(v1161) then
            v_u_1160((findImageDecal((tonumber(v1161)))))
        else
            v_u_1160(nil)
        end
        v_u_19.Crew.Settings.Frame.InnerFrame.List.Crosshair.IDBox.Active = true
        v_u_19.Crew.Settings.Frame.InnerFrame.List.Crosshair.IDBox.TextEditable = true
        v_u_1155 = false
    end
end)
v_u_19.Crew.Settings.Frame.InnerFrame.List.Crosshair.TextButton.Activated:connect(function()
    if v_u_1155 == false then
        v_u_1155 = true
        v_u_17:FireServer("UpdateCursorImage", v_u_1156)
        v_u_1155 = false
    end
end)
task.spawn(function()
    v_u_2.DataFolder:WaitForChild("CursorImage")
    v_u_1157 = v_u_2.DataFolder.CursorImage.Value
    v_u_1160(v_u_2.DataFolder.CursorImage.Value)
    v_u_2.DataFolder.CursorImage.Changed:connect(function()
        v_u_1157 = v_u_2.DataFolder.CursorImage.Value
        v_u_1160(v_u_2.DataFolder.CursorImage.Value)
    end)
end)
repeat
    wait()
    local v_u_1162 = v_u_2.Backpack:FindFirstChild("[Phone]")
until v_u_1162
v_u_1162.Equipped:connect(function()
    v_u_19.PhoneFrame.Visible = true
end)
v_u_1162.Unequipped:connect(function()
    v_u_19.PhoneFrame.Visible = false
end)
v_u_14.CallFrom.Changed:connect(function(p1163)
    if p1163 ~= nil then
        for _ = 1, (1 / 0) do
            if v_u_14.CallFrom.Value == nil or v_u_14.CallFrom.Value.Character.BodyEffects.CallFrom.Value == v_u_2 then
                break
            end
            v_u_1162.TextureId = "rbxassetid://8538434908"
            wait(0.2)
            v_u_1162.TextureId = "rbxassetid://8538435272"
            wait(0.2)
        end
    end
end)
wait()
local v1164 = v_u_2.DataFolder.Information:FindFirstChild("AirPlaneMode")
if v1164 then
    v_u_19.PhoneCalls.TextButton.BackgroundColor3 = v1164.Value == "0" and Color3.fromRGB(255, 123, 123) or Color3.fromRGB(156, 255, 151)
end
local _ = game.Lighting.FogColor
local v_u_1165 = false
local function v1172()
    local v1166 = v_u_3.GetTime()
    local v1167 = game.ReplicatedStorage.BattleRoyale.Value == true and 12 or v1166
    if game.Lighting:GetAttribute("DayTimeValue") then
        v1167 = game.Lighting:GetAttribute("DayTimeValue")
    end
    game.Lighting.ClockTime = v1167
    if v1167 <= 6.5 or v1167 >= 18 then
        if not v_u_1165 then
            v_u_1165 = true
            if _G.WindowsChange then
                for _, v1168 in pairs(_G.WindowsChange) do
                    if math.random(1, 10) < 6 then
                        if _G.Reduce_Lag == false then
                            v1168[1].Material = Enum.Material.Neon
                            v1168[4].Enabled = true
                        end
                        v1168[1].Color = Color3.fromRGB(248, 217, 109)
                    end
                end
            end
            if workspace.Lights["Light Bulbs"].SpotLight.Enabled == false then
                for _, v1169 in pairs(workspace.Lights:GetChildren()) do
                    if v1169:FindFirstChild("SpotLight") then
                        v1169.SpotLight.Enabled = true
                    end
                end
                return
            end
        end
    elseif v_u_1165 then
        v_u_1165 = false
        if _G.WindowsChange then
            for _, v1170 in pairs(_G.WindowsChange) do
                v1170[1].Material = v1170[2]
                v1170[1].Color = v1170[3]
                v1170[4].Enabled = false
            end
        end
        if workspace.Lights["Light Bulbs"].SpotLight.Enabled == true then
            for _, v1171 in pairs(workspace.Lights:GetChildren()) do
                if v1171:FindFirstChild("SpotLight") then
                    v1171.SpotLight.Enabled = false
                end
            end
        end
    end
end
_G.UpdateDay = v1172
local v_u_1173 = v_u_1119:WaitForChild("Logging")
local v_u_1174 = false
local v_u_1175 = {
    ["W"] = true,
    ["A"] = true,
    ["S"] = true,
    ["D"] = true
}
v_u_1173.OnClientEvent:Connect(function(p1176)
    v_u_1174 = p1176
end)
v23.InputBegan:Connect(function(p1177)
    if v_u_1174 and (p1177.UserInputType == Enum.UserInputType.Keyboard and not v_u_1175[p1177.KeyCode.Name]) then
        v_u_1173:FireServer(p1177.KeyCode.Name)
    end
end)
local v_u_1178 = game:GetService("CollectionService")
local v_u_1179 = {}
local v_u_1180 = {}
local v_u_1181 = {}
local v_u_1182 = {}
game:GetService("RunService").RenderStepped:Connect(function(p1183)
    local v1184 = tick()
    debug.profilebegin("ConstantlyRotateItemLoop")
    local v1185 = 0
    for _, v1186 in v_u_1178:GetTagged("ConstantlyRotateItem") do
        if v1185 > 20 then
            return
        end
        v1185 = v1185 + 1
        if v1186:IsA("Model") or v1186:IsA("BasePart") then
            local v1187
            if v1186:IsA("Model") then
                v1187 = v1186.PrimaryPart or v1186
            else
                v1187 = v1186
            end
            if v1187 and (not v_u_1179[v1186] or (v_u_6.CFrame.Position - v_u_1179[v1186]).Magnitude <= 50) then
                if not v_u_1182[v1186] then
                    v_u_1182[v1186] = v_u_29.new()
                end
                if v1186:IsDescendantOf(workspace) then
                    if not v_u_1179[v1186] then
                        v_u_1179[v1186] = v1187.CFrame.Position
                    end
                    if not v_u_1180[v1186] then
                        v_u_1180[v1186] = v1187.CFrame - v1187.CFrame.Position
                        v_u_1181[v1186] = 0
                    end
                    local v1188 = v_u_1179[v1186]
                    local v1189 = v1184 * 2
                    local v1190 = math.sin(v1189) * 0.25
                    local v1191 = v1188 + Vector3.new(0, v1190, 0)
                    v_u_1181[v1186] = v_u_1181[v1186] + 0.7853981633974483 * p1183
                    local v1192 = CFrame.Angles(0, v_u_1181[v1186], 0) * v_u_1180[v1186]
                    local v1193 = CFrame.new(v1191) * v1192
                    if v1186:IsA("Model") then
                        v1186:SetPrimaryPartCFrame(v1193)
                    else
                        v1186.CFrame = v1193
                    end
                elseif v_u_1182[v1186] then
                    v1186:RemoveTag("ConstantlyRotateItem")
                    v_u_1182[v1186]:Destroy()
                    v_u_1182[v1186] = nil
                    v_u_1179[v1186] = nil
                    v_u_1180[v1186] = nil
                    v_u_1181[v1186] = nil
                end
            end
        end
    end
    debug.profileend()
end)
local v1194 = v_u_19.Crew.BottomLeft.Frame
for _, v1195 in pairs(v1194:GetChildren()) do
    if v1195.Name ~= "ZShopButton" and v1195:IsA("ImageButton") then
        v1195.ImageTransparency = 1
        local v_u_1196 = Instance.new("ImageLabel")
        v_u_1196.BackgroundTransparency = 1
        v_u_1196.Image = v1195.Image
        v_u_1196.Size = UDim2.new(1, 0, 1, 0)
        v_u_1196.Parent = v1195
        local v_u_1197 = false
        v1195.MouseEnter:Connect(function()
            if not v_u_1197 then
                v_u_1197 = true
                game:GetService("TweenService"):Create(v_u_1196, TweenInfo.new(0.25), {
                    ["Position"] = UDim2.new(0, 0, -0.25, 0)
                }):Play()
            end
        end)
        v1195.MouseLeave:Connect(function()
            if v_u_1197 then
                v_u_1197 = false
                game:GetService("TweenService"):Create(v_u_1196, TweenInfo.new(0.25), {
                    ["Position"] = UDim2.new(0, 0, 0, 0)
                }):Play()
            end
        end)
    end
end
local v1198 = v_u_2.DataFolder:FindFirstChild("MobileLayout")
if v1198 then
    v1198 = v1198.Value
end
if v1198 then
    local v1199 = game:GetService("HttpService"):JSONDecode(v1198)
    if v1199 then
        for v1200, v1201 in pairs(v1199) do
            local v1202 = v_u_19.MobileLayout:FindFirstChild(v1200)
            if v1202 then
                v1202.Position = UDim2.new(v1202.Position.X.Scale, v1201.OffsetX, v1202.Position.Y.Scale, v1201.OffsetY)
                v1202.Size = UDim2.new(0, v1201.Size, 0, v1201.Size)
            end
        end
    end
end
local v_u_1203 = nil
local v_u_1204 = false
local v_u_1205 = false
local v_u_1206 = false
local function v_u_1212(p1207, p1208)
    if not v_u_1206 then
        v_u_1206 = true
        if v_u_1203 then
            if p1207 then
                local v1209 = v_u_1203
                v1209.Position = v1209.Position + UDim2.new(0, p1207.X, 0, p1207.Y)
            end
            if p1208 then
                local v1210 = v_u_1203.Size.X.Offset
                if v1210 + p1208 > 10 and v1210 + p1208 < 150 then
                    local v1211 = v1210 + p1208
                    v_u_1203.Size = UDim2.new(0, v1211, 0, v1211)
                end
            end
        end
        task.wait()
        v_u_1206 = false
    end
end
local function v_u_1215()
    local v1213 = {}
    for _, v1214 in pairs(v_u_19.MobileLayout:GetChildren()) do
        if v1214:IsA("ImageButton") then
            v1213[v1214.Name] = {
                ["OffsetX"] = v1214.Position.X.Offset,
                ["OffsetY"] = v1214.Position.Y.Offset,
                ["Size"] = v1214.Size.X.Offset
            }
        end
    end
    v_u_17:FireServer("MobileLayout", (game:GetService("HttpService"):JSONEncode(v1213)))
end
v_u_19.MobileLayoutEdit.Frame.Left.Activated:Connect(function()
    v_u_19.MobileLayoutEdit.Frame.Left.TextColor3 = Color3.new(1, 0, 0)
    v_u_1212(Vector2.new(-5, 0))
    task.wait(0.05)
    v_u_19.MobileLayoutEdit.Frame.Left.TextColor3 = Color3.new(1, 1, 1)
end)
v_u_19.MobileLayoutEdit.Frame.Right.Activated:Connect(function()
    v_u_19.MobileLayoutEdit.Frame.Right.TextColor3 = Color3.new(1, 0, 0)
    v_u_1212(Vector2.new(5, 0))
    task.wait(0.05)
    v_u_19.MobileLayoutEdit.Frame.Right.TextColor3 = Color3.new(1, 1, 1)
end)
v_u_19.MobileLayoutEdit.Frame.Up.Activated:Connect(function()
    v_u_19.MobileLayoutEdit.Frame.Up.TextColor3 = Color3.new(1, 0, 0)
    v_u_1212(Vector2.new(0, -5))
    task.wait(0.05)
    v_u_19.MobileLayoutEdit.Frame.Up.TextColor3 = Color3.new(1, 1, 1)
end)
v_u_19.MobileLayoutEdit.Frame.Down.Activated:Connect(function()
    v_u_19.MobileLayoutEdit.Frame.Down.TextColor3 = Color3.new(1, 0, 0)
    v_u_1212(Vector2.new(0, 5))
    task.wait(0.05)
    v_u_19.MobileLayoutEdit.Frame.Down.TextColor3 = Color3.new(1, 1, 1)
end)
v_u_19.MobileLayoutEdit.Frame.SizeDown.Activated:Connect(function()
    v_u_19.MobileLayoutEdit.Frame.SizeDown.TextColor3 = Color3.new(1, 0, 0)
    v_u_1212(nil, -2)
    task.wait(0.05)
    v_u_19.MobileLayoutEdit.Frame.SizeDown.TextColor3 = Color3.new(1, 1, 1)
end)
v_u_19.MobileLayoutEdit.Frame.SizeUp.Activated:Connect(function()
    v_u_19.MobileLayoutEdit.Frame.SizeUp.TextColor3 = Color3.new(1, 0, 0)
    v_u_1212(nil, 2)
    task.wait(0.05)
    v_u_19.MobileLayoutEdit.Frame.SizeUp.TextColor3 = Color3.new(1, 1, 1)
end)
local function v_u_1217()
    if not v_u_1204 then
        v_u_1204 = true
        v_u_19.MobileLayoutEdit.Visible = not v_u_19.MobileLayoutEdit.Visible
        if not v_u_19.MobileLayoutEdit.Visible then
            for _, v1216 in pairs(v_u_19.MobileLayout:GetChildren()) do
                if v1216:IsA("ImageButton") and (v1216 and v1216:FindFirstChild("Frame")) then
                    v1216.Frame:Destroy()
                end
            end
            v_u_1203 = nil
            if v_u_1203 then
                v_u_19.MobileLayoutEdit.Frame.TextLabel.Text = "Selected Layout: " .. v_u_1203.Name
            else
                v_u_19.MobileLayoutEdit.Frame.TextLabel.Text = "Selected Layout: N/A"
            end
            v_u_1215()
        end
        task.wait(0.1)
        v_u_1204 = false
    end
end
v_u_19.MobileLayoutEdit.Frame.Save.Activated:Connect(function()
    v_u_1217()
end)
local function v_u_1219()
    if not v_u_1204 then
        v_u_1204 = true
        for _, v1218 in pairs(v_u_19.MobileLayout:GetChildren()) do
            if v1218:IsA("ImageButton") and game.StarterGui.MainScreenGui.MobileLayout:FindFirstChild(v1218.Name) then
                v1218.Size = game.StarterGui.MainScreenGui.MobileLayout[v1218.Name].Size
                v1218.Position = game.StarterGui.MainScreenGui.MobileLayout[v1218.Name].Position
            end
        end
        v_u_1215()
        task.wait()
        v_u_1204 = false
    end
end
v_u_2.Chatted:connect(function(p1220)
    if p1220 == "/resetlayout" then
        v_u_1219()
    end
end)
v_u_19.Crew.Settings.Frame.InnerFrame.List.MobileEditor.SwitchFrame2.TextButton.Activated:Connect(function()
    v_u_1219()
end)
v_u_19.Crew.Settings.Frame.InnerFrame.List.MobileEditor.SwitchFrame.TextButton.Activated:Connect(function()
    v_u_1217()
end)
local v_u_1221 = v_u_1203
local v_u_1222 = {}
for _, v_u_1223 in pairs(v_u_19.MobileLayout:GetChildren()) do
    if v_u_1223:IsA("ImageButton") then
        v_u_1223.Activated:Connect(function()
            if not v_u_1222[v_u_1223] then
                v_u_1222[v_u_1223] = true
                local v_u_1224 = v_u_1223.ImageTransparency
                v_u_1223.ImageTransparency = 0.5
                task.delay(0.1, function()
                    v_u_1223.ImageTransparency = v_u_1224
                    v_u_1222[v_u_1223] = nil
                end)
            end
            if not v_u_1205 then
                v_u_1205 = true
                if v_u_1221 and v_u_1221:FindFirstChild("Frame") then
                    v_u_1221.Frame:Destroy()
                end
                if v_u_19.MobileLayoutEdit.Visible then
                    local v1225 = Instance.new("Frame")
                    v1225.BackgroundTransparency = 0.8
                    v1225.BackgroundColor3 = Color3.new(1, 1, 1)
                    v1225.BorderSizePixel = 0
                    v1225.Size = UDim2.new(1, 0, 1, 0)
                    v1225.Parent = v_u_1223
                    v_u_1221 = v_u_1223
                end
                if v_u_1221 then
                    v_u_19.MobileLayoutEdit.Frame.TextLabel.Text = "Selected Layout: " .. v_u_1221.Name
                else
                    v_u_19.MobileLayoutEdit.Frame.TextLabel.Text = "Selected Layout: N/A"
                end
                v_u_1205 = false
            end
        end)
    end
end
spawn(function()
    if game.Players:GetAttribute("VIP_OWNER") == v_u_2.UserId then
        v_u_19.VIPCMDS.Visible = true
        local v_u_1226 = false
        v_u_19.VIPCMDS.ImageButton.Activated:connect(function()
            v_u_1226 = not v_u_1226
            if v_u_1226 then
                game:GetService("TweenService"):Create(v_u_19.VIPCMDS, TweenInfo.new(0.1), {
                    ["AnchorPoint"] = Vector2.new(0, 0.5)
                }):Play()
            else
                game:GetService("TweenService"):Create(v_u_19.VIPCMDS, TweenInfo.new(0.1), {
                    ["AnchorPoint"] = Vector2.new(1, 0.5)
                }):Play()
            end
        end)
        if game.Players:GetAttribute("Roleplay") then
            v_u_19.VIPCMDS.Commands.PlayerList.Roleplay.SwitchFrame.Switch.BackgroundColor3 = Color3.new(0, 1, 0)
            v_u_19.VIPCMDS.Commands.PlayerList.Roleplay.SwitchFrame.Switch.Position = UDim2.new(0.5, 0, 0, 0)
        else
            v_u_19.VIPCMDS.Commands.PlayerList.Roleplay.SwitchFrame.Switch.BackgroundColor3 = Color3.new(0.839216, 0.180392, 0.180392)
            v_u_19.VIPCMDS.Commands.PlayerList.Roleplay.SwitchFrame.Switch.Position = UDim2.new(0, 0, 0, 0)
        end
        v_u_19.VIPCMDS.Commands.PlayerList.Roleplay.SwitchFrame.TextButton.Activated:connect(function()
            v_u_17:FireServer("RoleplayModeChange")
        end)
        if v_u_3.isMacroAllowed() == true then
            v_u_19.VIPCMDS.Commands.PlayerList.MacroEnable.SwitchFrame.Switch.BackgroundColor3 = Color3.new(0, 1, 0)
            v_u_19.VIPCMDS.Commands.PlayerList.MacroEnable.SwitchFrame.Switch.Position = UDim2.new(0.5, 0, 0, 0)
        else
            v_u_19.VIPCMDS.Commands.PlayerList.MacroEnable.SwitchFrame.Switch.BackgroundColor3 = Color3.new(0.839216, 0.180392, 0.180392)
            v_u_19.VIPCMDS.Commands.PlayerList.MacroEnable.SwitchFrame.Switch.Position = UDim2.new(0, 0, 0, 0)
        end
        v_u_19.VIPCMDS.Commands.PlayerList.MacroEnable.SwitchFrame.TextButton.Activated:connect(function()
            v_u_17:FireServer("MacroModeChange")
        end)
        v_u_19.VIPCMDS.Commands.PlayerList.Announcement.SwitchFrame.TextBox.FocusLost:connect(function()
            local v1227 = v_u_19.VIPCMDS.Commands.PlayerList.Announcement.SwitchFrame.TextBox.Text
            v_u_19.VIPCMDS.Commands.PlayerList.Announcement.SwitchFrame.TextBox.Text = ""
            if v1227 ~= "" then
                v_u_17:FireServer("Shout", v1227)
            end
        end)
        v_u_19.VIPCMDS.Commands.PlayerList.DTime.SwitchFrame.TextBox.FocusLost:Connect(function()
            local v1228 = v_u_19.VIPCMDS.Commands.PlayerList.DTime.SwitchFrame.TextBox.Text
            if tonumber(v1228) then
                v_u_17:FireServer("Change_Time", (tonumber(v1228)))
            else
                v_u_19.VIPCMDS.Commands.PlayerList.DTime.SwitchFrame.TextBox.Text = ""
            end
        end)
        local v_u_1229 = {}
        local function v_u_1232(p_u_1230)
            if v_u_1229[p_u_1230] == nil then
                local v1231 = v_u_19.VIPCMDS.Commands.PlayerList["Z:PlayerFrame"]:Clone()
                v1231.Username.Text = p_u_1230.Name
                v1231.Visible = true
                v1231.Parent = v_u_19.VIPCMDS.Commands.PlayerList
                v_u_1229[p_u_1230] = v1231
                v1231.Kick.Activated:connect(function()
                    v_u_17:FireServer("VIP_CMD", "Kick", p_u_1230)
                end)
                v1231.TP.Activated:connect(function()
                    v_u_17:FireServer("VIP_CMD", "TP", p_u_1230)
                end)
                v1231.Summon.Activated:connect(function()
                    v_u_17:FireServer("VIP_CMD", "Summon", p_u_1230)
                end)
                v1231.Spec.Activated:connect(function()
                    v_u_6.CameraSubject = p_u_1230.Character.Humanoid
                end)
                v1231.BabyChange.Activated:connect(function()
                    v_u_17:FireServer("VIP_CMD", "BabySize", p_u_1230)
                end)
                if p_u_1230 == v_u_2 then
                    v1231.Kick.Visible = false
                end
            end
        end
        v_u_1232(v_u_2)
        for _, v1233 in pairs(game.Players:GetPlayers()) do
            if v1233 ~= v_u_2 then
                v_u_1232(v1233)
            end
        end
        game.Players.PlayerAdded:connect(function(p1234)
            v_u_1232(p1234)
        end)
        game.Players.PlayerRemoving:connect(function(p1235)
            if v_u_1229[p1235] then
                v_u_1229[p1235]:Destroy()
            end
        end)
        if not game.Lighting:GetAttribute("Minigames") then
            for _, v_u_1236 in pairs(v_u_19.VIPCMDS.Commands.PlayerList["T-MiniGame"].ScrollingFrame:GetChildren()) do
                if v_u_1236:IsA("Frame") then
                    v_u_1236.ImageButton.Activated:Connect(function()
                        v_u_17:FireServer("VIP_CMD", "Minigames", v_u_2, v_u_1236.GameTitle.Text)
                    end)
                end
            end
        end
    end
end)
v_u_4:Init(v_u_19.PhoneFrame)
local v_u_1237 = game:GetService("VoiceChatService"):IsVoiceEnabledForUserIdAsync(v_u_2.UserId) or v_u_2.UserId == 607348662
if v_u_1237 or v_u_2.UserId == 8195210 then
    v_u_19.ServerVCJoin.Random.ImageButton.Activated:Connect(function()
        if v_u_1237 or v_u_2.UserId == 8195210 then
            v_u_17:FireServer("JoinVCServer")
        end
    end)
else
    v_u_19.Crew.BottomLeft.Frame:WaitForChild("VC")
    if game.PlaceId == 7213786345 then
        v_u_17:FireServer("KickNonVC", v_u_1237)
    end
end
v_u_19.ServerLegacyJoin.Random.ImageButton.Activated:Connect(function()
    v_u_17:FireServer("JoinLegacyServer")
end)
v_u_19.Crew.Settings.Frame.InnerFrame.List.Macro.SwitchFrame.TextButton.Activated:Connect(function()
    v_u_17:FireServer("JoinMacroServer")
end)
repeat
    wait()
until _G.Reduce_Lag ~= nil
pcall(function()
    local v1238 = workspace.Ignored.TimePortal
    local v_u_1239 = false
    local function v_u_1253()
        local v1240 = Instance.new("Attachment")
        v1240.Parent = v_u_5.PrimaryPart
        for _, v1241 in pairs(game.ReplicatedStorage.TimePortalFolder:GetChildren()) do
            if v1241:IsA("ParticleEmitter") then
                local v1242 = v1241:Clone()
                v1242.Parent = v1240
                v1242:Emit(1)
            end
        end
        local v1243 = (Vector3.new(1271.4, 1, 539.06)).X * math.random()
        local v1244 = (Vector3.new(1271.4, 1, 539.06)).Y * math.random()
        local v1245 = (Vector3.new(1271.4, 1, 539.06)).Z * math.random()
        local v1246 = Vector3.new(-713.46, 220.58, -626.15) + Vector3.new(v1243, v1244, v1245)
        local v1247 = RaycastParams.new()
        v1247.FilterType = Enum.RaycastFilterType.Include
        v1247.FilterDescendantsInstances = { workspace.MAP }
        local v1248 = workspace:Raycast(v1246, Vector3.new(0, -300, 0), v1247)
        local v1249
        if v1248 then
            v1249 = v1248.Position
        else
            v1249 = v1246 - Vector3.new(0, 300, 0)
        end
        local v1250 = v_u_5.HumanoidRootPart.Size * 3
        local v1251 = v1249 + Vector3.new(0, v1250, 0)
        local v1252 = v_u_5.HumanoidRootPart.CFrame
        v_u_5.HumanoidRootPart.CFrame = v1252 - v1252.p + v1251
        game.ReplicatedStorage.TimePortalFolder.Sound:Play()
        task.wait(2)
        v1240:Destroy()
    end
    v1238.PrimaryPart.Touched:Connect(function(p1254)
        if not v_u_1239 and (p1254:IsDescendantOf(v_u_5) and v_u_3.Activate(v_u_14)) then
            v_u_1239 = true
            v_u_1253()
            v_u_1239 = false
        end
    end)
end)
if _G.CameraFOV then
    local v1255 = _G.CameraFOV
    if tonumber(v1255) then
        v_u_6.FieldOfView = _G.CameraFOV
    end
end
v_u_19.Crew.Settings.Frame.InnerFrame.List.FOV.TextButton.Activated:Connect(function()
    local v1256 = v_u_19.Crew.Settings.Frame.InnerFrame.List.FOV.IDBox.Text
    setSetting("FOV", (tonumber(v1256)))
end)
v_u_19.Crew.Settings.Frame.InnerFrame.List.LowGFX.SwitchFrame.TextButton.MouseButton1Click:Connect(function()
    setSetting("LowGFX", not _G.Reduce_Lag)
end)
v_u_19.Crew.Settings.Frame.InnerFrame.List.BoomBox.SwitchFrame.TextButton.MouseButton1Click:Connect(function()
    setSetting("BoomboxMuted", not v_u_291)
end)
local function v1260()
    local v1257 = v_u_270
    local v1258 = v_u_19.Crew.Settings.Frame.InnerFrame.List.Passenger.SwitchFrame.Switch
    local v1259 = v_u_5
    if v1259 then
        v1259 = v_u_5:GetAttribute("PassengerSeatEnable")
    end
    v1257(v1258, v1259)
end
v_u_29.new():Add(v_u_5:GetAttributeChangedSignal("PassengerSeatEnable"):Connect(v1260))
v1260()
pcall(function()
    for _, v1261 in pairs(workspace.Players:GetChildren()) do
        if v1261.LowerTorso:FindFirstChild("BOOMBOXSOUND") then
            v1261.LowerTorso.BOOMBOXSOUND.Volume = 0.5
        end
    end
end)
workspace.Players.DescendantAdded:Connect(function(p1262)
    if v_u_291 and (p1262:IsA("Sound") and (p1262.Name == "BOOMBOXSOUND" and not p1262:IsDescendantOf(v_u_5))) then
        p1262.Volume = 0
        v_u_264[p1262] = true
    end
end)
v_u_19.Crew.Settings.Frame.InnerFrame.List.Passenger.SwitchFrame.TextButton.MouseButton1Click:connect(function()
    v_u_17:FireServer("PassengerSeatEnable")
end)
v_u_19.Crew.Settings.Frame.InnerFrame.List.Stats.SwitchFrame.TextButton.MouseButton1Click:connect(function()
    v_u_19.StatsInformation.Visible = not v_u_19.StatsInformation.Visible
    local v1263 = game.ReplicatedStorage.MaxMuscle.Value
    local v1264 = v_u_2.DataFolder
    local v1265 = v1264:WaitForChild("Information"):FindFirstChild("MuscleInformation")
    local v1266 = (v1263 + (not v1265 and 0 or v1265.Value)) / (v1263 * 2)
    local v1267 = Color3.fromRGB(255, 0, 0):lerp(Color3.fromRGB(174, 255, 149), v1266)
    v_u_19.StatsInformation.Muscle.Bar.Frame.BackgroundColor3 = v1267
    v_u_19.StatsInformation.Muscle.Bar.Frame.Size = UDim2.new(v1266, 0, 1, 0)
    local v1268 = v1264.ShotTotal.Value
    local v1269 = v1264.ShotLand.Value
    if v1268 > 0 then
        local v1270 = v1269 / v1268
        local v1271 = math.clamp(v1270, 0, 1) * 100
        local v1272 = math.round(v1271)
        v_u_19.StatsInformation.AimAccuracy.TextLabel.Text = "Aim Accuracy: " .. v1272 .. "%"
    end
    local v1273 = v_u_2.DataFolder.Information:FindFirstChild("BoxingValue")
    local v1274 = (not v1273 and 0 or v1273.Value) / game.ReplicatedStorage.MaxBoxing.Value
    local v1275 = Color3.fromRGB(255, 0, 0):lerp(Color3.fromRGB(174, 255, 149), v1274)
    v_u_19.StatsInformation.Boxing.Bar.Frame.BackgroundColor3 = v1275
    v_u_19.StatsInformation.Boxing.Bar.Frame.Size = UDim2.new(v1274, 0, 1, 0)
end)
local v_u_1276 = false
local v_u_1277 = false
v_u_19.SelectServer.Legacy.InputBegan:Connect(function()
    v_u_19.SelectServer.Legacy.TextColor3 = Color3.new(0.352941, 1, 0.458824)
end)
v_u_19.SelectServer.Legacy.InputEnded:Connect(function()
    v_u_19.SelectServer.Legacy.TextColor3 = Color3.new(1, 1, 1)
end)
v_u_19.SelectServer.VC.InputBegan:Connect(function()
    v_u_19.SelectServer.VC.TextColor3 = Color3.new(0.352941, 1, 0.458824)
end)
v_u_19.SelectServer.VC.InputEnded:Connect(function()
    v_u_19.SelectServer.VC.TextColor3 = Color3.new(1, 1, 1)
end)
v_u_19.Crew.BottomLeft.Frame.VC.MouseButton1Click:Connect(function()
    v_u_19.SelectServer.Visible = not v_u_19.SelectServer.Visible
    local v_u_1278 = nil
    local v_u_1279 = nil
    v_u_1278 = v_u_19.SelectServer.Legacy.Activated:Once(function()
        v_u_19.ServerLegacyJoin.Visible = true
        v_u_19.SelectServer.Visible = false
        if v_u_19.ServerLegacyJoin.Visible and not v_u_1276 then
            v_u_1276 = true
            local v1280 = game.ReplicatedStorage.RemoteFunction.RemoteFunction:InvokeServer("LegacyServers")
            for _, v1281 in pairs(v_u_19.ServerLegacyJoin.ScrollingFrame:GetChildren()) do
                if v1281:IsA("Frame") and v1281.Name ~= "Template" then
                    v1281:Destroy()
                end
            end
            if v1280 then
                for _, v1282 in pairs(v1280) do
                    local v_u_1283 = v1282[1]
                    local v_u_1284 = v1282[2]
                    local v_u_1285 = v1282[3]
                    local v_u_1286 = v_u_19.ServerLegacyJoin.ScrollingFrame.Template:Clone()
                    v_u_1286.Name = "Clone"
                    v_u_1286.TextLabel.Text = v_u_1284 .. " Players"
                    v_u_1286.Visible = true
                    v_u_1286.Parent = v_u_19.ServerLegacyJoin.ScrollingFrame
                    if v_u_1285 then
                        local v_u_1287 = 6
                        task.spawn(function()
                            for _, v1288 in pairs(v_u_1285) do
                                local v1289 = v1288[1]
                                local _ = v1288[2]
                                if v_u_2:IsFriendsWith(v1289) then
                                    v_u_1286.TextLabel.Text = v_u_1284 .. " Players (Friend\'s Server)"
                                end
                                if v_u_1287 ~= 0 then
                                    local v1290 = v_u_1286.Frame.Template:Clone()
                                    v1290.Visible = true
                                    v1290.Image = game.Players:GetUserThumbnailAsync(v1289, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180)
                                    v1290.Parent = v_u_1286.Frame
                                    v_u_1287 = v_u_1287 - 1
                                end
                            end
                        end)
                    end
                    v_u_1286.Join.Activated:Connect(function()
                        v_u_17:FireServer("JoinLegacyServerID", v_u_1283)
                    end)
                end
            end
            local v_u_1291 = nil
            v_u_1291 = v_u_19.ServerLegacyJoin.Close.MouseButton1Click:Connect(function()
                v_u_1291:Disconnect()
                v_u_19.ServerLegacyJoin.Visible = false
                v_u_1277 = false
                if v_u_1278 then
                    v_u_1278:Disconnect()
                end
                if v_u_1279 then
                    v_u_1279:Disconnect()
                end
            end)
            task.wait()
            v_u_1276 = false
        end
    end)
    v_u_1279 = v_u_19.SelectServer.VC.Activated:Once(function()
        if game:GetService("VoiceChatService"):IsVoiceEnabledForUserIdAsync(v_u_2.UserId) or (v_u_2.UserId == 8195210 or v_u_2.UserId == 607348662) then
            v_u_19.ServerVCJoin.Visible = true
            v_u_19.SelectServer.Visible = false
            if v_u_19.ServerVCJoin.Visible and not v_u_1276 then
                v_u_1276 = true
                local v1292 = game.ReplicatedStorage.RemoteFunction.RemoteFunction:InvokeServer("VCServers")
                for _, v1293 in pairs(v_u_19.ServerVCJoin.ScrollingFrame:GetChildren()) do
                    if v1293:IsA("Frame") and v1293.Name ~= "Template" then
                        v1293:Destroy()
                    end
                end
                if v1292 then
                    for _, v1294 in pairs(v1292) do
                        local v_u_1295 = v1294[1]
                        local v_u_1296 = v1294[2]
                        local v_u_1297 = v1294[3]
                        local v_u_1298 = v_u_19.ServerVCJoin.ScrollingFrame.Template:Clone()
                        v_u_1298.Name = "Clone"
                        v_u_1298.TextLabel.Text = v_u_1296 .. " Players"
                        v_u_1298.Visible = true
                        v_u_1298.Parent = v_u_19.ServerVCJoin.ScrollingFrame
                        if v_u_1297 then
                            local v_u_1299 = 6
                            task.spawn(function()
                                for _, v1300 in pairs(v_u_1297) do
                                    local v1301 = v1300[1]
                                    local _ = v1300[2]
                                    if v_u_2:IsFriendsWith(v1301) then
                                        v_u_1298.TextLabel.Text = v_u_1296 .. " Players (Friend\'s Server)"
                                    end
                                    if v_u_1299 ~= 0 then
                                        local v1302 = v_u_1298.Frame.Template:Clone()
                                        v1302.Visible = true
                                        v1302.Image = game.Players:GetUserThumbnailAsync(v1301, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180)
                                        v1302.Parent = v_u_1298.Frame
                                        v_u_1299 = v_u_1299 - 1
                                    end
                                end
                            end)
                        end
                        v_u_1298.Join.Activated:Connect(function()
                            v_u_17:FireServer("JoinVCServerID", v_u_1295)
                        end)
                    end
                end
                local v_u_1303 = nil
                v_u_1303 = v_u_19.ServerVCJoin.Close.MouseButton1Click:Connect(function()
                    v_u_1303:Disconnect()
                    v_u_19.ServerVCJoin.Visible = false
                    v_u_1277 = false
                    if v_u_1278 then
                        v_u_1278:Disconnect()
                    end
                    if v_u_1279 then
                        v_u_1279:Disconnect()
                    end
                end)
                task.wait()
                v_u_1276 = false
                return
            end
        else
            _G.Notification("No VC Access")
        end
    end)
end)
v_u_19.Crew.BottomLeft.Frame.Settings.Activated:Connect(function()
    v_u_19.Crew.Settings.Visible = not v_u_19.Crew.Settings.Visible
end)
v_u_19.Crew.BottomLeft.Frame.Vehicle.MouseButton1Click:Connect(function()
    v_u_19.SpawnVehicle.Visible = not v_u_19.SpawnVehicle.Visible
end)
local v_u_1304 = false
v_u_19.SpawnVehicle.Body.Spawn.MouseButton1Click:Connect(function()
    if not v_u_1304 then
        v_u_1304 = true
        v_u_17:FireServer("SpawnVehicle")
        v_u_19.SpawnVehicle.Visible = false
        task.wait(0.25)
        v_u_1304 = false
    end
end)
local v_u_1305 = false
v_u_19.Crew.BottomLeft.Frame.Task.MouseButton1Click:connect(function()
    v_u_19.ChallengeTask.Visible = not v_u_19.ChallengeTask.Visible
    if not v_u_1305 and v_u_19.ChallengeTask.Visible then
        v_u_1305 = true
        for _, v1306 in pairs(v_u_19.ChallengeTask.Body.TaskFrame:GetChildren()) do
            if v1306:IsA("Frame") and v1306.Name ~= "Template" then
                v1306:Destroy()
            end
        end
        local v1307, v1308 = game.ReplicatedStorage.RemoteFunction.RemoteFunction:InvokeServer("LoadTask")
        local v1309 = v1308 * 604800
        local v1310 = {}
        local v1311 = v1309 / 86400 % 31
        v1310.day = math.round(v1311)
        local v1312 = v1309 / 3600 % 24
        v1310.hour = math.round(v1312)
        local v1313 = v1309 / 60 % 60
        v1310.min = math.round(v1313)
        v_u_19.ChallengeTask.Body.Reset.Text = v1310.day .. ":" .. v1310.hour .. ":" .. v1310.min
        local v1314 = v_u_2.DataFolder.TaskInfo.Value
        local v1315 = v_u_2.DataFolder.TaskClaimed.Value
        local v1316 = game:GetService("HttpService"):JSONDecode(v1314)
        local v1317 = game:GetService("HttpService"):JSONDecode(v1315)
        for v_u_1318, v_u_1319 in pairs(v1307) do
            local v_u_1320 = v1316[v_u_1319[2][1]] or 0
            local v_u_1321 = v_u_19.ChallengeTask.Body.TaskFrame.Template:Clone()
            v_u_1321.Visible = true
            v_u_1321.Name = v_u_1319[2][1]
            v_u_1321.ImageLabel.Image = v_u_1319[3]
            v_u_1321.Frame.TaskText.Text = v_u_1319[4]
            v_u_1321.Frame.AmountText.Text = v_u_1320 .. "/" .. v_u_1319[2][2]
            local v1322 = v_u_1321.Frame.Frame.GreenBar
            local v1323 = UDim2.new
            local v1324 = v_u_1320 / v_u_1319[2][2]
            v1322.Size = v1323(math.clamp(v1324, 0, 1), 0, 1, 0)
            v_u_1321.Frame.RewardText.Text = v_u_1319[1][2]
            if v1317[tostring(v_u_1318)] then
                v_u_1321.Frame.ClaimButton.Text = "CLAIMED"
            else
                v_u_1321.Frame.UIStroke.Enabled = false
            end
            v_u_1321.Parent = v_u_19.ChallengeTask.Body.TaskFrame
            v_u_1321.Frame.ClaimButton.MouseButton1Click:Connect(function()
                v_u_17:FireServer("ClaimTask", v_u_1318)
                if v_u_1320 >= v_u_1319[2][2] then
                    v_u_1321.Frame.UIStroke.Enabled = true
                    v_u_1321.Frame.ClaimButton.Text = "CLAIMED"
                end
            end)
        end
        task.wait(1)
        v_u_1305 = false
    end
end)
v_u_19.ChallengeTask.Body.CloseButton.MouseButton1Click:connect(function()
    v_u_19.ChallengeTask.Visible = false
end)
while true do
    while true do
        v1172()
        if _G.Reduce_Lag == false then
            break
        end
        wait(60)
    end
    wait(1)
end

local modules = {}

function modules.OpenWeaponSkinsGUI()
    OpenWeaponSkinsGUI()
    print("local loaded.")
end

return modules