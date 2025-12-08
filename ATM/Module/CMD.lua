local TextChatService = game:GetService("TextChatService")

local PLAYERS = game:GetService("Players")
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local MainScreenGui = PlayerGui:WaitForChild("MainScreenGui")

local Char = Player.Character or Player.CharacterAdded:Wait()
local HumRoot = Char:WaitForChild("HumanoidRootPart")
local Humanoid = Char:WaitForChild("Humanoid")
local Backpack = Player.Backpack

local Admins = {
	"SixtyMarsHD",
    "Brdbgdbgv",
    "Ashmoniic",
    "INLOVEWITHKIMCHI",
}

local VALUES = {
	ScriptControl = {
		ATM_AutoFarm = nil
	},
	
	CashDrop = {
		CashDrop_value = 100
	},
	
	AutoCashDrop = {
		AutoCashDrop_toggle = false,
		AutoCashDrop_value = 100,
		State = "Idle"
	},

	AutoMsg = {
		AutoMsg_toggle = false,
		AutoMsg_message = "Hello World",
		AutoMsg_cooldown = 5
	}

}

local function isAdmin(name)
	for _, adminName in ipairs(Admins) do
		if name == adminName then
			return true
		end
	end
	return false
end

local function Update()
	Char = Player.Character or Player.CharacterAdded:Wait()
	HumRoot = Char:WaitForChild("HumanoidRootPart")
	Humanoid = Char:WaitForChild("Humanoid")
	Backpack = Player.Backpack
end

local function ChatUpdate(player)
	player.Chatted:Connect(function(msg)
		if isAdmin(player.Name) then
			--Common
			if string.sub(msg, 1, 3) == ".tp" then
				Update()
				HumRoot.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
			elseif string.sub(msg, 1, 4) == ".fix" then

			elseif string.sub(msg, 1, 6) == ".reset" then
				Humanoid.Health = 0
			elseif string.sub(msg, 1, 5) == ".msg " then
				local msg = string.sub(msg, 6)
				local chatChannel = TextChatService.TextChannels.RBXGeneral
				if chatChannel then
					chatChannel:SendAsync(msg)
				end
			elseif string.sub(msg, 1, 6) == ".Amsg" then

			elseif string.sub(msg, 1, 5) == ".mask" then
				if Char and not Char:FindFirstChild("In-gameMask") then
					if Char:FindFirstChild("[Mask]") then
						local Mask = Char:FindFirstChild("[Mask]")
						Mask:Activate()
						Mask.Parent = Backpack
					elseif Backpack:FindFirstChild("[Mask]") then
						local Mask = Backpack:FindFirstChild("[Mask]")
						Mask.Parent = Char
						Mask:Activate()
						Mask.Parent = Backpack
					elseif not Backpack:FindFirstChild("[Mask]") then
						local MaskBuyFolder = workspace:FindFirstChild("Ignored"):FindFirstChild("Shop"):FindFirstChild("[Surgeon Mask] - $27")
						local ClickDetector = MaskBuyFolder:FindFirstChild("ClickDetector")
						local Part = MaskBuyFolder:FindFirstChild("Head")
						local oldpos = HumRoot.CFrame
						if ClickDetector then
							HumRoot.CFrame = Part.CFrame + Vector3.new(0, 3, 0)
							wait(0.25)
								fireclickdetector(ClickDetector)		
							local Mask = Backpack:WaitForChild("[Mask]", 5)
							if Char and HumRoot and Mask then
								Mask.Parent = Char
								Mask:Activate()
								Mask.Parent = Backpack
							end
							HumRoot.CFrame = oldpos + Vector3.new(0, 3, 0)
						end
					end
				end
			end

			--CashStuff
			if string.sub(msg, 1, 4) == ".UwU" then
				game:GetService("ReplicatedStorage").MainEvent:FireServer("DropMoney", 1430)
			end

			
		end
	end)
end

local function HumanoidDied()
	if Char and Char:WaitForChild("BodyEffects") and Char:WaitForChild("BodyEffects"):WaitForChild("Dead") then
		local Dead_Value = Char:WaitForChild("BodyEffects"):WaitForChild("Dead")
		Dead_Value:GetPropertyChangedSignal("Value"):Connect(function()
			if Dead_Value.Value == true then
			end
		end)
	end
end

Player.CharacterAdded:Connect(function()
	Update()
	Setup()
	HumanoidDied()
end)

for _, player in ipairs(PLAYERS:GetPlayers()) do
	ChatUpdate(player)
end

PLAYERS.PlayerAdded:Connect(function(player)
	ChatUpdate(player)
end)
