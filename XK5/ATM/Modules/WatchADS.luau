local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Player = game.Players.LocalPlayer

local MainEvent = ReplicatedStorage:WaitForChild("MainEvent")

local DataFolder = Player:WaitForChild("DataFolder")
local AdWatchDebounce = DataFolder:WaitForChild("AdWatchDebounce")

if getgenv().SharedData.Settings.AutoWatchADS then
    while task.wait(1) do

        if require(game.ReplicatedStorage.AdModule).checkForAds() then
            if (AdWatchDebounce.Value + 960) <= os.time() then
                MainEvent:FireServer("GamePurchase", "AdVideo")
            end
        end 
    end
end