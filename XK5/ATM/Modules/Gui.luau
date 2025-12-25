local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Orion-Library-Fixed/refs/heads/main/new"))()

local Window = OrionLib:MakeWindow({
    Name = "DaHood | ATM-Farm",
    IntroText = "Loading XK5",
    PremiumText = "X K 5",
    SaveConfig = true, 
    ConfigFolder = "XK5/DaHood/ATM-Farm"
})

--//TAB_1
local Tab_1 = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998"
})

Tab_1:AddToggle({
	Name = "ATM Farm",
	Default = false,
    Save = true,
    Flag = "tab_1_ATM-Farm",
	Callback = function(Value)
		print(Value)
		getgenv().SharedData.Settings.AtmFarm = Value
	end    
})

local Section = Tab_1:AddSection({
	Name = "Other "
})

Tab_1:AddToggle({
	Name = "AutoMask",
	Default = false,
    Save = true,
    Flag = "tab_1_AutoMask",
	Callback = function(Value)
		print(Value)
		getgenv().SharedData.Settings.AutoMask  = Value
	end    
})

Tab_1:AddToggle({
	Name = "CollectOnDeath",
	Default = false,
    Save = true,
    Flag = "tab_1_CollectOnDeath",
	Callback = function(Value)
		print(Value)
		getgenv().SharedData.Settings.CollectOnDeath = Value
	end    
})

Tab_1:AddToggle({
	Name = "AutoUnJail",
	Default = false,
    Save = true,
    Flag = "tab_1_AutoUnJail",
	Callback = function(Value)
		print(Value)
		getgenv().SharedData.Settings.AutoUnJail = Value
	end    
})

local Section = Tab_1:AddSection({
	Name = "Anti "
})

Tab_1:AddToggle({
	Name = "AntiStomp / AntiJail",
	Default = false,
    Save = true,
    Flag = "tab_1_AntiStomp",
	Callback = function(Value)
		print(Value)
		getgenv().SharedData.Settings.AntiStomp = Value
	end    
})

Tab_1:AddToggle({
	Name = "AntiMod",
	Default = false,
    Save = true,
    Flag = "tab_1_AntiMod",
	Callback = function(Value)
		print(Value)
		getgenv().SharedData.Settings.AntiMod = Value
	end    
})

--//TAB_2
local Tab_2 = Window:MakeTab({
	Name = "Virsual",
	Icon = "rbxassetid://4483345998"
})

Tab_2:AddTextbox({
	Name = "FpsCap",
	Default = "",
	TextDisappear = true,
	Save = true,
    Flag = "tab_2_FpsCap",
	Callback = function(Value)
		print(Value)
		getgenv().SharedData.Settings.FpsCap = Value
	end	  
})

Tab_2:AddButton({
	Name = "FpsBoost",
	Callback = function()
      	print("button pressed")
		getgenv().SharedData.Settings.FpsBoost = true
  	end    
})
Tab_2:AddParagraph("Warning","This will delete the whole map")

Tab_2:AddToggle({
	Name = "Disable3DRendering",
	Default = false,
    Save = true,
    Flag = "tab_2_Disable3DRendering",
	Callback = function(Value)
		print(Value)
		getgenv().SharedData.Settings.Disable3DRendering = Value
	end    
})
Tab_2:AddParagraph("Warning","This will use a lot of memory over time and may eventually crash")

--//TAB_3
local Tab_3 = Window:MakeTab({
	Name = "WebHooks",
	Icon = "rbxassetid://4483345998"
})

Tab_3:AddToggle({
	Name = "EnableWebHooks",
	Default = false,
    Save = true,
    Flag = "tab_3_EnableWebHooks",
	Callback = function(Value)
		print(Value)
		getgenv().SharedData.Settings.Discord.WebHooks = Value
	end    
})

local Section = Tab_3:AddSection({
	Name = "Status "
})

Tab_3:AddToggle({
	Name = "DiscordWebHook",
	Default = false,
    Save = true,
    Flag = "tab_3_DiscordWebHook",
	Callback = function(Value)
		print(Value)
		getgenv().SharedData.Settings.Discord.Status_WebHook = Value
	end    
})

Tab_3:AddTextbox({
	Name = "WebHook-URL",
	Default = "",
	TextDisappear = true,
	Save = true,
    Flag = "tab_3_WebHook-URL",
	Callback = function(Value)
		print(Value)
		getgenv().SharedData.Settings.Discord.Status_WebHook_URL = Value
	end	  
})

Tab_3:AddTextbox({
	Name = "Interval",
	Default = "5",
	TextDisappear = true,
	Save = true,
    Flag = "tab_3_Interval",
	Callback = function(Value)
		print(Value)
		getgenv().SharedData.Settings.Discord.Status_WebHook_Interval = Value
	end	  
})

local Section = Tab_3:AddSection({
	Name = "Info"
})

Tab_3:AddToggle({
	Name = "DiscordWebHook",
	Default = false,
    Save = true,
    Flag = "tab_3_DiscordWebHook",
	Callback = function(Value)
		print(Value)
		getgenv().SharedData.Settings.Discord.Info_WebHook = Value
	end    
})

Tab_3:AddTextbox({
	Name = "WebHook-URL",
	Default = "",
	TextDisappear = true,
	Save = true,
    Flag = "tab_3_WebHook-URL",
	Callback = function(Value)
		print(Value)
		getgenv().SharedData.Settings.Discord.Info_WebHook_URL = Value
	end	  
})

Tab_3:AddTextbox({
	Name = "Interval",
	Default = "5",
	TextDisappear = true,
	Save = true,
    Flag = "tab_3_Interval",
	Callback = function(Value)
		print(Value)
		getgenv().SharedData.Settings.Discord.Info_WebHook_Interval = Value
	end	  
})

local Section = Tab_3:AddSection({
	Name = "Information"
})
Tab_3:AddLabel("The interval is in minutes!")
Tab_3:AddLabel("Status: Online/Offline/AntiMod")
Tab_3:AddLabel("Info: Atms/Profit/Runtime")

--//TAB_4
local Tab_4 = Window:MakeTab({
	Name = "Misc ",
	Icon = "rbxassetid://4483345998"
})

Tab_4:AddToggle({
	Name = "AutoRedeemCodes",
	Default = false,
    Save = true,
    Flag = "tab_4_AutoRedeemCodes",
	Callback = function(Value)
		print(Value)
		getgenv().SharedData.Settings.AutoRedeemCodes = Value
	end    
})

Tab_4:AddToggle({
	Name = "AutoWatchADS",
	Default = false,
    Save = true,
    Flag = "tab_4_AutoWatchADS",
	Callback = function(Value)
		print(Value)
		getgenv().SharedData.Settings.AutoWatchADS = Value
	end    
})


OrionLib:Init()
