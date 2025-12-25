getgenv().SharedData = {
    Settings = {
        ["AtmFarm"] = getgenv().Settings.AtmFarm,
        ["CollectOnDeath"] = getgenv().Settings.CollectOnDeath,
        ["AutoMask"] = getgenv().Settings.AutoMask,
        ["AutoUnjail"] = getgenv().Settings.AutoUnjail,
        ["AntiStomp"] = getgenv().Settings.AntiStomp,
        ["AntiMod"] = getgenv().Settings.AntiMod,
        ["FpsCap"] = getgenv().Settings.FpsCap,
        ["FpsBoost"] = getgenv().Settings.FpsBoost,
        ["Disable3DRendering"] = getgenv().Settings.Disable3DRendering,
        ["AutoRedeemCodes"] = getgenv().Settings.AutoRedeemCodes,
        ["AutoWatchADS"] = getgenv().Settings.AutoWatchADS,
        Discord = {
            ["WebHooks"] = getgenv().Settings.WebHooks,
            ["Status_WebHook"] = getgenv().Settings.Status,
            ["Status_WebHook_URL"] = getgenv().Settings.Status_URL,
            ["Status_WebHook_Interval"] = getgenv().Settings.Status_Interval,
            ["Info_WebHook"] = getgenv().Settings.Info,
            ["Info_WebHook_URL"] = getgenv().Settings.Info_URL,
            ["Info_WebHook_Interval"] = getgenv().Settings.Info_Interval,
        }
    },

    ATM = {
        ["FarmingTime"] = 0,
        ["AtmsOpened"] = 0,
        ["Profit"] = 0,
        ["MoneyBefore"] = 0,
    }
}

--//Modules Loader
local MODULES = {
    ATM_Script = game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/XK5/ATM/Modules/ATM.luau"),
    RedeemCodes_Script = game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/XK5/ATM/Modules/RedeemCodes.luau"),
    WatchADS_Script = game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/XK5/ATM/Modules/WatchADS.luau"),
    Misc_Script = game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/XK5/ATM/Modules/Misc.luau")
}

for _, Script in pairs(MODULES) do
    task.spawn(function()
        pcall(function()
            loadstring(Script)()
        end)
    end)
end
