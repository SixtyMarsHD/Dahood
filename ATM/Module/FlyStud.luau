local Player = game.Players.LocalPlayer
local Char = Player.Character or Player.CharacterAdded:Wait()
local HumRoot = Char:WaitForChild("HumanoidRootPart")

local Toggle = getgenv().SharedData.ATM.Farming

local function Update()
	Char = Player.Character or Player.CharacterAdded:Wait()
	HumRoot = Char:WaitForChild("HumanoidRootPart")
end

local function FlyStud(Mode)
	
	local function SpawnStud()
		if not workspace:FindFirstChild("FlyPart") then
			local Part = Instance.new("Part", workspace)
			Part.Name = "FlyPart"
			Part.Size = Vector3.new(1,1,1)
			Part.Anchored = false
			Part.CanCollide = false
			Part.Transparency = 0
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

local function HumanoidDied()
	if Char and Char:WaitForChild("BodyEffects") and Char:WaitForChild("BodyEffects"):WaitForChild("Dead") then
		local Dead_Value = Char:WaitForChild("BodyEffects"):WaitForChild("Dead")
		Dead_Value:GetPropertyChangedSignal("Value"):Connect(function()
			if Dead_Value.Value == true then
				FlyStud("remove")
			end
		end)
	end
end

Player.CharacterAdded:Connect(function()
	Update()
	HumanoidDied()
    if Toggle then
        FlyStud("spawn")
    end
end)

getgenv().SharedData.ATM.Farming:GetPropertyChangedSignal("Value"):Connect(function()
    print("SharedData.ATM.Farming: changed flystud")
    Toggle = getgenv().SharedData.ATM.Farming

    if Toggle then
        FlyStud("spawn")
    else
        FlyStud("remove")
    end
end)

--FirstExecution
HumanoidDied()