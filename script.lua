local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
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

local Tab = Window:CreateTab("Abuse") -- Title, Image

local Section = Tab:CreateSection("Select a character for the script to use.")

local selectedCharacter = "Deadly Ninja"

local Dropdown = Tab:CreateDropdown({
    Name = "Select Character",
    Options = {"Deadly Ninja", "Hero Hunter"},
    CurrentOption = {selectedCharacter},
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(Option)
        selectedCharacter = Option[1] -- Update the selected character when dropdown option changes
    end,
})

local Section = Tab:CreateSection("Abuse")

local Input =
    Tab:CreateInput(
    {
        Name = "Bring",
        PlaceholderText = "Player",
        RemoveTextAfterFocusLost = false,
        Callback = function(Text)
            local targetPlayerIdentifier = Text
            
            if targetPlayerIdentifier ~= "" then
                local playersService = game:GetService("Players")
                local localPlayer = playersService.LocalPlayer
                local localCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
                local localHumanoidRootPart = localCharacter:WaitForChild("HumanoidRootPart")
                local originalCFrame = localHumanoidRootPart.CFrame

                local targetPlayer = nil

                for _, player in ipairs(playersService:GetPlayers()) do
                    if
                        player.Name:lower():find(targetPlayerIdentifier:lower()) or
                            player.DisplayName:lower():find(targetPlayerIdentifier:lower())
                     then
                        targetPlayer = player
                        break
                    end
                end

                if targetPlayer then
                    local targetCharacter = targetPlayer.Character
                    if targetCharacter then
                        local targetHumanoidRootPart = targetCharacter:WaitForChild("HumanoidRootPart")
                        local originalCFrameTarget = targetHumanoidRootPart.CFrame
                        
                        local teleportOffset = Vector3.new(0, 0, 2) -- Adjust the offset as needed
                        
                        local startTime = tick()  -- Record the start time

                        if selectedCharacter == "Hero Hunter" then
                            keypress(0x31) -- Use keypress(0x31) for Hero Hunter
                        else
                            keypress(0x33) -- Use keypress(0x33) for other characters
                        end
                        wait(0.3)
                        while targetCharacter and tick() - startTime <= 1 do
                            -- Teleport local player behind the target player
                            localHumanoidRootPart.CFrame = targetHumanoidRootPart.CFrame * CFrame.new(teleportOffset)
                            
                            -- Make the local player's character look at the target player
                            localCharacter:SetPrimaryPartCFrame(targetCharacter:WaitForChild("HumanoidRootPart").CFrame + Vector3.new(0, 0.5, 0))
                            
                            wait(0.001) -- Wait for a short interval (adjust as needed)
                        end
                        
                        -- Teleport local player back to the original location
                        localHumanoidRootPart.CFrame = originalCFrame
                    end
                end
            end
        end
    }
)





local Input =
    Tab:CreateInput(
    {
        Name = "Kill",
        PlaceholderText = "Player",
        RemoveTextAfterFocusLost = false,
        Callback = function(Text)
            -- The function that takes place when the input is changed
            -- The variable (Text) is a string for the value in the text box
            local targetPlayerIdentifier = Text

            if targetPlayerIdentifier ~= "" then
                local playersService = game:GetService("Players")
                local localPlayer = playersService.LocalPlayer
                local localCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
                local localHumanoidRootPart = localCharacter:WaitForChild("HumanoidRootPart")
                local originalCFrame = localHumanoidRootPart.CFrame

                local targetPlayer = nil

                for _, player in ipairs(playersService:GetPlayers()) do
                    if
                        player.Name:lower():find(targetPlayerIdentifier:lower()) or
                            player.DisplayName:lower():find(targetPlayerIdentifier:lower())
                     then
                        targetPlayer = player
                        break
                    end
                end

                if targetPlayer then
                    local targetCharacter = targetPlayer.Character
                    if targetCharacter then
                        if selectedCharacter == "Hero Hunter" then
                            keypress(0x31) -- Use keypress(0x31) for Hero Hunter
                        else
                            keypress(0x33) -- Use keypress(0x33) for other characters
                        end
                        wait(0.3)
                        local targetHumanoidRootPart = targetCharacter:WaitForChild("HumanoidRootPart")
                        local originalCFrameTarget = targetHumanoidRootPart.CFrame
                        
                        local startTime = tick()  -- Record the start time
                        
                        while targetCharacter and tick() - startTime <= 1 do
                            -- Teleport local player to the specified player's location
                            localHumanoidRootPart.CFrame = targetHumanoidRootPart.CFrame
                            
                            wait(0.1) -- Wait for a short interval (adjust as needed)
                        end
                        
                        -- Teleport local player to the specified coordinates and orientation
                        localHumanoidRootPart.CFrame = CFrame.new(
                            514.562744, 695.495483, 871.206238,
                            0.347158492, 0.604477108, -0.71699959,
                            0.000105390776, 0.764524519, 0.644594669,
                            0.937806487, -0.223852068, 0.265347451
                        )
                        
                        wait(1) -- Wait for a second
                        
                        -- Teleport local player back to the original location
                        localHumanoidRootPart.CFrame = originalCFrame
                        
                        wait(1) -- Wait for another second
                        
                        -- Teleport target player to the local player's original location
                        targetHumanoidRootPart.CFrame = originalCFrameTarget
                    end
                end
            end
        end
    }
)

local Input =
    Tab:CreateInput(
    {
        Name = "Skydive",
        PlaceholderText = "Player",
        RemoveTextAfterFocusLost = false,
        Callback = function(Text)
            -- The function that takes place when the input is changed
            -- The variable (Text) is a string for the value in the text box
            local targetPlayerIdentifier = Text

            if targetPlayerIdentifier ~= "" then
                local playersService = game:GetService("Players")
                local localPlayer = playersService.LocalPlayer
                local localCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
                local localHumanoidRootPart = localCharacter:WaitForChild("HumanoidRootPart")
                local originalCFrame = localHumanoidRootPart.CFrame

                local targetPlayer = nil

                for _, player in ipairs(playersService:GetPlayers()) do
                    if
                        player.Name:lower():find(targetPlayerIdentifier:lower()) or
                            player.DisplayName:lower():find(targetPlayerIdentifier:lower())
                     then
                        targetPlayer = player
                        break
                    end
                end

                if targetPlayer then
                    local targetCharacter = targetPlayer.Character
                    if targetCharacter then
                        if selectedCharacter == "Hero Hunter" then
                            keypress(0x31) -- Use keypress(0x31) for Hero Hunter
                        else
                            keypress(0x33) -- Use keypress(0x33) for other characters
                        end
                        wait(0.3)
                        local targetHumanoidRootPart = targetCharacter:WaitForChild("HumanoidRootPart")
                        local originalCFrameTarget = targetHumanoidRootPart.CFrame
                        
                        local startTime = tick()  -- Record the start time
                        
                        while targetCharacter and tick() - startTime <= 1 do
                            -- Teleport local player to the specified player's location
                            localHumanoidRootPart.CFrame = targetHumanoidRootPart.CFrame
                            
                            wait(0.1) -- Wait for a short interval (adjust as needed)
                        end
                        
                        -- Teleport local player to the specified coordinates and orientation
                        localHumanoidRootPart.CFrame = CFrame.new(
                            61.6776695, 5631.31055, -176.666, -0.890406489, 0.441104233, -0.112264581, -3.21421321e-05, 0.246584311, 0.969121337, 0.455166221, 0.862915516, -0.219546095
                        )
                        
                        wait(1) -- Wait for a second
                        
                        -- Teleport local player back to the original location
                        localHumanoidRootPart.CFrame = originalCFrame
                        
                        wait(1) -- Wait for another second
                        
                        -- Teleport target player to the local player's original location
                        targetHumanoidRootPart.CFrame = originalCFrameTarget
                    end
                end
            end
        end
    }
)

local Tab = Window:CreateTab("Teleportation") -- Title, Image
local Section = Tab:CreateSection("Player")
local Input =
Tab:CreateInput(
{
    Name = "Teleport",
    PlaceholderText = "Player",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        -- The function that takes place when the input is changed
        -- The variable (Text) is a string for the value in the text box
        local targetPlayerIdentifier = Text

        if targetPlayerIdentifier ~= "" then
            local playersService = game:GetService("Players")
            local localPlayer = playersService.LocalPlayer
            local localCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
            local localHumanoidRootPart = localCharacter:WaitForChild("HumanoidRootPart")
            local originalCFrame = localHumanoidRootPart.CFrame

            local targetPlayer = nil

            for _, player in ipairs(playersService:GetPlayers()) do
                if
                    player.Name:lower():find(targetPlayerIdentifier:lower()) or
                        player.DisplayName:lower():find(targetPlayerIdentifier:lower())
                 then
                    targetPlayer = player
                    break
                end
            end

            if targetPlayer then
                local targetCharacter = targetPlayer.Character
                if targetCharacter then
                    local targetHumanoidRootPart = targetCharacter:WaitForChild("HumanoidRootPart")
                    local originalCFrameTarget = targetHumanoidRootPart.CFrame
                    localHumanoidRootPart.CFrame = targetHumanoidRootPart.CFrame
                end
            end
        end
    end
}
)

local Section = Tab:CreateSection("Areas")

local Button = Tab:CreateButton({
    Name = "Center",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(147.013214, 440.755981, 2.61009812, 0.941463232, -2.97720497e-08, 0.337115616, 3.02179259e-09, 1, 7.98750932e-08, -0.337115616, -7.41807753e-08, 0.941463232)
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Arena",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-148.684708, 439.510559, -431.699738, 0.106254414, -3.18543556e-08, 0.994338989, -3.15558921e-08, 1, 3.5407755e-08, -0.994338989, -3.51394824e-08, 0.106254414)
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Mountain",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12.057066, 652.52124, -407.857605, -0.93605727, 1.72861583e-08, -0.351847649, 2.38445974e-08, 1, -1.43066181e-08, 0.351847649, -2.17814797e-08, -0.93605727)
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Skydive",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(61.6776695, 5631.31055, -176.666, -0.890406489, 0.441104233, -0.112264581, -3.21421321e-05, 0.246584311, 0.969121337, 0.455166221, 0.862915516, -0.219546095)
    end,
 })
