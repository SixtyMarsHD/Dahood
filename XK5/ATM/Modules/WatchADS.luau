local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Player = game.Players.LocalPlayer

local MainEvent = ReplicatedStorage:WaitForChild("MainEvent")

local DataFolder = Player:WaitForChild("DataFolder")
local AdWatchDebounce = DataFolder:WaitForChild("AdWatchDebounce")

if getgenv().SharedData.Settings.AutoWatchADS then
    while task.wait(1) do

        if require(game.ReplicatedStorage.AdModule).checkForAds() then
            MainEvent:FireServer("GamePurchase", "AdVideo")
        end

        --if (AdWatchDebounce.Value + 1000) <= os.time() then
            --MainEvent:FireServer("GamePurchase", "AdVideo")
            --print("Watched Ad fired")
            --wait(5)
        --else
            --print("waiting "..AdWatchDebounce.Value + 1000 - os.time().." / 1000")
        --end
    end
end