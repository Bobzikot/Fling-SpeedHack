local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib ("Test Speedhack", "RJTheme1")

local Tab = Window:NewTab ("Menu")

local Section = Tab:NewSection("Speed Hack")

local speedMultiplier = 16
local maxSpeed = 500
local minSpeed = 16

local speedSlider = Section:NewSlider("Speed Multiplier", "Adjust the speed hack multiplier", 500, 0, function(s)
    speedMultiplier = s
end)

local player = game.Players.LocalPlayer
local character = player.Character

local function updateSpeed()
    local humanoid = character:FindFirstChild("Humanoid")
    
    if humanoid then
        local currentSpeed = humanoid.WalkSpeed
        local newSpeed = currentSpeed * speedMultiplier
        
        if newSpeed > maxSpeed then
            newSpeed = maxSpeed
        elseif newSpeed < minSpeed then
            newSpeed = minSpeed
        end
        
        humanoid.WalkSpeed = newSpeed
        speedSlider:SetValue(newSpeed) -- Update the slider value
    end
end

game:GetService("RunService").RenderStepped:Connect(updateSpeed)

local toggleKey = Enum.KeyCode.RightShift

local isSpeedHackEnabled = false

local function onKeyPress(key)
    if key == toggleKey then
        isSpeedHackEnabled = not isSpeedHackEnabled
    end
end

game:GetService("UserInputService").InputBegan:Connect(onKeyPress)

local function onKeyRelease(key)
    if key == toggleKey then
        isSpeedHackEnabled = false
    end
end

game:GetService("UserInputService").InputEnded:Connect(onKeyRelease)

local function updateSpeedHack()
    if isSpeedHackEnabled then
        updateSpeed()
    end
end

game:GetService("RunService").RenderStepped:Connect(updateSpeedHack)
