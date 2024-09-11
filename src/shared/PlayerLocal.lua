-- Define the player class
local datastoreHandler = require(script.Parent:WaitForChild("playerLoginDataStore"))
local PlayerLocal = {}

-- Constructor function
function PlayerLocal.new(plr)
    local self = setmetatable({}, PlayerLocal)
    self.player = plr
    self.userId = plr.UserId
    return self
end

function PlayerLocal:SaveData(data)
    local newDatastore = datastoreHandler.new()
    newDatastore:SaveData(self.userId, data)
end

function PlayerLocal:GetData()
    local newDatastore = datastoreHandler.new()
    return newDatastore:RetrieveData(self.userId)
end



return PlayerLocal