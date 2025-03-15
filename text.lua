local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Auto dribble blr",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Auto DRIBBLE",
   LoadingSubtitle = "ad",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "bleh",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("autodribble", 4483362458) -- Title, Image

local Toggle = Tab:CreateToggle({
   Name = "Auto Dribble",
   CurrentValue = false,
   Flag = "Toggle Auto Dribble", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       if not getgenv().AutoDribbleSettings then getgenv().AutoDribbleSettings={
    Enabled = true,
    range = 22
}
    end
local S,R,P,U=getgenv().AutoDribbleSettings,game:GetService"ReplicatedStorage",game:GetService"Players",game:GetService"RunService"
local L=P.LocalPlayer or P.PlayerAdded:Wait() 
local function initCharacter()
    local C=L.Character or L.CharacterAdded:Wait()
    local H=C:WaitForChild"HumanoidRootPart"
    local M=C:WaitForChild"Humanoid"
    return C,H,M
end
local C,H,M=initCharacter()
L.CharacterAdded:Connect(function(newChar)
    C,H,M=initCharacter() 
end)
local B=R.Packages.Knit.Services.BallService.RE.Dribble
local A=require(R.Assets.Animations)
local G=function(s)if not A.Dribbles[s]then return nil end local I=Instance.new"Animation";I.AnimationId=A.Dribbles[s];return M and M:LoadAnimation(I)end
local T=function(p)if p==L then return false end local c=p.Character;if not c then return false end local V=c.Values and c.Values.Sliding;if V and V.Value==true then return true end local h=c:FindFirstChildOfClass"Humanoid";if h and h.MoveDirection.Magnitude>0 and h.WalkSpeed==0 then return true end return false end
local O=function(p)if not L.Team or not p.Team then return false end return L.Team~=p.Team end
local D=function(d)if not S.Enabled or not C.Values.HasBall.Value then return end B:FireServer()local s=L.PlayerStats.Style.Value;local t=G(s);if t then t:Play();t:AdjustSpeed(math.clamp(1+(10-d)/10,1,2))end local F=workspace:FindFirstChild"Football";if F then F.AssemblyLinearVelocity=Vector3.new();F.CFrame=C.HumanoidRootPart.CFrame*CFrame.new(0,-2.5,0)end end
U.Heartbeat:Connect(function()if not S.Enabled or not C or not H then return end for _,p in pairs(P:GetPlayers())do if O(p)and T(p)then local r=p.Character and p.Character:FindFirstChild"HumanoidRootPart";if r then local d=(r.Position-H.Position).Magnitude;if d<S.range then D(d);break end end end 
    end 
end)
   end,
})