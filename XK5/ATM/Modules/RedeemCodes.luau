local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MainEvent = ReplicatedStorage:WaitForChild("MainEvent")

game.Players.LocalPlayer:WaitForChild("DataFolder")
task.wait(1)

local Codes = {
    "XMAS2025",
    "HAPPYHOLIDAYS25"
}

if getgenv().SharedData.Settings.AutoRedeemCodes then
    for _, code in pairs(Codes) do
        MainEvent:FireServer("EnterPromoCode", code)
        task.wait(5)
    end
end

