local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MainEvent = ReplicatedStorage:WaitForChild("MainEvent")

game.Players.LocalPlayer:WaitForChild("DataFolder")
task.wait(1)

local Codes = {
    "XMAS2025",
    "HAPPYHOLIDAYS25"
}

if getgenv().SharedData.AutoRedeemCodes then
    for _, code in pairs(Codes) do
        print(code)
        MainEvent:FireServer("EnterPromoCode", code)
        task.wait(5)
    end
end

