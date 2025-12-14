getgenv().Settings = {
    
    ["CollectOnDeath"] = true, --Collect money even if you die
    ["AutoMask"] = true,  --Automatically buy a mask and put it on (hide your name)
    ["AntiMod"] = true, --If a mod is in the game or joins, you will be kicked

    ["DiscordWebHook"] = true, --DiscordWebHook true/false (DiscordWebHook_URL is required!)
    ["DiscordWebHook_URL"] = "", --Put here Discord-WebHook-URL

    ["FpsCap"] = "60", --Set max FPS
    ["FpsBoost"] = false, --Deletes the map
    ["Disable3DRendering"] = false, --If Disable3DRendering is true then "FpsBoost" is useless!
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/XK5/ATM/Modules/Main.luau"))()