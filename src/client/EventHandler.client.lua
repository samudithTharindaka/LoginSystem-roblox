local ReplicatedStorage = game:GetService("ReplicatedStorage")
local OnNewPlayer = ReplicatedStorage:WaitForChild("OnNewPlayer")
local loggedEvent = ReplicatedStorage:WaitForChild("logged")

--get the logging UI
local gui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
local loginpannel = gui:WaitForChild("frame")
local notify = gui:WaitForChild("LoggingInNotification")

OnNewPlayer.OnClientEvent:Connect(function()
    loginpannel.Visible = true
    print("You have not logged in before")
end)

loggedEvent.OnClientEvent:Connect(function()
    loginpannel.Visible = false
    notify.Visible = true
    wait(2)
    notify.Visible = false
end)