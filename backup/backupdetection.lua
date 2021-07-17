local kickmessages = require(script.Parent.KickMessages)

local function speed(char)
	
	for v = 1, 3, 1 do
		
		wait(3)
		
		local canKick = false
		local maxspeed = 32
		local position = char.HumanoidRootPart.Position
		local x = position.X
		local y = position.Y
		local z = position.Z
		
		local positiontable = {x, y, z}
		
		wait(1)
		
		local currentposition = char.HumanoidRootPart.Position
		local xcurrent = currentposition.X
		local ycurrent = currentposition.Y
		local zcurrent = currentposition.Z
		
		local currentpositiontable = {xcurrent, ycurrent, zcurrent}
		for i, v in pairs(positiontable) do
			if v + maxspeed >= currentpositiontable[i] then
				canKick = true
			end
		end
		
		if canKick == true then
			local player = game.Players:GetPlayerFromCharacter(char)
			player:Kick(kickmessages[math.random(1, #kickmessages)])
			wait(1)
			canKick = false
		end
		
	end
end

local function health(char)
	
	for v = 1, 3, 1 do
		
		wait(3)
		
		local health = char.Humanoid.Health
		
		if health <= 0 then
			local char = game.Workspace:FindFirstChild(char)
			wait(game.Players.RespawnTime)
			if char ~= nil then
				local player = script.Parent.Parent.Parent
				player:Kick(kickmessages[math.random(1, #kickmessages)])
			end
		elseif health >= 100 then
			char.Humanoid:TakeDamage(health)
			local char = game.Workspace:FindFirstChild(char)
			wait(game.Players.RespawnTime) 
			if char ~= nil then
				local player = script.Parent.Parent.Parent
				player:Kick(kickmessages[math.random(1, #kickmessages)])
			end
		end
		
	end
end

local function velocity(char)
	
	for v = 1, 3, 1 do
		
		wait(3)
		
		print("Checking if part flings from character...")
		char.WalkSpeed = 0
		local part = Instance.new("Part", char)
		part.CanCollide = true
		part.Transparency = 1
		local x = char.HumanoidRootPart.Position.X
		local y = char.HumanoidRootPart.Position.Y
		local z = char.HumanoidRootPart.Position.Z
		part.CFrame = CFrame.new(x, y + 15, z)
		local position = part.Position
		
		wait(1)
		
		if part.Position ~= position then
			script.Parent.Parent.Parent:Kick(kickmessages[math.random(1, #kickmessages)])
			game:GetService("Debris"):AddItem(part, 0.5)
			return true
		else
			game:GetService("Debris"):AddItem(part, 0.5)
			char.WalkSpeed = 16
			return false
		end
	end
	
end

local function leaderstats(char)
	
	for v = 1, 3, 1 do
		
		wait(3)
		
		local player = script.Parent.Parent.Parent
		if player.leaderstats.Buttons.Value > 61 or player.leaderstats.Buttons.Value < 0 then
			player.leaderstats.Buttons.Value = 0
		else
			local leaderstats1 = player.leaderstats.Buttons
			wait(1)
			local currentleaderstats = player.leaderstats.Buttons
			if leaderstats1.Value + 1 == currentleaderstats.Value then
				player:Kick(kickmessages[math.random(1, #kickmessages)])
			else
				local leaderstats2 = player.leaderstats.Wins
				wait(1)
				local currentleaderstats2 = player.leaderstats.Wins
				if leaderstats2.Value + 1 == currentleaderstats2.Value then
					player:Kick(kickmessages[math.random(1, #kickmessages)])
				end
			end
		end
		
	end
end

local function raycastDown(character, distance, threshold)
	
	for v = 1, 3, 1 do
		
		wait(3)
		
		local root = character:FindFirstChild("HumanoidRootPart")

		if not root then return end
		local currentPosition = root.Position
		local ray = Ray.new(
			currentPosition,
			currentPosition + Vector3.new(0, -distance, 0)
		)
		local part, position = workspace:FindPartOnRay(ray, character)
		
		if part then
			local difference = (currentPosition - position).Magnitude
			if difference > threshold then
				local player = script.Parent.Parent.Parent
				player:Kick(kickmessages[math.random(1, #kickmessages)])
			else
				print("Not flying.")
			end
		end
		
	end
end

script.Speed.Event:Connect(speed)
script.Health.Event:Connect(health)
script.Leaderstats.Event:Connect(leaderstats)
script.Fling.Event:Connect(velocity)
script.Fly.Event:Connect(function()
	raycastDown(script.Parent.Parent.Parent.Character, 10, 35)
end)
