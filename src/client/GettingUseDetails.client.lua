
local replicatedStorage = game:GetService("ReplicatedStorage")
local passDataEvent = replicatedStorage:WaitForChild("passData")

local gui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
local etnBtn = gui.frame.EntBtn

etnBtn.MouseButton1Click:Connect(function()
    local userName = gui.frame.userName.Text
    local userPw = gui.frame.userPw.Text
    local dataToValidate = {
        userName = userName,
        userPw = userPw
    }
    passDataEvent:FireServer(dataToValidate)
    
end)
