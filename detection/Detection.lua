local humanoid = script.Parent.Parent.Character:FindFirstChild("Humanoid")
local kickmessages = require(script.KickMessages)

local function bot()
	wait()
	local player = script.Parent.Parent
	if player.AccountAge < 30 then
		player:Kick("wassup bot how my I help you please join this game: https://www.roblox.com/games/5243341535/cute-cat-pictures")
	end
end

local function health()
	wait()
	if humanoid.Health > 100 then
		humanoid.Health = 100
		wait(game.Players.RespawnTime)
		script["Anti-Cheat(Backup)"].Health:Fire(script.Parent.Parent.Character)
	end
end

local function speed()
	wait()
	if humanoid.WalkSpeed > 16 or humanoid.JumpPower > 50 then
		humanoid.WalkSpeed = 16
		humanoid.JumpPower = 50
		wait(game.Players.RespawnTime)
		script["Anti-Cheat(Backup)"].Speed:Fire(script.Parent.Parent.Character)
	end
end

local function leaderstats()
	wait()
	local player = script.Parent.Parent
	if player.leaderstats.Buttons.Value > 61 then
		script["Anti-Cheat(Backup)"].Leaderstats:Fire(script.Parent)
	end
end

local function tool(player)
	local tools = player.Backpack:GetChildren()
	local cannotkick = false
	if tools ~= nil then
		for i, v in pairs(tools) do
			if v.Name == "ClassicSword" then
				cannotkick = true
			end
		end
		if cannotkick == true then
			player:Kick("lol no")
			wait(1)
			cannotkick = false
		end
	end
end

local function velocity(char)
	local canKill = false
	for i, v in pairs(char:GetChildren()) do
		if v.AssemblyLinearVelocity ~= v.CFrame.LookVector - v.CFrame.LookVector then 
			canKill = true
		end
	end
	
	if canKill == true then
		char:BreakJoints()
		wait(game.Players.RespawnTime)
		script["Anti-Cheat(Backup)"].Fling:Fire(script.Parent.Parent.Character)
	end
end

while wait() do
	bot()
	health()
	speed()
	tool(script.Parent.Parent)
end
