getgenv().SharedData = {
    ATM = {
       Farming = false,
    }
}

local ATMScript   = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/ATM_Farm/Module/ATMScript.luau"))()
local AdminScript = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/ATM_Farm/Module/AdminCMD.luau"))()

while wait(5) do
    print(getgenv().SharedData.ATM.Farming)
end