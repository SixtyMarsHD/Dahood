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

local function Update()
	Char = Player.Character or Player.CharacterAdded:Wait()
	HumRoot = Char:WaitForChild("HumanoidRootPart")
	Humanoid = Char:WaitForChild("Humanoid")
	Backpack = Player.Backpack

	local Combat = Char:WaitForChild("Combat")
	local Wallet = Char:WaitForChild("[Wallet]")
	if Combat then
		Combat.Parent = Char
		task.delay(0.1, function()
			Combat.Parent = Backpack
		end)
	end
	if Wallet then
		Wallet.Parent = Char
		task.delay(0.1, function()
			Wallet.Parent = Backpack
		end)
	end
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

			if string.sub(msg, 1, 7) == ".ADrop " then
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
					VALUES.AutoCashDrop.AutoCashDrop_value = value
				elseif boolStr == "false" then
					VALUES.AutoCashDrop.AutoCashDrop_toggle = true
					VALUES.AutoCashDrop.AutoCashDrop_value = value
				end
				DropCash("AutoDrop")
			end
			
		end
	end)
end


for _, player in ipairs(PLAYERS:GetPlayers()) do
	ChatUpdate(player)
end

PLAYERS.PlayerAdded:Connect(function(player)
	ChatUpdate(player)
end)
--FirstExecute