-- Create the replicated event
local passDataEvent = Instance.new("RemoteEvent")
passDataEvent.Name = "passData"

-- Store the replicated event in ReplicatedStorage
local replicatedStorage = game:GetService("ReplicatedStorage")
passDataEvent.Parent = replicatedStorage

local playerLoginDataStore = require(replicatedStorage:WaitForChild("Shared"):WaitForChild("playerLoginDataStore"))
local encryptDataLibrary = require(replicatedStorage:WaitForChild("Shared"):WaitForChild("EncryptDataLibrary"))
local PlayerLocal = require(replicatedStorage:WaitForChild("Shared"):WaitForChild("PlayerLocal"))

passDataEvent.OnServerEvent:Connect(function(player, data)
    print(player.Name .. " sent the following data: " .. data)
    local newDataObj = encryptDataLibrary.new()
    local encryptedData = newDataObj:encryptData(data)
    print("Encrypted data: " .. encryptedData)

    local newDataStore =  playerLoginDataStore.new()
    newDataStore:SaveData(player, encryptedData)


    local decryptedData = newDataObj:decryptData(encryptedData)
    print("Decrypted data: " .. decryptedData)
end)