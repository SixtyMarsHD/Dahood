getgenv().Settings = {
    ["ATM"] = true, -- Enable or disable the ATM farming script
    
    ["FastCollect"] = true, -- Enable or disable fast collecting money drops
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/ATM/Module/Main.luau"))()