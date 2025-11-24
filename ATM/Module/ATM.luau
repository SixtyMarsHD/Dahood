local VirtualUser = game:GetService("VirtualUser")
local RunService = game:game:GetService("RunService")

local Player = game.Players.LocalPlayer
local Char = Player.Character or Player.CharacterAdded:Wait()
local HumRoot = Char:WaitForChild("HumanoidRootPart")
local Humanoid = Char:WaitForChild("Humanoid")
local Backpack = Player.Backpack
local PlayerGui = Player:WaitForChild("PlayerGui")

local MainScreenGui = PlayerGui:WaitForChild("MainScreenGui")
local CashierFolder = workspace:WaitForChild("Cashiers")

local VALUES = {
	FlyStud = nil,

	Settings = {
		Farming = getgenv().SharedData.ATM.Farming,
		FastCollect = getgenv().SharedData.FastCollect,
	},
	
	Value = {
		Respawn = false,
		noclip = true,
		CanFastCollect = false,
	},
	
	State = {
		ATM = false,
		Others = false,
		AntiStomp = false,
		AntiAFK = false,
		CanFastCollect = false,
	},
}

print("VALUES TRUE")

local function Setup()
	RunService.Stepped:Connect(function()
		if VALUES.Value.noclip and Farming then
			for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") and v.CanCollide then
					v.CanCollide = false
				end
			end
		else
			for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") and not v.CanCollide then
					v.CanCollide = true
				end
			end
		end
	end)
end

print("Setup TRUE")

local function FlyStud(Mode)
	
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

print("FlyStud TRUE")

local function AntiStomp()
	if (Char and Char:FindFirstChild("BodyEffects") and Char:FindFirstChild("BodyEffects"):FindFirstChild("K.O") and Char:FindFirstChild("BodyEffects"):FindFirstChild("Dead")) or (Char and Char:FindFirstChild("GRABBING_CONSTRAINT")) then
		local KO_Value = Char:FindFirstChild("BodyEffects"):FindFirstChild("K.O")
		local Dead_Value = Char:FindFirstChild("BodyEffects"):FindFirstChild("Dead")
		local GRABBING = Char:FindFirstChild("GRABBING_CONSTRAINT")
		if (KO_Value.Value and not VALUES.State.AntiStomp) or (GRABBING and not VALUES.State.AntiStomp) or (Dead_Value.Value and not VALUES.State.AntiStomp) then
			VALUES.State.AntiStomp = true
			Humanoid.Health = 0
			task.delay(1, function()
				VALUES.Value.CanFastCollect = false
			end)
			repeat
				task.wait()
			until VALUES.FlyStud ~= nil
			VALUES.State.AntiStomp = false
		end
	end
end

print("AntiStomp TRUE")

local function AntiAFK()
	if not VALUES.State.AntiAFK then
		VALUES.State.AntiAFK = true
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
		task.delay(60, function()
			VALUES.State.AntiAFK = false
		end)
	end
end

print("AntiAFK TRUE")

local function AntiSeat()
	for _, obj in ipairs(game.Workspace:GetDescendants()) do
		if obj:IsA("Seat") or obj:IsA("VehicleSeat") then
			task.spawn(function()
				if Humanoid and obj.Occupant and obj.Occupant == Humanoid then
					Humanoid.Jump = true
					repeat
						task.wait()
					until obj.Occupant ~= Humanoid
				end
				obj.Disabled = true
			end)
		end
	end
end

print("AntiSeat TRUE")

local function FastCollect()
	if VALUES.Settings.Farming and not VALUES.State.AntiStomp and not VALUES.State.CanFastCollect and VALUES.Value.CanFastCollect and VALUES.Settings.FastCollect then
		VALUES.State.CanFastCollect = true
		for _, part in pairs(workspace:WaitForChild("Ignored"):WaitForChild("Drop"):GetChildren()) do
			if part:IsA("BasePart") and part.Name == "MoneyDrop" and part:FindFirstChild("ClickDetector") and HumRoot then
				if (part.Position - HumRoot.Position).Magnitude <= 13.8 then
					fireclickdetector(part:FindFirstChild("ClickDetector"))
					break
				end
			end
		end		
		VALUES.State.CanFastCollect = false
	end
end

local function Punch()
	if Backpack:FindFirstChild("Combat") then
		Backpack:FindFirstChild("Combat").Parent = Char
		task.wait()
	end
							
	local ChargeButton = MainScreenGui:WaitForChild("ChargeButton")

	local connections = getconnections(ChargeButton.MouseButton1Click)
	for i, connection in pairs(connections) do
		if connection.Function then
			connection.Function()
		end
	end
end

local function AntiStuck(Model)
	if Model:FindFirstChild("Head") then
		local Head = Model:FindFirstChild("Head")
		local headpos = Vector3.new(math.round(Head.Position.X), math.round(Head.Position.Y), math.round(Head.Position.Z))
		if headpos == Vector3.new(-624, 25, -285) then
			return -1.5
		elseif headpos == Vector3.new(-627, 25, -285) then
			return 1.5
		end
		return 0
	end					
end

local function ATM()
	for _, Model in pairs(CashierFolder:GetChildren()) do
		if Model.Name == "CA$HIER" then
			for _, v in pairs(Model:GetChildren()) do
				if v:IsA("Humanoid") then
					if v.Health >= 0 and VALUES.FlyStud ~= nil then

						local Head = Model:FindFirstChild("Open")
						VALUES.FlyStud.CFrame = CFrame.new(
							Head.Position + Head.CFrame.LookVector * 0.5 + Head.CFrame.RightVector * AntiStuck(Model),
							Head.Position + Head.CFrame.LookVector * 0.5 + Head.CFrame.RightVector * AntiStuck(Model) + Head.CFrame.LookVector
						)
						
						task.delay(0.25, function()
							VALUES.Value.CanFastCollect = true
						end)

						if v.Health >= 0 then
							Punch()
							task.wait(2.9)
						end
						if v.Health >= 0 then
						Punch()
							task.wait(2.5)
						end
						
						if Char:FindFirstChild("Combat") then
							Char:FindFirstChild("Combat").Parent = Backpack
						end
						
						for _, part in pairs(workspace:WaitForChild("Ignored"):WaitForChild("Drop"):GetChildren()) do
							
							if VALUES.State.AntiStomp then
								repeat 
									task.wait()
								until not VALUES.State.AntiStomp and not VALUES.Value.Respawn and VALUES.FlyStud ~= nil
							end
							
							if part:IsA("BasePart") then
								if part.Name == "MoneyDrop" and part:FindFirstChild("ClickDetector") and VALUES.FlyStud ~= nil then
									if (part.Position - Head.Position).Magnitude <= 20 then
										VALUES.FlyStud.CFrame = CFrame.new(part.Position - Vector3.new(0, 5, 0))
										task.wait(0.2)
										fireclickdetector(part:FindFirstChild("ClickDetector"))
										task.wait(0.4)
									end
								end
							end
						end
						VALUES.Value.CanFastCollect = false
						return
					end
				end
			end
		end
	end
end

local function Update()
	Char = Player.Character or Player.CharacterAdded:Wait()
	HumRoot = Char:WaitForChild("HumanoidRootPart")
	Humanoid = Char:WaitForChild("Humanoid")
	Backpack = Player.Backpack
	MainScreenGui = PlayerGui:WaitForChild("MainScreenGui")
end

local function HumanoidDied()
	if Char and Char:WaitForChild("BodyEffects") and Char:WaitForChild("BodyEffects"):WaitForChild("Dead") then
		local Dead_Value = Char:WaitForChild("BodyEffects"):WaitForChild("Dead")
		Dead_Value:GetPropertyChangedSignal("Value"):Connect(function()
			if Dead_Value.Value == true then
				VALUES.Value.Respawn = true
				FlyStud("remove")
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


RunService.Stepped:Connect(function()
	FastCollect()
	AntiStomp()
end)

task.spawn(function()
	while wait(0.05) do
		
		task.spawn(function()
			VALUES.Settings.Farming = getgenv().SharedData.ATM.Farming
		end)

		task.spawn(function()
			if not VALUES.Value.Respawn and not VALUES.State.ATM and VALUES.Settings.Farming then
				VALUES.State.ATM = true
				FlyStud("spawn")
				ATM()
				VALUES.State.ATM = false
			elseif not VALUES.Settings.Farming then
				FlyStud("remove")
				task.wait(1)
			end
		end)
		
		task.spawn(function()
			if VALUES.Settings.Farming and not VALUES.State.Others then
				VALUES.State.Others = true
				AntiAFK()
				VALUES.State.Others = false
			end
		end)
		
	end
end)

--FirstExecute
HumanoidDied()
AntiSeat()
Setup()
FlyStud("spawn")
