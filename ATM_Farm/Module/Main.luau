getgenv().SharedData = {
    ATM = {
       Farming = false,
    }

    CashAura = {
       Farming = false,
    }
}

local AdminScript = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/ATM_Farm/Module/AdminCMD.luau"))()
local ATMScript = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/ATM_Farm/Module/ATMScript.luau"))()
local CashAuraScript = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/ATM_Farm/Module/CashAuraScript.luau"))()

