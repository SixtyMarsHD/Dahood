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
	"SixtyMarsHD"
}

local VALUES = {
	ScriptControl = {
		ATM_AutoFarm = nil,
	},
	
	
	CashDrop = {
		CashDrop_value = 100
	},
	
	AutoCashDrop = {
		AutoCashDrop_toggle = false,
		AutoCashDrop_value = 100
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

local function Setup()
	local Combat = Backpack:WaitForChild("Combat")
	if Combat then
		print("Found Combat")
		Combat.Parent = Char
		task.delay(1, function()
			print("Returning Combat to Backpack")
			Combat.Parent = Backpack
		end)
	end
	local Wallet = Backpack:WaitForChild("[Wallet]")
	if Wallet then
		print("Found Wallet")
		Wallet.Parent = Char
		task.delay(1, function()
			print("Returning Wallet to Backpack")
			Wallet.Parent = Backpack
		end)
	end
end

local function Update()
	Char = Player.Character or Player.CharacterAdded:Wait()
	HumRoot = Char:WaitForChild("HumanoidRootPart")
	Humanoid = Char:WaitForChild("Humanoid")
	Backpack = Player.Backpack
end

local function ButtonClick(Button)
	print("button got")
	local connections = getconnections(Button.MouseButton1Click)
	for i, connection in pairs(connections) do
		if connection.Function then
			print("button cliked")
			connection.Function()
		end
	end
end

--Module
local function DropCash(Mode)
	local Button = game.Players.LocalPlayer.PlayerGui.MainScreenGui.WalletDrop.TextButton
	local TextBox = game.Players.LocalPlayer.PlayerGui.MainScreenGui.WalletDrop.TextBox
	
	local function Drop(Drop_Value)
		TextBox.Text = VALUES.CashDrop.CashDrop_value
		print("button fired")
		ButtonClick(Button)
	end
	
	local function AutoDrop()
		while VALUES.AutoCashDrop.AutoCashDrop_toggle == true do
			TextBox.Text = VALUES.AutoCashDrop.AutoCashDrop_value
			ButtonClick(Button)
			wait(0.5)
		end
	end
	
	if Mode == "Drop" then
		Drop()
	elseif Mode == "AutoDrop" then
		AutoDrop()
	end
	
end

local function ChatUpdate(player)
	player.Chatted:Connect(function(msg)
		if isAdmin(player.Name) then
			--Common
			if string.sub(msg, 1, 3) == ".tp" then
				Update()
				HumRoot.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
			elseif string.sub(msg, 1, 5) == ".msg " then
				local msg = string.sub(msg, 6)
				local chatChannel = TextChatService:FindChannel("All")
				if chatChannel then
					chatChannel:SendAsync(msg)
				end
			elseif string.sub(msg, 1, 6) == ".Amsg" then
				local args = string.sub(msg, 7)
				local split = string.split(args, " ")
				local msg = split[1] or "ERROR"
				local cooldown = tonumber(split[2]) or 5

				local chatChannel = TextChatService:FindChannel("All")
				if chatChannel then
					chatChannel:SendAsync(msg)
				end
				
			
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

			--ScriptControl
			if string.sub(msg, 1, 6) == ".stop " then
				print("stop")
				if string.sub(msg, 7, 9) == "ATM" then
					getgenv().SharedData.ATM.Farming = false
				elseif string.sub(msg, 7, 14) == "CashAura" then
					getgenv().SharedData.CashAura.Farming = false
				end
			elseif string.sub(msg, 1, 7) == ".start " then
				print("start")
				if string.sub(msg, 8, 10) == "ATM" then
					getgenv().SharedData.ATM.Farming = true
				elseif string.sub(msg, 8, 15) == "CashAura" then
					getgenv().SharedData.CashAura.Farming = true
				end
			end

			--CashStuff
			if string.sub(msg, 1, 6) == ".drop " then
				if string.sub(msg, 7) == "15k" then
					VALUES.CashDrop.CashDrop_value = 15000
				elseif string.sub(msg, 7) == "10k" then
					VALUES.CashDrop.CashDrop_value = 10000
				elseif string.sub(msg, 7) == "5k" then
					VALUES.CashDrop.CashDrop_value = 5000
				else 
					VALUES.CashDrop.CashDrop_value = string.sub(msg, 7)
				end
				DropCash("Drop")
			end

			if string.sub(msg, 1, 7) == ".Adrop " then
				local args = string.sub(msg, 8)
				local split = string.split(args, " ")

				local boolStr = (split[1] or ""):lower()
				local value
				if split[2] == "15k" then
					value = 15000
				elseif split[2] == "10k" then
					value = 10000
				elseif split[2] == "5k" then
					value = 5000
				else 
					value = split[2]
				end                 

				if boolStr == "true" then
					VALUES.AutoCashDrop.AutoCashDrop_toggle = true
					if value then
						VALUES.AutoCashDrop.AutoCashDrop_value = value
					end
				elseif boolStr == "false" then
					VALUES.AutoCashDrop.AutoCashDrop_toggle = true
					if value then
						VALUES.AutoCashDrop.AutoCashDrop_value = value
					end
				end
				DropCash("AutoDrop")
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
--FirstExecute
Setup()