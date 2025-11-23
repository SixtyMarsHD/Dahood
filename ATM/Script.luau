getgenv().Settings = {
    ["ATM"] = true, -- Enable or disable the ATM farming script
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/ATM/Module/Main.luau"))()