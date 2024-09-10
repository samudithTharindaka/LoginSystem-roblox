
local replicatedStorage = game:GetService("ReplicatedStorage")
-- local passDataEvent = replicatedStorage:WaitForChild("passData")

local gui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
local etnBtn = gui.frame.EntBtn

etnBtn.MouseButton1Click:Connect(function()
    print( "Hello, World!")
    
end)
