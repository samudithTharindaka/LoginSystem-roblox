
local replicatedStorage = game:GetService("ReplicatedStorage")
local passDataEvent = replicatedStorage:WaitForChild("passData")

local gui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
local etnBtn = gui.frame.EntBtn

etnBtn.MouseButton1Click:Connect(function()
    local textGiven = gui.frame.TextBox.Text
    passDataEvent:FireServer(textGiven)
    
end)
