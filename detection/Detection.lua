local humanoid = script.Parent.Parent.Character:FindFirstChild("Humanoid")
local kickmessages = require(script.KickMessages)
local whitelist = require(script.Whitelist)
local canCheck = true

local function bot()
	wait()
	local player = script.Parent.Parent
	if player.AccountAge < 30 then
		
		for i, v in pairs(whitelist) do
			if player.Name == whitelist then
				canCheck = false
			end
		end
		
		if canCheck == true then
			player:Kick("wassup bot how my I help you please join this game: https://www.roblox.com/games/5243341535/cute-cat-pictures")
			wait(1)
			canCheck = false
		end
	end
end

local function health()
	wait()
	if humanoid.Health > 100 then
		
		local player = script.Parent.Parent
		
		for i, v in pairs(whitelist) do
			if player.Name == whitelist then
				canCheck = false
			end
		end
		
		if canCheck == true then
			humanoid.Health = 100
			wait(game.Players.RespawnTime)
			script["Anti-Cheat(Backup)"].Health:Fire(script.Parent.Parent.Character)
			wait(1)
			canCheck = false
		end
	end
end

local function speed()
	wait()
	if humanoid.WalkSpeed > 16 or humanoid.JumpPower > 50 then
		
		local player = script.Parent.Parent
		
		for i, v in pairs(whitelist) do
			if player.Name == whitelist then
				canCheck = false
			end
		end
		
		if canCheck == true then
			humanoid.WalkSpeed = 16
			humanoid.JumpPower = 50
			wait(game.Players.RespawnTime)
			script["Anti-Cheat(Backup)"].Speed:Fire(script.Parent.Parent.Character)
			wait(1)
			canCheck = false
		end
	end
end

local function leaderstats()
	wait()
	
	local player = script.Parent.Parent
	
	if player.leaderstats.Buttons.Value > 61 or player.leaderstats.Buttons.Value < 0 then
		
		for i, v in pairs(whitelist) do
			if player.Name == whitelist then
				canCheck = false
			end
		end
		
		if canCheck == true then
			player.leaderstats.Buttons.Value = 0
			script["Anti-Cheat(Backup)"].Leaderstats:Fire(script.Parent)
			wait(1)
			canCheck = false
		end
	end
end

local function tool(player)
	local tools = player.Backpack:GetChildren()
	local cannotkick = false
	
	for i, v in pairs(whitelist) do
		if player.Name == whitelist then
			canCheck = false
		end
	end
	
	if canCheck == true then
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
		wait(1)
		canCheck = false 
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
		
		local player = script.Parent.Parent
		
		for i, v in pairs(whitelist) do
			if player.Name == whitelist then
				canCheck = false
			end
		end
		
		if canCheck == true then
			char:BreakJoints()
			wait(game.Players.RespawnTime)
			script["Anti-Cheat(Backup)"].Fling:Fire(script.Parent.Parent.Character)
			wait(1)
			canCheck = false
		end
	end
end

while wait() do
	bot()
	health()
	speed()
	tool(script.Parent.Parent)
	velocity(script.Parent.Parent.Character)
end
