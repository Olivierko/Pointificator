--[[
	This module is responsible for tracking combat history
	such as kills, deaths with timestamps paired per player.
]]--

Pointificator.History = {};

-------------------------------------------------------------------------------------------------
--  Ensures the existance of a entry by given name  --
-------------------------------------------------------------------------------------------------
Pointificator.History.EnsureExistance = function(playerName) 

	local index = Pointificator._session.history[playerName]; 

	if index == nil then 

		Pointificator._session.history[playerName] = { 
			kills = 0, 
			deaths = 0, 
			deathTime = nil, 
			killTime = nil, 
			-- alliance = 0, 
			-- class = 0, 
			-- race = 0, 
			-- unitTag = nil
		}; 
	end 

end

-------------------------------------------------------------------------------------------------
--  Inserts a death to given entry  --
-------------------------------------------------------------------------------------------------
Pointificator.History.InsertDeath = function(playerName) 

	-- ensure we have a entry 
	Pointificator.History.EnsureExistance(playerName); 

	local entry = Pointificator._session.history[playerName]; 
	local deathTime = GetTimeStamp(); 

	entry.deaths = entry.deaths + 1; 
	entry.deathTime = deathTime; 
	
	-- ensure we update the history UI
	Pointificator.DrawHistory(Pointificator._state.history.startIndex);
end 

-------------------------------------------------------------------------------------------------
--  Inserts a kill to given entry, returns boolean  --
--  depending on whether an update was made or not  --
-------------------------------------------------------------------------------------------------
Pointificator.History.InsertKill = function(playerName) 

	-- ensure we have a entry 
	Pointificator.History.EnsureExistance(playerName); 

	local entry = Pointificator._session.history[playerName]; 
	local killTime = GetTimeStamp(); 
	local shouldUpdate = false;  

	if entry.killTime == nil then 

		shouldUpdate = true; 
	else 

		local timeDifferenceInSeconds = GetDiffBetweenTimeStamps(killTime, entry.killTime); 

		-- only update if last kill was longer than x seconds ago 
		if timeDifferenceInSeconds > Pointificator._killTimeDelay then 
			shouldUpdate = true;	
		end 
	end 

	if shouldUpdate then 

		entry.kills = entry.kills + 1; 
		entry.killTime = killTime; 

		-- ensure we update the history UI
		Pointificator.DrawHistory(Pointificator._state.history.startIndex);
		
		return true; 
	else 
		return false; 
	end 
end