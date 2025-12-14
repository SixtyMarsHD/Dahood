getgenv().SharedData = {
   ATM = {
      Farming = getgenv().Settings["ATM"],
   },

   FastCollect = {
      Enabled = getgenv().Settings["FastCollect"],
   },

   AutoMask = {
      Enabled = getgenv().Settings["AutoMask"],
   },

local ATM_Script = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/ATM/Module/ATM.luau"))()
--local CMD_Script = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixtyMarsHD/Dahood/refs/heads/main/ATM/Module/CMD.luau"))()