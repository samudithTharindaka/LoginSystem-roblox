-- Create the replicated event
local passDataEvent = Instance.new("RemoteEvent")
passDataEvent.Name = "passData"

-- Store the replicated event in ReplicatedStorage
local replicatedStorage = game:GetService("ReplicatedStorage")
passDataEvent.Parent = replicatedStorage

passDataEvent.OnServerEvent:Connect(function(player, data)
    print(player.Name .. " sent the following data: " .. data)
end)