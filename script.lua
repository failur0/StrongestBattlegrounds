scrilocal Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Strongest Battlegrounds",
    LoadingTitle = "Strongest Battlegrounds",
    LoadingSubtitle = "by Failure0",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })
local Tab = Window:CreateTab("Main") -- Title, Image

local Section = Tab:CreateSection("Abuse")

 local Input = Tab:CreateInput({
    Name = "Bring",
    PlaceholderText = "Player",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
    -- The function that takes place when the input is changed
    -- The variable (Text) is a string for the value in the text box
    local targetPlayerIdentifier = Text
    keypress(0x33)
local playersService = game:GetService("Players")
local localPlayer = playersService.LocalPlayer
local localCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local localHumanoidRootPart = localCharacter:WaitForChild("HumanoidRootPart")
local originalCFrame = localHumanoidRootPart.CFrame

local targetPlayer = nil

for _, player in ipairs(playersService:GetPlayers()) do
    if player.Name:lower():find(targetPlayerIdentifier:lower()) or player.DisplayName:lower():find(targetPlayerIdentifier:lower()) then
        targetPlayer = player
        break
    end
end

if targetPlayer then
    local targetCharacter = targetPlayer.Character
    if targetCharacter then
        local targetHumanoidRootPart = targetCharacter:WaitForChild("HumanoidRootPart")
        local newCFrame = targetHumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
        localHumanoidRootPart.CFrame = newCFrame
        wait(1)
        localHumanoidRootPart.CFrame = originalCFrame
    end
end

    end,
 })
