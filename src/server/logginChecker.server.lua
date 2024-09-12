local RS = game:GetService("ReplicatedStorage")
local playerLoginDataStore = require(RS:WaitForChild("Shared"):WaitForChild("playerLoginDataStore"))
local encryptDataLibrary = require(RS:WaitForChild("Shared"):WaitForChild("EncryptDataLibrary"))
local loggedEvent = RS:WaitForChild("logged")

--make new RemoteEvent
local OnNewPlayer= Instance.new("RemoteEvent")
OnNewPlayer.Name = "OnNewPlayer"
OnNewPlayer.Parent = RS


--make the objects
local newDataObj = encryptDataLibrary.new()
local newDataStore =  playerLoginDataStore.new()

-- Player connected event
game.Players.PlayerAdded:Connect(function(player)

    print(player.Name .. " has connected")
    --check wether player has logged in before
    local RetrieveData = newDataStore:RetrieveData(player)
    if RetrieveData ==nil then
        OnNewPlayer:FireClient(player)
        print("Player has not logged in before")
    else
        print("Player has logged in before")
        print("Decrypted data: " .. RetrieveData.userName .. " " .. RetrieveData.userPw)
        
        loggedEvent:FireClient(player)

        local loggingDetails ={
            userName = newDataObj:decryptData(RetrieveData.userName),
            userPw = newDataObj:decryptData(RetrieveData.userPw)
        }

        --do what u need with login here
    end



end)