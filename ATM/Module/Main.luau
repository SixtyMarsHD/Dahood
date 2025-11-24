getgenv().SharedData = {
    ATM = {
       Farming = getgenv().Settings["ATM"],
    },

    FastCollect = {
       Enabled = getgenv().Settings["FastCollect"],
    },
}

local ATM_Script = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/ATM/Module/ATMScript.luau"))()