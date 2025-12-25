getgenv().Settings = {
    ["AtmFarm"] = true,
    ["Gui"] = true,

    ["CollectOnDeath"] = true, --Collect money even if you die
    ["AutoMask"] = true,  --Automatically buy a mask and put it on (hide your name)
    ["AntiMod"] = true, --If a mod is in the game or joins, you will be kicked

    ["FpsCap"] = "15", --Set max FPS
    ["FpsBoost"] = false, --Deletes the map
    ["Disable3DRendering"] = false, --If Disable3DRendering is true then "FpsBoost" is useless!

    ["WebHooks"] = true, --DiscordWebHook true/false (DiscordWebHook_URL is required!)
        ["Status"] = true,
            ["URL_Status"] = "https://discord.com/api/webhooks/1449336974283640925/dt9Mwv6m5AwlamzFEuhQypUfbcCEzRybc0gnMd-yNM4SIlUhBmxT-gXJJfAvW2uNiXl8", --Put here Discord-WebHook-URL
            ["Interval_Status"] = 5, --Interval in minutes for Discord WebHook messages
        ["Info"] = true,
            ["URL_Info"] = "https://discord.com/api/webhooks/1449336974283640925/dt9Mwv6m5AwlamzFEuhQypUfbcCEzRybc0gnMd-yNM4SIlUhBmxT-gXJJfAvW2uNiXl8", --Put here Discord-WebHook-URL
            ["Interval_Info"] = 5, --Interval in minutes for Discord WebHook messages
    
    ["AutoRedeemCodes"] = true, --Automatically redeems all available codes
    ["AutoWatchADS"] = true, --Automatically watches ads and claim the reward
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/XK5/ATM/Modules/Main.luau"))()
