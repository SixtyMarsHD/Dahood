getgenv().Settings = {
	["CashAura"] = false,
	["Key"] = "", --Put here the key for CashAura for AutoExecute the Key
	["CheckTime"] = 0.1,

	["AutoMask"] = false,
	["AntiStomp"] = false,
	["AntiAfk"] = false,
	["AntiSeat"] = false,
	["MoneyPriority"] = false,
	["Void"] = false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/CashAura/Module/Main.lua"))()