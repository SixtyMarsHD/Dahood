local Player = game.Players.LocalPlayer
local Char = Player.Character or Player.CharacterAdded:Wait()
local HumRoot = Char:WaitForChild("HumanoidRootPart")
local Humanoid = Char:WaitForChild("Humanoid")
local Backpack = Player.Backpack
local PlayerGui = Player:WaitForChild("PlayerGui")

local MainScreenGui = PlayerGui:WaitForChild("MainScreenGui")
local CashierFolder = workspace:WaitForChild("Cashiers")

local Toggle = getgenv().SharedData.ATM.Farming
local FlyStud = nil

local State = {
    ATM = false
}

local function Update()
	Char = Player.Character or Player.CharacterAdded:Wait()
	HumRoot = Char:WaitForChild("HumanoidRootPart")
	Humanoid = Char:WaitForChild("Humanoid")
	Backpack = Player.Backpack
	MainScreenGui = PlayerGui:WaitForChild("MainScreenGui")
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
					if v.Health >= 0 and FlyStud then

						local Head = Model:FindFirstChild("Open")
						VALUES.FlyStud.CFrame = CFrame.new(
							Head.Position + Head.CFrame.LookVector * 0.5 + Head.CFrame.RightVector * AntiStuck(Model),
							Head.Position + Head.CFrame.LookVector * 0.5 + Head.CFrame.RightVector * AntiStuck(Model) + Head.CFrame.LookVector
						)

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
							if part:IsA("BasePart") and (part.Position - Head.Position).Magnitude <= 20 then
								if part.Name == "MoneyDrop" and part:FindFirstChild("ClickDetector") and FlyStud then
									local ClickDetector = part:FindFirstChild("ClickDetector")
									FlyStud.CFrame = CFrame.new(part.Position - Vector3.new(0, 5, 0))
									task.wait(0.2)
									if ClickDetector then
										fireclickdetector(ClickDetector)
									end
									task.wait(0.4)
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

Player.CharacterAdded:Connect(function()
	Update()
	HumanoidDied()
	FlyStud("spawn")
end)

task.spawn(function()
    while wait() do

        task.spawn(function()
            Toggle = getgenv().SharedData.ATM.Farming
            if not State.ATM and game.workspace:FindFirstChild("FlyPart") and Toggle then
                State.ATM = true
                FlyStud = workspace:FindFirstChild("FlyPart")
                ATM()
            elseif not Toggle then
                FlyStud = nil
            end
        end

    end
end)