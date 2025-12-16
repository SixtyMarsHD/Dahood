local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MainEvent = ReplicatedStorage:WaitForChild("MainEvent")
print("codes code")
game.Players.LocalPlayer:WaitForChild("DataFolder")
task.wait(1)

local Codes = {
    "XMAS2025",
    "HAPPYHOLIDAYS25"
}
print(getgenv().SharedData.Settings.AutoRedeemCodes)
print(Codes)
if getgenv().SharedData.Settings.AutoRedeemCodes then
    for _, code in pairs(Codes) do
        print(code)
        MainEvent:FireServer("EnterPromoCode", code)
        task.wait(5)
    end
end

