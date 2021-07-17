local char = script.Parent.Parent.Parent.Character
local player = script.Parent.Parent.Parent
local runservice = game:GetService("RunService")
local kickmessages = require(script.Parent.KickMessages)

char.Humanoid.StateChanged:Connect(function(Clip)
	if Clip == Enum.HumanoidStateType.StrafingNoPhysics then
		player:Kick(char.Name.." is such a noob, imagine using noclip on a challenge game cus ur bad")
	end
end)

char.Humanoid.StateChanged:Connect(function(Fly)
	if Fly == Enum.HumanoidStateType.Flying then
		script.Parent["Anti-Cheat(Backup)"].Fly:Fire()
	end
end)

char.ChildAdded:Connect(function(item)
	if item:IsA("Script") then
		player:Kick(kickmessages[math.random(1, #kickmessages)])
	else
		if item:IsA("Tool") then
			if item.Name ~= "ClassicSword" then
				player:Kick(kickmessages[math.random(1, #kickmessages)])
			end
		end
	end
end) 

char.ChildRemoved:Connect(function(item)
	if char.Humanoid.Health <= 0 then
		player:Kick("???") 
	end
end)
