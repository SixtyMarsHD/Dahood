local VirtualUser = game:GetService("VirtualUser")

local Player= game.Players.LocalPlayer
local Char = Player.Character or Player.CharacterAdded:Wait()
local HumRoot = Char:WaitForChild("HumanoidRootPart")
local Humanoid = Char:WaitForChild("Humanoid")
local Backpack = Player.Backpack

--Settings
local Settings_CashAura = getgenv().SharedData.CashAura.Farming
local MoneyPriority_TargetMoneyDrop = nil
local MoneyPriority_MaxMoney = 0
local Respawn = false
--States
local State_Void = false
local State_AntiAFK = false
local State_AntiStomp = false
local State_CashAura = false
local State_Others = false
local State_AntiSeat = false
local State_VoidCash = false

local function Update()
	Char = Player.Character or Player.CharacterAdded:Wait()
	HumRoot = Char:WaitForChild("HumanoidRootPart")
	Humanoid = Char:WaitForChild("Humanoid")
	Backpack = Player.Backpack
end

local function AntiStomp()
	if (Char and Char:FindFirstChild("BodyEffects") and Char:FindFirstChild("BodyEffects"):FindFirstChild("K.O") and Char:FindFirstChild("BodyEffects"):FindFirstChild("Dead")) or (Char and Char:FindFirstChild("GRABBING_CONSTRAINT")) then
		local KO_Value = Char:FindFirstChild("BodyEffects"):FindFirstChild("K.O")
		local Dead_Value = Char:FindFirstChild("BodyEffects"):FindFirstChild("Dead")
		local GRABBING = Char:FindFirstChild("GRABBING_CONSTRAINT")
		if (KO_Value.Value and not State_AntiStomp) or (GRABBING and not State_AntiStomp) or (Dead_Value.Value and not State_AntiStomp) then
			State_AntiStomp = true
			local oldpos = HumRoot.CFrame
			Humanoid.Health = 0
			Player.CharacterAdded:Wait():WaitForChild("HumanoidRootPart")
			task.wait()
			HumRoot.CFrame = oldpos + Vector3.new(0, 3, 0)
		end
		State_AntiStomp = false
	end
end
	

local function AntiAFK()
	if not State_AntiAFK then
		State_AntiAFK = true
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
		task.delay(60, function()
			State_AntiAFK = false
		end)				
	end	
end

local function AntiSeat(value)
	for _, obj in ipairs(game.Workspace:GetDescendants()) do
		if obj:IsA("Seat") or obj:IsA("VehicleSeat") then
			task.spawn(function()
				if Humanoid and obj.Occupant and obj.Occupant == Humanoid then
					Humanoid.Jump = true
					repeat
						task.wait()
					until obj.Occupant ~= Humanoid
				end
				obj.Disabled = value
			end)
		end
	end
end	

local function MoneyPriority()
	local MoneyDropFolder = workspace:WaitForChild("Ignored"):WaitForChild("Drop")
	MoneyPriority_TargetMoneyDrop = nil
	MoneyPriority_MaxMoney = 0

	for _, Part in pairs(MoneyDropFolder:GetDescendants()) do
		if Part:IsA("Part") then
			local Billboard = Part:FindFirstChildOfClass("BillboardGui")
			if Billboard then
				local Label = Billboard:FindFirstChildOfClass("TextLabel")
				if Label and Label.Text:match("^%$[%d,]+") then
					local moneyStr = Label.Text:sub(2):gsub(",", "")
					local money = tonumber(moneyStr)
					if money and money > MoneyPriority_MaxMoney then 
						MoneyPriority_TargetMoneyDrop = Part
						MoneyPriority_MaxMoney = money
					end
				end
			end
		end
	end
end

local function Void(value)
	if value == true then
		if State_Void == true then return end
		State_Void = true
		task.spawn(function()
			while State_Void == true do
				task.wait()
				HumRoot.CFrame = CFrame.new(500000, 25000, 0)
				task.wait()
				HumRoot.CFrame = CFrame.new(0, 25000, 500000)
				task.wait()
				HumRoot.CFrame = CFrame.new(-500000, 25000, 0)
				task.wait()
				HumRoot.CFrame = CFrame.new(0, 25000, -500000)
				task.wait()
				HumRoot.Velocity = Vector3.new(0,0,0)
				HumRoot.RotVelocity = Vector3.new(0,0,0)
			end
			task.wait()
			HumRoot.Velocity = Vector3.new(0,0,0)
			HumRoot.RotVelocity = Vector3.new(0,0,0)
			State_Void = false
		end)
	else
		State_Void = false
	end
end

local function CashAura()
	MoneyPriority()
	if MoneyPriority_TargetMoneyDrop and MoneyPriority_TargetMoneyDrop:FindFirstChildOfClass("ClickDetector") then
		Void(false)
		wait(0.1)
		if not State_TpBack then
			HumRoot.CFrame = MoneyPriority_TargetMoneyDrop.CFrame + Vector3.new(0, 3, 0)
			wait(0.25)
			local ClickDetector = MoneyPriority_TargetMoneyDrop:FindFirstChildOfClass("ClickDetector")
			if ClickDetector then
				LastMoneyPart = MoneyPriority_TargetMoneyDrop
				fireclickdetector(ClickDetector)
			end
			if Settings_CashAura then
				Void(true)
			end
		end
		wait(2.15)
	end
end

local function HumanoidDied()
	local Dead_Value = Char:WaitForChild("BodyEffects"):WaitForChild("Dead")
	if Dead_Value then
		Dead_Value:GetPropertyChangedSignal("Value"):Connect(function()
			if Dead_Value.Value == true then
				Respawn = true
				Void(false)
			end
		end)
	end
end

Player.CharacterAdded:Connect(function()
	Update()
	HumanoidDied()
	Respawn = false
end)

task.spawn(function()
	while wait() do
		Settings_CashAura = getgenv().SharedData.CashAura.Farming

		task.spawn(function()
			if Settings_CashAura and not State_CashAura then
				State_CashAura = true
				State_VoidCash = false
				CashAura()
				State_CashAura = false
			end
		end)

		task.spawn(function()
			if Settings_CashAura and not State_Others then
				State_Others = true
				AntiStomp()
				AntiAFK()
				if not State_AntiSeat then
					State_AntiSeat = true
					AntiSeat(true)
				end
				State_Others = false
			elseif not Settings_CashAura and State_AntiSeat then
				State_AntiSeat = false
				AntiSeat(false)
			elseif not Settings_CashAura and not State_VoidCash then
				State_VoidCash = true
				Void(false)
			end
		end)
	end
end)

--FirstExecute
HumanoidDied()