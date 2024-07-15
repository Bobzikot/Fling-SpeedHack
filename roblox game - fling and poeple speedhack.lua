local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Speedhack Fling", "RJTheme1")
local Tab = Window:NewTab("Menu")
local Section = Tab:NewSection("Speed Hack")
local speedMultiplier = 1 
local maxSpeed = 500
local minSpeed = 1
local speedSlider = Section:NewSlider("Speed Multiplier", "Adjust the speed hack multiplier", 50, 1, function(value)
    speedMultiplier = value
end)
local player = game.Players.LocalPlayer
local character = player.Character
local function updateSpeed()
local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
local newSpeed = humanoid.WalkSpeed * speedMultiplier
        newSpeed = math.clamp(newSpeed, minSpeed, maxSpeed)
        humanoid.WalkSpeed = newSpeed
        speedSlider:SetValue(newSpeed)
    end
end
player.CharacterAdded:Connect(function(character)
    character = character
    updateSpeed()
end)
game:GetService("RunService").RenderStepped:Connect(updateSpeed)
local toggleKey = Enum.KeyCode.RightShift
local isSpeedHackEnabled = false
local function onKeyPress(key)
    if key == toggleKey then
        isSpeedHackEnabled = not isSpeedHackEnabled
local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
    humanoid.WalkSpeed = isSpeedHackEnabled and humanoid.WalkSpeed * speedMultiplier or humanoid.WalkSpeed / speedMultiplier
        end
    end
end
game:GetService("UserInputService").InputBegan:Connect(onKeyPress)
