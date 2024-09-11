local PlayerLoginDataStore = {}
PlayerLoginDataStore.__index = PlayerLoginDataStore

function PlayerLoginDataStore.new()
    local self = setmetatable({}, PlayerLoginDataStore)
    self.dataStore = game:GetService("DataStoreService"):GetDataStore("PlayerLoginData")
    return self
end


function PlayerLoginDataStore:SaveData(player, data)
    print("Saving data for player: " .. player.Name)
    self.dataStore:SetAsync(tostring(player.Name), data)
end

function PlayerLoginDataStore:RetrieveData(player)
    local dataRetrived = self.dataStore:GetAsync(tostring(player.name))
    print("Data retrieved for player: " .. player.Name.. " is: " .. dataRetrived)
    return dataRetrived
end

return PlayerLoginDataStore