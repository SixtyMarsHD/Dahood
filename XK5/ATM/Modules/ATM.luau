local CoreGui = game:GetService("CoreGui")
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")

local Player = game.Players.LocalPlayer
local Char = Player.Character or Player.CharacterAdded:Wait()
local HumRoot = Char:WaitForChild("HumanoidRootPart")
local Humanoid = Char:WaitForChild("Humanoid")
local Backpack = Player.Backpack
local PlayerGui = Player:WaitForChild("PlayerGui")

local MainScreenGui = PlayerGui:WaitForChild("MainScreenGui")
local CashierFolder = workspace:WaitForChild("Cashiers")

--//Wait for game Loaded
game.Players.LocalPlayer:WaitForChild("DataFolder")
task.wait(1)

--//Values
local VALUES = {
	CombatTool = nil,
	FlyStud = nil,

	Settings = {
		ATM = getgenv().SharedData.ATM.Farming,
		CollectOnDeath = getgenv().SharedData.Settings.CollectOnDeath,
		AutoMask = getgenv().SharedData.Settings.AutoMask,
		AntiMod = getgenv().SharedData.Settings.AntiMod,
		FpsBoost = getgenv().SharedData.Settings.FpsBoost,
		Disable3DRendering = getgenv().SharedData.Settings.Disable3DRendering,
		FpsCap = getgenv().SharedData.Settings.FpsCap,
		DiscordWebHook = getgenv().SharedData.Settings.DiscordWebHook,
		DiscordWebHook_URL = getgenv().SharedData.Settings.DiscordWebHook_URL,
	},
	
	Value = {
		Respawn = false,
		noclip = true,
		CollectOnDeath = false,
		HasMask = false,
		Jailed = false,
		SetUpFinished = false,
		AntiMod = nil,
	},
	
	State = {
		ATM = false,
		Others = false,
		AntiStomp = false,
		AntiAFK = false,
		CollectOnDeath = true,
        BuyMask = false,
		Void = false,
		UnJail = false,
		OnKick = false,
	},
}

--//WebHook
function Webhook(Mode, Modname)

	local function Online_webhook()
		local body = [[{
  			"embeds": [{
      			"title": "Status",
      			"color": 65280,
      			"fields": [
        			{
          				"name": "]]..game.Players.LocalPlayer.DisplayName..[[",
          				"value": "*@]]..game.Players.LocalPlayer.Name..[[*",
          				"inline": true
        			},
        			{
          				"name": "\u200b",
          				"value": "\u200b",
          				"inline": true
        			},
        			{
          				"name": "Status:",
          				"value": "*Online*",
          				"inline": true
        			}
				]
			}]
    	}]]

		request({
    		Url = DiscordWebHook_URL,
    		Method = "POST",
    		Headers = {
        		["Content-Type"] = "application/json"
    		},
    		Body = body
		})
	end

	local function Offline_webhook()
		local body = [[{
  			"embeds": [{
      			"title": "Status",
      			"color": 16711680,
      			"fields": [
        			{
          				"name": "]]..game.Players.LocalPlayer.DisplayName..[[",
          				"value": "*@]]..game.Players.LocalPlayer.Name..[[*",
          				"inline": true
        			},
        			{
          				"name": "\u200b",
          				"value": "\u200b",
          				"inline": true
        			},
        			{
          				"name": "Status:",
          				"value": "*Offline*",
          				"inline": true
        			}
				]
			}]
    	}]]

		request({
    		Url = DiscordWebHook_URL,
    		Method = "POST",
    		Headers = {
        		["Content-Type"] = "application/json"
    		},
    		Body = body
		})
	end

	local function AntiMod_webhook(name)
		local body = [[{
  			"embeds": [{
      			"title": "Status",
      			"color": 16711680,
      			"fields": [
        			{
          				"name": "]]..game.Players.LocalPlayer.DisplayName..[[",
          				"value": "*@]]..game.Players.LocalPlayer.Name..[[*",
          				"inline": true
        			},
        			{
          				"name": "\u200b",
          				"value": "\u200b",
          				"inline": true
        			},
        			{
          				"name": "Status:",
          				"value": "*Offline*",
          				"inline": true
        			},
					{
          				"name": "Anti-Mod:",
          				"value": "*@]]..name..[[*",
          				"inline": true
        			},
				]
			}]
    	}]]

		request({
    		Url = DiscordWebHook_URL,
    		Method = "POST",
    		Headers = {
        		["Content-Type"] = "application/json"
    		},
    		Body = body
		})
	end

	if VALUES.Settings.DiscordWebHook then
		if Mode == "Online" then
			Online_webhook()
		elseif Mode == "Offline" then
			Offline_webhook()
		elseif Mode == "AntiMod" then
			AntiMod_webhook(Modname)
		end
	end
	
end

--//Modules
function Setup()
	setfpscap(tonumber(VALUES.Settings.FpsCap))


	if VALUES.Settings.FpsBoost then
		local DeletTable = {}
		local Items = 0
		local Count = 0
		--for _, v in pairs(workspace.Ignored:GetChildren()) do
			--if v.Name ~= "Drop" and v.Name ~= "Shop" and v.Name ~= "SnowBlock" then
				--table.insert(DeletTable, v)
			--end
		--end
		for _, v in pairs(workspace.MAP:GetChildren()) do
			table.insert(DeletTable, v)
		end
		for _, v in pairs(workspace.MAP.Map:GetChildren()) do
			table.insert(DeletTable, v)
		end
		for _, v in pairs(workspace.Ignored:GetChildren()) do
			
			table.insert(DeletTable, v)
			
		end

		Items = #DeletTable
		for _, v in pairs(DeletTable) do
			for _, part in pairs(v:GetChildren()) do 

					local highlight = Instance.new("Highlight", part)
					highlight.FillTransparency = 0
					highlight.FillColor = Color3.new(1, 0, 0)
					highlight.OutlineColor = Color3.new(0, 0, 0)

					task.delay(2.5, function()
					part:Destroy()
					end)
					if math.random(1, 1) == 1 then
					task.wait()
					end
					Count += 1
			end
		end
	end

	if VALUES.Settings.Disable3DRendering then
		game:GetService("RunService"):Set3dRenderingEnabled(false)
	end

	RunService.Stepped:Connect(function()
		if VALUES.Settings.ATM then
			Player.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam
			Player.CameraMaxZoomDistance = 100000
			game.Lighting.FogStart = 1000000000
			game.Lighting.FogEnd = 1000000000
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") and v.CanCollide then
					v.CanCollide = false
				end
			end
		else
			Player.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Zoom
			Player.CameraMaxZoomDistance = 30
			game.Lighting.FogStart = 0
			game.Lighting.FogEnd = 500
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") and not v.CanCollide then
					v.CanCollide = true
				end
			end
		end

		if VALUES.Settings.ATM and Humanoid then
			Humanoid.AutoRotate = false
			Humanoid.PlatformStand = true
		elseif Humanoid then
			Humanoid.AutoRotate = true
			Humanoid.PlatformStand = false
		end

        if Backpack:FindFirstChild("Combat") or Char:FindFirstChild("Combat") then
			CombatTool = Backpack:FindFirstChild("Combat") or Char:FindFirstChild("Combat")
		else
			CombatTool = nil
		end
	end)
	VALUES.Value.SetUpFinished = true
end

function FlyStud(Mode)
	
	local function SpawnStud()
		if not workspace:FindFirstChild("FlyPart") then
			local Part = Instance.new("Part", workspace)
			Part.Name = "FlyPart"
			Part.Size = Vector3.new(1,1,1)
			Part.Anchored = false
			Part.CanCollide = false
			Part.Transparency = 0.5
			Part.Position = HumRoot.Position
			VALUES.FlyStud = Part

			if not Part:FindFirstChild("Weld") then
				local Weld = Instance.new("Weld", Part)
				Weld.Part0 = Part
				Weld.Part1 = HumRoot
			end

			if not Part:FindFirstChild("BodyVelocity") then
				local BodyVelocity = Instance.new("BodyVelocity", Part)
				BodyVelocity.Velocity = Vector3.new(0, 0, 0)
				BodyVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)
			end
		end
	end
	
	local function RemoveStud()
		if workspace:FindFirstChild("FlyPart") then
			workspace:FindFirstChild("FlyPart"):Destroy()
			VALUES.FlyStud = nil
		end
	end
	
	if Mode == "spawn" then
		SpawnStud()
	elseif Mode == "remove" then
		RemoveStud()
	end
	
end

function AntiStomp()
	if (Char and Char:FindFirstChild("BodyEffects") and Char:FindFirstChild("BodyEffects"):FindFirstChild("K.O") and Char:FindFirstChild("BodyEffects"):FindFirstChild("Dead")) or (Char and Char:FindFirstChild("GRABBING_CONSTRAINT")) then
		local KO_Value = Char:FindFirstChild("BodyEffects"):FindFirstChild("K.O")
		local Dead_Value = Char:FindFirstChild("BodyEffects"):FindFirstChild("Dead")
		local GRABBING = Char:FindFirstChild("GRABBING_CONSTRAINT")
		if (KO_Value.Value and not VALUES.State.AntiStomp) or (GRABBING and not VALUES.State.AntiStomp) or (Dead_Value.Value and not VALUES.State.AntiStomp) then
			VALUES.State.AntiStomp = true
			Humanoid.Health = 0
			task.delay(2.5, function()
				VALUES.Value.CollectOnDeathath = false
			end)
			repeat
				task.wait()
			until VALUES.FlyStud ~= nil
			VALUES.State.AntiStomp = false
		end
	end
end

function AntiAFK()
	if not VALUES.State.AntiAFK then
		VALUES.State.AntiAFK = true
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
		task.delay(60, function()
			VALUES.State.AntiAFK = false
		end)
	end
end

function AntiSeat()
	for _, obj in ipairs(game.Workspace:GetDescendants()) do
		if obj:IsA("Seat") or obj:IsA("VehicleSeat") then
			task.spawn(function()
				if Humanoid and obj.Occupant and obj.Occupant == Humanoid then
					repeat
                        Humanoid.Jump = true
						task.wait(0.5)
					until obj.Occupant ~= Humanoid
				end
				obj.Disabled = true
			end)
		end
	end
end

function AntiMod(player, info)
	if VALUES.Settings.AntiMod and palyer and (player:IsInGroup(10604500) or player:IsInGroup(8068202)) then
		if info == "Joined" then
			VALUES.Value.AntiMod = player.Name
        	Player:Kick(player.Name.." Joined the game! (Anti-Mod)")
		elseif info == "is already in game" then
			VALUES.Value.AntiMod = player.Name
			Player:Kick(player.Name.." Is already in the game! (Anti-Mod)")
		end
    end
end

function AutoMask()
	if Char and not Char:FindFirstChild("In-gameMask") then
        VALUES.State.BuyMask = true
		if Char:FindFirstChild("[Mask]") then
			local Mask = Char:FindFirstChild("[Mask]")
			Mask:Activate()
			Mask.Parent = Backpack
		elseif Backpack:FindFirstChild("[Mask]") then
			local Mask = Backpack:FindFirstChild("[Mask]")
			Mask.Parent = Char
			Mask:Activate()
			Mask.Parent = Backpack
		elseif not Backpack:FindFirstChild("[Mask]") and VALUES.FlyStud ~= nil then
			local MaskBuyFolder = workspace:FindFirstChild("Ignored"):FindFirstChild("Shop"):FindFirstChild("[Surgeon Mask] - $27")
			local ClickDetector = MaskBuyFolder:FindFirstChild("ClickDetector")
			local Part = MaskBuyFolder:FindFirstChild("Head")
			VALUES.FlyStud.CFrame = Part.CFrame + Vector3.new(0, 3, 0)
			wait(0.25)
			fireclickdetector(ClickDetector)		
			local Mask = Backpack:WaitForChild("[Mask]", 5)
			if Char and Mask then
				Mask.Parent = Char
				Mask:Activate()
				Mask.Parent = Backpack
			end
		end
        VALUES.State.BuyMask = false
	end
end

function AutoUnJail()
	if Char then
        VALUES.State.UnJail = true
		if Char:FindFirstChild("[Key]") then
			local Key = Char:FindFirstChild("[Key]")
			Key:Activate()
			Key.Parent = Backpack
		elseif Backpack:FindFirstChild("[Key]") then
			local Key = Backpack:FindFirstChild("[Key]")
			Key.Parent = Char
			Key:Activate()
			Key.Parent = Backpack
		elseif not Backpack:FindFirstChild("[Key]") and VALUES.FlyStud ~= nil then
			local KeyBuyFolder = workspace:FindFirstChild("Ignored"):FindFirstChild("Shop"):FindFirstChild("[Key] - $137")
			local ClickDetector = KeyBuyFolder:FindFirstChild("ClickDetector")
			local Part = KeyBuyFolder:FindFirstChild("Head")
			VALUES.FlyStud.CFrame = Part.CFrame + Vector3.new(0, 3, 0)
			wait(0.25)
			fireclickdetector(ClickDetector)		
			local Key = Backpack:WaitForChild("[Key]", 5)
			if Char and Key then
				Key.Parent = Char
				Key:Activate()
				Key.Parent = Backpack
			end
		end
        VALUES.State.UnJail = false
	end
end

function Void(value)
	if value == true and VALUES.FlyStud ~= nil then
		if VALUES.State.Void == true then return end
		VALUES.State.Void = true
		task.spawn(function()
			while VALUES.State.Void == true do
				if VALUES.State.Void then
				VALUES.FlyStud.CFrame = CFrame.new(500000, 500000, 0) end
				task.wait()
				if VALUES.State.Void then
				VALUES.FlyStud.CFrame = CFrame.new(0, 25000, 500000) end
				task.wait()
				if VALUES.State.Void then
				VALUES.FlyStud.CFrame = CFrame.new(-500000, 500000, 0) end
				task.wait()
				if VALUES.State.Void then
				VALUES.FlyStud.CFrame = CFrame.new(0, 25000, -500000) end
				task.wait()
			end

			task.wait()
			VALUES.FlyStud.Velocity = Vector3.new(0,0,0)
			VALUES.FlyStud.RotVelocity = Vector3.new(0,0,0)
			VALUES.State.Void = false
		end)
	else
		VALUES.State.Void = false
	end
end

function FastCollect()
	if VALUES.Settings.ATM and VALUES.Settings.CollectOnDeath and VALUES.Value.CanCollectOnDeath and VALUES.State.CollectOnDeath then
		VALUES.State.CollectOnDeath = false
		for _, part in pairs(workspace:FindFirstChild("Ignored"):FindFirstChild("Drop"):GetChildren()) do
			if part:IsA("BasePart") and part.Name == "MoneyDrop" and HumRoot then
				if (part.Position - HumRoot.Position).Magnitude <= 10 then
					if part:FindFirstChild("ClickDetector") then
						fireclickdetector(part:FindFirstChild("ClickDetector"))
					end
                    task.wait()
					break
				end
			end
		end		
		VALUES.State.CollectOnDeathath = true
	end
end

local function AllDeadInFolder()
	for _, Model in pairs(CashierFolder:GetChildren()) do
		if Model.Name == "CA$HIER" then
			for _, v in pairs(Model:GetChildren()) do
				if v:IsA("Humanoid") then
					if v.Health > 0 then
						return false
					end
				end
			end
		end
	end
	return true
end

local function ATM()

	if AllDeadInFolder() then
		Void(true)
		return
	else
		Void(false)
	end

	for _, Model in pairs(CashierFolder:GetChildren()) do
		if Model.Name == "CA$HIER" then
			for _, v in pairs(Model:GetChildren()) do
				if v:IsA("Humanoid") then
					if v.Health >= 0 and VALUES.FlyStud ~= nil then

                        if CombatTool then CombatTool.Parent = Char end
                        
                        local function AntiStuck()
	                        if Model:FindFirstChild("Head") then
		                        local Head = Model:FindFirstChild("Head")
		                        local headpos = Vector3.new(math.round(Head.Position.X), math.round(Head.Position.Y), math.round(Head.Position.Z))
		                        if headpos == Vector3.new(-624, 25, -285) then
			                        return -1.5
		                        elseif headpos == Vector3.new(-627, 25, -285) then
			                        return 1.5
                                else
                                    return 0
		                        end
	                        end					
                        end

						local Head = Model:FindFirstChild("Open")
						VALUES.FlyStud.CFrame = CFrame.new(
							Head.Position + Head.CFrame.LookVector * 0.5 + Head.CFrame.RightVector * AntiStuck(),
							Head.Position + Head.CFrame.LookVector * 0.5 + Head.CFrame.RightVector * AntiStuck() + Head.CFrame.LookVector
						)
						
						if v.Health >= 0 and CombatTool and not VALUES.Value.Respawn and Char:FindFirstChild("Combat") then 
							CombatTool:Activate()
                            task.wait(0.5)
                            if Char:FindFirstChild("BodyEffects"):FindFirstChild("Attacking").Value == true then
							    task.wait(2.5)
                            end
							if CombatTool and not VALUES.Value.Respawn and Char:FindFirstChild("Combat") then
								CombatTool:Deactivate()
							end
						end

						task.wait(0.2)
						if v.Health >= 0 and CombatTool and not VALUES.Value.Respawn and Char:FindFirstChild("Combat") then
							CombatTool:Activate()
                            task.wait(0.5)
							if Char:FindFirstChild("BodyEffects"):FindFirstChild("Attacking").Value == true then
							    task.wait(2)
                            end
							if CombatTool and not VALUES.Value.Respawn and Char:FindFirstChild("Combat") then
								CombatTool:Deactivate()
							end
						end

						if CombatTool then CombatTool.Parent = Backpack end

						for _, part in pairs(workspace:FindFirstChild("Ignored"):FindFirstChild("Drop"):GetChildren()) do
							if part:IsA("BasePart") and not VALUES.Value.Respawn then
								if part.Name == "MoneyDrop" and part:FindFirstChild("ClickDetector") and VALUES.FlyStud ~= nil then
									if (part.Position - Head.Position).Magnitude <= 20 then
										VALUES.FlyStud.CFrame = CFrame.new(part.Position - Vector3.new(0, 5, 0))
										task.wait(0.2)

										while part and part.Parent and VALUES.FlyStud do
											VALUES.FlyStud.CFrame = CFrame.new(part.Position - Vector3.new(0, 5, 0))
											task.wait()
											if part:FindFirstChild("ClickDetector") and not VALUES.Value.Respawn then
											fireclickdetector(part:FindFirstChild("ClickDetector"))
											end
										end

									end
								end
							end
						end
						return
					end
				end
			end
		end
	end
end

function Update()
	Char = Player.Character or Player.CharacterAdded:Wait()
	HumRoot = Char:WaitForChild("HumanoidRootPart")
	Humanoid = Char:WaitForChild("Humanoid")
	Backpack = Player.Backpack
	MainScreenGui = PlayerGui:WaitForChild("MainScreenGui")
end

function HumanoidDied()
	if Char and Char:WaitForChild("BodyEffects") and Char:WaitForChild("BodyEffects"):WaitForChild("Dead") then
		local Dead_Value = Char:WaitForChild("BodyEffects"):WaitForChild("Dead")
		Dead_Value:GetPropertyChangedSignal("Value"):Connect(function()
			if Dead_Value.Value == true then
				VALUES.Value.Respawn = true
				FlyStud("remove")
				VALUES.Value.HasMask = false
				VALUES.Value.CanCollectOnDeathath = true
				task.delay(2.5, function()
					VALUES.Value.CanCollectOnDeath = false
				end)
			end
		end)
	end
end

Player.CharacterAdded:Connect(function()
	Update()
	HumanoidDied()
	Setup()
	FlyStud("spawn")
	task.delay(0.25, function()
		VALUES.Value.Respawn = false
	end)
end)

game.Players.PlayerAdded:Connect(function(player)
    AntiMod(player, "Joined")
end)

game.Players.PlayerRemoving:Connect(function(player)
	
end)

task.spawn(function()
	while task.wait(0.1) do
		local promptGui = CoreGui:FindFirstChild("RobloxPromptGui")
		if promptGui then
			local overlay = promptGui:FindFirstChild("promptOverlay")
			if overlay then
				local errorPrompt = overlay:FindFirstChild("ErrorPrompt")
				if errorPrompt and not VALUES.State.OnKick then
					VALUES.State.OnKick = true
					if VALUES.Value.AntiMod ~= nil then
						Webhook(AntiMod, VALUES.Value.AntiMod)
					else
						Webhook(Offline)
					end
				end
			end
		end
	end
end)

for _, player in pairs(game.Players:GetChildren()) do
	if player.Name ~= Player.Name then
		AntiMod(player, "is already in game")
	end
end

--//Update Loops
RunService.Stepped:Connect(function()
	FastCollect()
	AntiStomp()
end)

task.spawn(function()
	while not VALUES.Value.SetUpFinished do
		task.wait()
	end

    while wait(0.05) do

		task.spawn(function()
			VALUES.Settings.ATM = getgenv().SharedData.ATM.Farming
		end)

		task.spawn(function()
			if Char and not Char:FindFirstChild("In-gameMask") and not VALUES.Value.Respawn then
            	VALUES.Value.HasMask = false
       		elseif Char and Char:FindFirstChild("In-gameMask") and not VALUES.Value.Respawn then
            	VALUES.Value.HasMask = true
        	end

			if Char and Char.BodyEffects and Char.BodyEffects.Cuff then
    			VALUES.Value.Jailed = Char.BodyEffects.Cuff.Value
			end

		end)

		task.spawn(function()
			if VALUES.Settings.ATM then
            	while VALUES.Settings.ATM and not VALUES.State.ATM and not VALUES.Value.Respawn and (not VALUES.Settings.AutoMask or VALUES.Value.HasMask) and not VALUES.Value.Jailed do
                	VALUES.State.ATM = true
                	if VALUES.FlyStud == nil then
                    	FlyStud("spawn")
                	end
                	print("ATMing...")
                	ATM()
                	task.wait(0.05)
                	VALUES.State.ATM = false
            	end
        	else
            	FlyStud("remove")
        	end
		end)

		task.spawn(function()
			if VALUES.Settings.ATM and not VALUES.Value.Respawn and VALUES.Settings.AutoMask and not VALUES.State.BuyMask and not VALUES.Value.HasMask and not VALUES.Value.Jailed then
                AutoMask()
			end
		end)

		task.spawn(function()
			if VALUES.Settings.ATM and not VALUES.Value.Respawn and not VALUES.State.UnJail and VALUES.Value.Jailed then
                AutoUnJail()
			end
		end)

		task.spawn(function()
			if VALUES.Settings.ATM then
				AntiAFK()
			end
		end)

    end
end)

--FirstExecute
HumanoidDied()
AntiSeat()
Setup()
FlyStud("spawn")
Webhook("Online")