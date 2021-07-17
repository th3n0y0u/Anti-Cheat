local runservice = game:GetService("RunService")

local function changed(player)
	local name = player.Name
	wait(1)
	local currentname = player.Name
	if name == currentname then
		script.Kick:FireServer(player)
	elseif name ~= currentname then
		local charname = player.Character.Name
		wait(1)
		local currentcharname = player.Character.Name
		if charname == currentcharname then
			script.Kick:FireServer(player)
		end
	end
end

runservice.Heartbeat:Connect(function()
	changed(script.Parent.Parent.Parent)
end)
