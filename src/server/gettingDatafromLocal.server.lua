-- Create the replicated event
local passDataEvent = Instance.new("RemoteEvent")
passDataEvent.Name = "passData"
local loggedEvent = Instance.new("RemoteEvent")
loggedEvent.Name = "logged"

-- Store the replicated event in ReplicatedStorage
local replicatedStorage = game:GetService("ReplicatedStorage")
passDataEvent.Parent = replicatedStorage
loggedEvent.Parent = replicatedStorage

local playerLoginDataStore = require(replicatedStorage:WaitForChild("Shared"):WaitForChild("playerLoginDataStore"))
local encryptDataLibrary = require(replicatedStorage:WaitForChild("Shared"):WaitForChild("EncryptDataLibrary"))


passDataEvent.OnServerEvent:Connect(function(player, data)
    print(player.Name .. " sent the following data: " .. data.userName .. " " .. data.userPw)

    --getting data from the client
    local UName = data.userName
    local UPw = data.userPw

    local newDataObj = encryptDataLibrary.new()
    local newDataStore =  playerLoginDataStore.new()

   

    --making the encrypted data set
    local encriptedDataSet = {
        userName = newDataObj:encryptData(UName),
        userPw = newDataObj:encryptData(UPw)
    }

    --save data to the data store
    newDataStore:SaveData(player, encriptedDataSet)
    print("Data saved for player: " .. player.Name.. " is: " .. encriptedDataSet.userName .. " " .. encriptedDataSet.userPw)
    
    --retrieve data from the data store
    local dataRetrived = newDataStore:RetrieveData(player)

    --set retrived data to a set and decrypt
    local decryptedDataSet = {
        userName = newDataObj:decryptData(dataRetrived.userName),
        userPw = newDataObj:decryptData(dataRetrived.userPw)
    }

    loggedEvent:FireClient(player)
    print("Decrypted data: " .. decryptedDataSet.userName .. " " .. decryptedDataSet.userPw)
end)