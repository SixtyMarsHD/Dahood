getgenv().SharedData = {
    Settings = {
        ["CollectOnDeath"] = getgenv().Settings.CollectOnDeath,
        ["AutoMask"] = getgenv().Settings.AutoMask,
        ["AntiMod"] = getgenv().Settings.AntiMod,
        ["DiscordWebHook"] = getgenv().Settings.DiscordWebHook,
        ["DiscordWebHook_URL"] = getgenv().Settings.DiscordWebHook_URL,
        ["FpsCap"] = getgenv().Settings.FpsCap,
        ["FpsBoost"] = getgenv().Settings.FpsBoost,
        ["Disable3DRendering"] = getgenv().Settings.Disable3DRendering,
        ["AutoRedeemCodes"] = getgenv().Settings.AutoRedeemCodes,
    },

    ATM = {
        ["Farming"] = true,
    }
}

local ATM_Script = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/XK5/ATM/Modules/ATM.luau"))()
local Codes_Script = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/XK5/ATM/Modules/Codes.luau"))()