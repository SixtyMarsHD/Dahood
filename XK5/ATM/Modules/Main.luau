getgenv().SharedData = {
    Settings = {
        AtmFarm = Settings.AtmFarm,
        CollectOnDeath = Settings.CollectOnDeath,
        AutoMask = Settings.AutoMask,
        AutoUnjail = Settings.AutoUnjail,
        AntiStomp = Settings.AntiStomp,
        AntiMod = Settings.AntiMod,
        FpsCap = Settings.FpsCap,
        FpsBoost = Settings.FpsBoost,
        Disable3DRendering = Settings.Disable3DRendering,
        AutoRedeemCodes = Settings.AutoRedeemCodes,
        AutoWatchADS = Settings.AutoWatchADS,

        Discord = {
            WebHooks = Settings.WebHooks,
            Status_WebHook = Settings.Status,
            Status_WebHook_URL = Settings.Status_URL,
            Status_WebHook_Interval = Settings.Status_Interval,
            Info_WebHook = Settings.Info,
            Info_WebHook_URL = Settings.Info_URL,
            Info_WebHook_Interval = Settings.Info_Interval,
        }
    },

    ATM = {
        FarmingTime = 0,
        AtmsOpened = 0,
        Profit = 0,
        MoneyBefore = 0,
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
