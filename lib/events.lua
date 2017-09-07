-------------------------------------------------------------------------------------------------
--  Initialize function --
-------------------------------------------------------------------------------------------------
Pointificator.Initialize = function()

	Pointificator.SavedVariables = ZO_SavedVars:New("PointificatorSavedVariables", 2, nil, Pointificator._defaultSettings);

	Pointificator.BuildUI();
	
	Pointificator.SetTracker();
	
	SLASH_COMMANDS[Pointificator._slashCommand] = Pointificator.SlashCommands;
	
	EVENT_MANAGER:UnregisterForEvent(Pointificator._tracker, EVENT_ADD_ON_LOADED);
	
	-- call function that will query campaign leaderboard every minute
	Pointificator.QueryCampaignLeaderboard();

	-- initialize LAM settings
	Pointificator.InitializeSettings();
	
	-- register keybindings
	ZO_CreateStringId("SI_BINDING_NAME_DISPLAY_STATISTICS", "Display Statistics")
	ZO_CreateStringId("SI_BINDING_NAME_RESET_SESSION", "Reset Session")
	ZO_CreateStringId("SI_BINDING_NAME_POST_STATISTICS", "Post Statistics")
end

-------------------------------------------------------------------------------------------------
--  The tracking event for whenever alliance points are gained  --
-------------------------------------------------------------------------------------------------
Pointificator.OnAlliancePointUpdate = function(eventCode, alliancePoints, playSound, difference)
	
	-- no idea why this event fires when no points are gained
	if (difference <= 0) then
		return
	end
	
	if (difference > Pointificator._session.largestApDifference) then
		Pointificator._session.largestApDifference = difference;
	end
	
	if (difference > Pointificator.SavedVariables.records.largestApDifference) then
		Pointificator.SavedVariables.records.largestApDifference = difference;
	end
	
	Pointificator._sessionPoints = Pointificator._sessionPoints + difference;
	
	Pointificator.SetTracker();
	
	if (Pointificator.SavedVariables.addonSettings.alliancePointsNotifications and difference >= Pointificator.SavedVariables.addonSettings.alliancePointsThreshold) then
		
		local notificationHexColor = Pointificator.RGBToHex(
			Pointificator.SavedVariables.addonSettings.notificationColors.alliancePoints.r, 
			Pointificator.SavedVariables.addonSettings.notificationColors.alliancePoints.g, 
			Pointificator.SavedVariables.addonSettings.notificationColors.alliancePoints.b
		);
		
		local message = string.format("|c%sAP: %s|r", notificationHexColor, difference);
		
		Pointificator.Output(string.format(Pointificator._notificationFormat, message));
	end
end

-------------------------------------------------------------------------------------------------
--  The tracking event for whenever tel var stones are gained or lost  --
-------------------------------------------------------------------------------------------------
Pointificator.OnTelVarStoneUpdate = function(eventCode, newTelvarStones, oldTelvarStones, reason)

	-- ignore everything but TV retrieved/lost from loot/mobs/kills/deaths
	if reason ~= CURRENCY_CHANGE_REASON_LOOT and 
		reason ~= CURRENCY_CHANGE_REASON_PVP_KILL_TRANSFER and 
		reason ~= CURRENCY_CHANGE_REASON_DEATH then
		return
	end

	local difference = nil;
	local differenceSign = nil;
	
	if newTelvarStones > oldTelvarStones then
	
		difference = newTelvarStones - oldTelvarStones;
		differenceSign = "+";
		
		if difference > Pointificator._session.largestTelVarGain then
			Pointificator._session.largestTelVarGain = difference;
		end
		
		if (difference > Pointificator.SavedVariables.records.largestTvGain) then
			Pointificator.SavedVariables.records.largestTvGain = difference;
		end
		
		Pointificator._session.telVarStonesGained = Pointificator._session.telVarStonesGained + difference;
		
	elseif oldTelvarStones > newTelvarStones then
		
		difference = oldTelvarStones - newTelvarStones;
		differenceSign = "-";
		
		if difference > Pointificator._session.largestTelVarLoss then
			Pointificator._session.largestTelVarLoss = difference;
		end
		
		if (difference > Pointificator.SavedVariables.records.largestTvLoss) then
			Pointificator.SavedVariables.records.largestTvLoss = difference;
		end
		
		Pointificator._session.telVarStonesLost = Pointificator._session.telVarStonesLost + difference;
	end
	
	if difference == nil then
		return
	end
	
	if (Pointificator.SavedVariables.addonSettings.telVarStonesNotifications and difference >= Pointificator.SavedVariables.addonSettings.telVarStonesThreshold) then
		
		local notificationHexColor = Pointificator.RGBToHex(
			Pointificator.SavedVariables.addonSettings.notificationColors.telVarStones.r, 
			Pointificator.SavedVariables.addonSettings.notificationColors.telVarStones.g, 
			Pointificator.SavedVariables.addonSettings.notificationColors.telVarStones.b
		);
		
		local message = string.format("|c%sTV: %s%s|r", notificationHexColor, differenceSign, difference);
		
		Pointificator.Output(string.format(Pointificator._notificationFormat, message));
	end
end

-------------------------------------------------------------------------------------------------
--  Event that triggers on damage  --
-------------------------------------------------------------------------------------------------
Pointificator.OnCombat = function(eventCode , result , isError , abilityName, abilityGraphic, abilityActionSlotType, sourceName, sourceType, targetName, targetType, hitValue, powerType, damageType, log, sourceUnitId, targetUnitId)

	-- ignore errors
	if isError then
		return
	end

	local isInAvAWorld = IsPlayerInAvAWorld();
	
	-- ignore all combat outside of ava
	if not isInAvAWorld then
		return
	end

	-- killing blow delivered by player
	if 	result == ACTION_RESULT_KILLING_BLOW and 
		Pointificator._playerName == zo_strformat("<<1>>", sourceName) and 
		Pointificator._playerName ~= zo_strformat("<<1>>", targetName) and
		abilityName ~= "" then
		
		local isValidKill = Pointificator.History.InsertKill(targetName);
		
		if not isValidKill then
			Pointificator._session.invalidKills = Pointificator._session.invalidKills + 1;
			return
		end
		
		if (Pointificator.SavedVariables.addonSettings.killingBlowNotifications) then
		
			local enemyPlayerNameFormatted = zo_strformat("<<1>>", targetName);
			
			local enemyPlayerNameFormattedWithLink = ZO_LinkHandler_CreateCharacterLink(enemyPlayerNameFormatted);
			
			local message = string.format(
				Pointificator._notificationFormat, 
				"You've killed " .. enemyPlayerNameFormattedWithLink .. "!"
			);
			
			Pointificator.Output(message);
		end
		
		Pointificator._session.killingBlows = Pointificator._session.killingBlows + 1;
		Pointificator._session.killingStreak = Pointificator._session.killingStreak + 1;
		Pointificator.SavedVariables.records.killingBlows = Pointificator.SavedVariables.records.killingBlows + 1;
		
		-- check if killing streak is lifetime record
		if (Pointificator._session.killingStreak > Pointificator.SavedVariables.records.largestKillingStreak) then
			Pointificator.SavedVariables.records.largestKillingStreak = Pointificator._session.killingStreak;
		end
		
		-- check if killing streak is session record
		if (Pointificator._session.killingStreak > Pointificator._session.killingStreakRecord) then
			Pointificator._session.killingStreakRecord = Pointificator._session.killingStreak;
		end
		
		if (Pointificator.SavedVariables.addonSettings.playSounds) then
			PlaySound(SOUNDS.SMITHING_ITEM_TO_EXTRACT_PLACED);
		end
		
		return
	end
end

-------------------------------------------------------------------------------------------------
--  Event that triggers on player death  --
-------------------------------------------------------------------------------------------------
Pointificator.OnDie = function(eventCode)

	local isInAvAWorld = IsPlayerInAvAWorld();
	
	-- ignore deaths outside of AvA world
	if (not isInAvAWorld) then
		return;
	end

	local killingStreakEndMesssage = nil;
	
	if Pointificator._session.killingStreak > 0 then
		
		killingStreakEndMesssage = string.format(
			Pointificator._notificationFormat, 
			"Your killing streak of " .. Pointificator._session.killingStreak .. " kills has ended!"
		);
	end
	
	Pointificator._session.deaths = Pointificator._session.deaths + 1;
	Pointificator.SavedVariables.records.deaths = Pointificator.SavedVariables.records.deaths + 1;
	Pointificator._session.killingStreak = 0;
	
	local 
		hasAttacker, 
		attackerRawName, 
		attackerVeteranRank, 
		attackerLevel, 
		attackerAvARank, 
		isPlayer, 
		isBoss, 
		alliance, 
		minionName = Pointificator.GetAttackerInfo();
	
	if isPlayer then
		Pointificator.History.InsertDeath(attackerRawName);
	end
	
	if not Pointificator.SavedVariables.addonSettings.deathNotifications then
		return;
	end
	
	local deathMessage = nil;

	if not hasAttacker then
		
		Pointificator._session.deathsBySuicide = Pointificator._session.deathsBySuicide + 1;
		Pointificator.SavedVariables.records.deathsBySuicide = Pointificator.SavedVariables.records.deathsBySuicide + 1;
	
		deathMessage = string.format(
			Pointificator._notificationFormat, 
			"You committed suicide!"
		);
	elseif attackerRawName == nil or attackerRawName == "" then
	
		deathMessage = string.format(
			Pointificator._notificationFormat, 
			"You were killed by an unknown attacker!"
		);
	elseif isPlayer then
		
		Pointificator._session.deathsByPvP = Pointificator._session.deathsByPvP + 1;
		Pointificator.SavedVariables.records.deathsByPvP = Pointificator.SavedVariables.records.deathsByPvP + 1;
		
		local avaRankName = GetAvARankName(1, attackerAvARank);
		
		local attackerName = zo_strformat("<<1>>", attackerRawName);
		
		local attackerNameWithLink = ZO_LinkHandler_CreateCharacterLink(attackerName);
		
		local attackerFormatted = string.format(
			"|c%s%s|r [%s]", 
			Pointificator._allianceColors[alliance], 
			attackerNameWithLink,
			avaRankName
		);
		
		deathMessage = string.format(
			Pointificator._notificationFormat, 
			"You were killed by " .. attackerFormatted .. "!"
		);
	else
	
		Pointificator._session.deathsByPvE = Pointificator._session.deathsByPvE + 1;
		Pointificator.SavedVariables.records.deathsByPvE = Pointificator.SavedVariables.records.deathsByPvE + 1;
	
		deathMessage = string.format(
			Pointificator._notificationFormat, 
			"You were killed by " .. zo_strformat("<<1>>", attackerRawName) .. "!"
		);
	end
	
	Pointificator.Output(deathMessage);
	
	if killingStreakEndMesssage ~= nil then
		Pointificator.Output(killingStreakEndMesssage);
	end
end

-------------------------------------------------------------------------------------------------
--  Event that triggers on avenge kills  --
-------------------------------------------------------------------------------------------------
Pointificator.OnAvengeKill = function(eventCode, avengedPlayer, killedPlayer)

	if (Pointificator.SavedVariables.addonSettings.avengeNotifications) then
		
		local avengedPlayerNameFormatted = zo_strformat("<<1>>", avengedPlayer);
		
		local enemyPlayerNameFormatted = zo_strformat("<<1>>", killedPlayer);
		
		local avengedPlayerNameFormattedWithLink = ZO_LinkHandler_CreateCharacterLink(avengedPlayerNameFormatted);
		
		local enemyPlayerNameFormattedWithLink = ZO_LinkHandler_CreateCharacterLink(enemyPlayerNameFormatted);
		
		local message = string.format(
			Pointificator._notificationFormat, 
			"You've avenged " .. avengedPlayerNameFormattedWithLink .. " by killing " .. enemyPlayerNameFormattedWithLink .. "!"
		);
		
		Pointificator.Output(message);
	end

	Pointificator._session.avenges = Pointificator._session.avenges + 1;
	Pointificator.SavedVariables.records.avenges = Pointificator.SavedVariables.records.avenges + 1;
end

-------------------------------------------------------------------------------------------------
--  Event that triggers on revenge kills  --
-------------------------------------------------------------------------------------------------
Pointificator.OnRevengeKill = function(eventCode, killedPlayer)
	
	if (Pointificator.SavedVariables.addonSettings.revengeNotifications) then
		
		local enemyPlayerNameFormatted = zo_strformat("<<1>>", killedPlayer);
		
		local enemyPlayerNameFormattedWithLink = ZO_LinkHandler_CreateCharacterLink(enemyPlayerNameFormatted);
		
		local message = string.format(
			Pointificator._notificationFormat, 
			"You've taken your revenge by killing " .. enemyPlayerNameFormattedWithLink .. "!"
		);
		
		Pointificator.Output(message);
	end

	Pointificator._session.revenges = Pointificator._session.revenges + 1;
	Pointificator.SavedVariables.records.revenges = Pointificator.SavedVariables.records.revenges + 1;
end

-------------------------------------------------------------------------------------------------
--  Event for when the campaign leaderboard updates  --
-------------------------------------------------------------------------------------------------
Pointificator.OnCampaignLeaderboardChanged = function()

	local allianceRank = Pointificator.GetCampaignInformation();
	
	if (Pointificator._session.initialCampaignRank == nil) then
		Pointificator._session.initialCampaignRank = allianceRank;
	end
	
	Pointificator._session.currentCampaignRank = allianceRank;
	
	Pointificator.SetTracker();
end

-------------------------------------------------------------------------------------------------
--  Event for when the UI layer changes  --
-------------------------------------------------------------------------------------------------
Pointificator.OnLayerChange = function(eventCode, layerIndex, activeLayerIndex)

	-- ignore this layer index
	if activeLayerIndex == 1 then
		return;
	end
	
	local isInAvAWorld = IsPlayerInAvAWorld();
	local display = (isInAvAWorld or not Pointificator.SavedVariables.addonSettings.widget.onlyInAvA);
	local isHidden = Pointificator._gui:IsHidden();
	
	if activeLayerIndex == Pointificator._mainUILayer then
		
		Pointificator._forceHideUI = false;
		
		if display and isHidden then
			-- ensure we toggle back UI if needed
			Pointificator._gui:SetHidden(false);
		end
	else
		Pointificator._forceHideUI = true;
		-- ensure the UI is hidden when user is within a different UI layer
		Pointificator._gui:SetHidden(true);
	end
end

-------------------------------------------------------------------------------------------------
--  Register Events --
-------------------------------------------------------------------------------------------------
EVENT_MANAGER:RegisterForEvent(Pointificator._tracker, EVENT_ADD_ON_LOADED, Pointificator.Initialize);
EVENT_MANAGER:RegisterForEvent(Pointificator._tracker, EVENT_ALLIANCE_POINT_UPDATE, Pointificator.OnAlliancePointUpdate);
EVENT_MANAGER:RegisterForEvent(Pointificator._tracker, EVENT_COMBAT_EVENT, Pointificator.OnCombat);
EVENT_MANAGER:RegisterForEvent(Pointificator._tracker, EVENT_PLAYER_DEAD, Pointificator.OnDie);
EVENT_MANAGER:RegisterForEvent(Pointificator._tracker, EVENT_AVENGE_KILL, Pointificator.OnAvengeKill);
EVENT_MANAGER:RegisterForEvent(Pointificator._tracker, EVENT_REVENGE_KILL, Pointificator.OnRevengeKill);
EVENT_MANAGER:RegisterForEvent(Pointificator._tracker, EVENT_CAMPAIGN_LEADERBOARD_DATA_CHANGED, Pointificator.OnCampaignLeaderboardChanged);
EVENT_MANAGER:RegisterForEvent(Pointificator._tracker, EVENT_TELVAR_STONE_UPDATE, Pointificator.OnTelVarStoneUpdate);
EVENT_MANAGER:RegisterForEvent(Pointificator._tracker, EVENT_ACTION_LAYER_POPPED, Pointificator.OnLayerChange);
EVENT_MANAGER:RegisterForEvent(Pointificator._tracker, EVENT_ACTION_LAYER_PUSHED, Pointificator.OnLayerChange);
EVENT_MANAGER:RegisterForUpdate(Pointificator._tracker, Pointificator._pollInterval, Pointificator.UpdateGUI);

-------------------------------------------------------------------------------------------------
--  Register event filters --
-------------------------------------------------------------------------------------------------
EVENT_MANAGER:AddFilterForEvent(Pointificator._tracker, EVENT_COMBAT_EVENT, REGISTER_FILTER_COMBAT_RESULT, ACTION_RESULT_KILLING_BLOW);
EVENT_MANAGER:AddFilterForEvent(Pointificator._tracker, EVENT_COMBAT_EVENT, REGISTER_FILTER_UNIT_TAG, "player");
EVENT_MANAGER:AddFilterForEvent(Pointificator._tracker, EVENT_COMBAT_EVENT, REGISTER_FILTER_IS_ERROR, false);