--[[
	Addon: Pointificator
	Author: @Olivierko
	Version: 3.7
]]--

-------------------------------------------------------------------------------------------------
--  OnAddOnLoaded  --
-------------------------------------------------------------------------------------------------
function Pointificator.OnAddOnLoaded(event, addonName)
	if addonName ~= Pointificator.name then 
		return 
	end
 
	Pointificator:Initialize()
end

-------------------------------------------------------------------------------------------------
--  Prettifies a number  --
-------------------------------------------------------------------------------------------------
Pointificator.PrettifyNumber = function(number)
	
	if (number < 1000) then
		return number;
	end
	
	local thousandified = number / 1000;
	
	return string.format("%.01f", thousandified) .. "K";
end

-------------------------------------------------------------------------------------------------
--  Gets the kill death ratio  --
-------------------------------------------------------------------------------------------------
Pointificator.GetKillDeathRatio = function(killingBlows, deaths)
	
	local killDeathRatio = 0;
	
	if (killingBlows > 0) then
		if (deaths > 0) then
			killDeathRatio = string.format("%.01f",(killingBlows /  deaths));
		else
			killDeathRatio = killingBlows;
		end
	end
	
	return killDeathRatio;
end

-------------------------------------------------------------------------------------------------
--  Updates the label text  --
-------------------------------------------------------------------------------------------------
Pointificator.SetTracker = function()
	
	-- for some reason the ui isn't ready at start sometimes, guessing it's a timing issue
	if (Pointificator._gui == nil) then
		return
	end
	
	local sessionPoints = Pointificator.PrettifyNumber(Pointificator._sessionPoints);
	local pointsPerHour = Pointificator.GetPointsPerHour();
	pointsPerHour = Pointificator.PrettifyNumber(pointsPerHour);
	local telVarPerHour = Pointificator.GetTelVarPerHour();
	telVarPerHour = Pointificator.PrettifyNumber(telVarPerHour);
	local tvGained = Pointificator.PrettifyNumber(Pointificator._session.telVarStonesGained);
	local tvLost = Pointificator.PrettifyNumber(Pointificator._session.telVarStonesLost);
	local rankPercentage = Pointificator.GetRankPercentage();
	local currentTime = GetTimeStamp();
	local timeDifferenceInSeconds = GetDiffBetweenTimeStamps(currentTime, Pointificator._sessionStart);
	local killDeathRatio = Pointificator.GetKillDeathRatio(Pointificator._session.killingBlows, Pointificator._session.deaths);
	local lifeTimeKillDeathRatio = Pointificator.GetKillDeathRatio(Pointificator.SavedVariables.records.killingBlows, Pointificator.SavedVariables.records.deaths);
	local emperorRank = "N/A";
	local emperorRankDifference = "N/A";	
	local tvProfit = Pointificator._session.telVarStonesGained - Pointificator._session.telVarStonesLost;

	local sessionTime = string.format(
		"%.2d:%.2d:%.2d", 
		timeDifferenceInSeconds/(60*60), 
		timeDifferenceInSeconds/60%60, 
		timeDifferenceInSeconds%60
	);
	
	if (Pointificator._session.currentCampaignRank) then
		emperorRank = Pointificator._session.currentCampaignRank;
	end
	
	if (Pointificator._session.initialCampaignRank) then
		
		local emperorRankDifferencePoints = (
			math.max(Pointificator._session.currentCampaignRank, Pointificator._session.initialCampaignRank) - 
			math.min(Pointificator._session.currentCampaignRank, Pointificator._session.initialCampaignRank)
		);
		
		local hasGainedEmperorRank = (Pointificator._session.currentCampaignRank < Pointificator._session.initialCampaignRank);
		
		if (Pointificator._session.currentCampaignRank == Pointificator._session.initialCampaignRank) then
			emeprorRankDifferenceSign = "FFFF00+/-";
		elseif (hasGainedEmperorRank) then
			emeprorRankDifferenceSign = "00FF00+";
		else
			emeprorRankDifferenceSign = "FF3300-";
		end
		
		emperorRankDifference = string.format(
			"|c%s%s|r",
			emeprorRankDifferenceSign,
			emperorRankDifferencePoints
		);
	end
	
	local emperorRankValue = string.format("%s (%s)", emperorRank, emperorRankDifference);
	
	-- update main gui
	if Pointificator._gui.alliancePoints ~= nil then
		Pointificator._gui.alliancePoints.label:SetText(sessionPoints);
	end
	
	if Pointificator._gui.alliancePointsPerHour ~= nil then
		Pointificator._gui.alliancePointsPerHour.label:SetText(pointsPerHour .. "/H");
	end
	
	if Pointificator._gui.percentageToRank ~= nil then
		Pointificator._gui.percentageToRank.label:SetText(rankPercentage .. "%");
	end
	
	if Pointificator._gui.timeElapsed ~= nil then
		Pointificator._gui.timeElapsed.label:SetText(sessionTime);
	end
	
	if Pointificator._gui.killingBlows ~= nil then
		Pointificator._gui.killingBlows.label:SetText(Pointificator._session.killingBlows);
	end
	
	if Pointificator._gui.deaths ~= nil then
		Pointificator._gui.deaths.label:SetText(Pointificator._session.deaths);
	end
	
	if Pointificator._gui.kdRatio ~= nil then
		Pointificator._gui.kdRatio.label:SetText(killDeathRatio);
	end
	
	if Pointificator._gui.killingStreak ~= nil then
		Pointificator._gui.killingStreak.label:SetText(Pointificator._session.killingStreak);
	end
	
	if Pointificator._gui.emperorRank ~= nil then
		Pointificator._gui.emperorRank.label:SetText(emperorRankValue);
	end
	
	if Pointificator._gui.tvProfit ~= nil then
		Pointificator._gui.tvProfit.label:SetText(tvProfit);
	end
	
	if Pointificator._gui.tvGained ~= nil then
		Pointificator._gui.tvGained.label:SetText("|c00FF00+" .. tvGained .. "|r");
	end
	
	if Pointificator._gui.tvLost ~= nil then
		Pointificator._gui.tvLost.label:SetText("|cFF3300-" .. tvLost .. "|r");
	end
	
	if Pointificator._gui.tvPerHour ~= nil then
		Pointificator._gui.tvPerHour.label:SetText(telVarPerHour .. "/H");
	end
	
	-- adjust widget size
	Pointificator.AdjustWidgetSize();
	
	-- update statistics overview gui
	Pointificator._gui.statistics.overview.sessionTime.value:SetText(sessionTime);
	Pointificator._gui.statistics.overview.alliancePoints.value:SetText(Pointificator._sessionPoints);
	Pointificator._gui.statistics.overview.alliancePointsPerHour.value:SetText(pointsPerHour);
	Pointificator._gui.statistics.overview.killingBlows.value:SetText(Pointificator._session.killingBlows);
	Pointificator._gui.statistics.overview.deaths.value:SetText(Pointificator._session.deaths);
	Pointificator._gui.statistics.overview.ratio.value:SetText(killDeathRatio);
	Pointificator._gui.statistics.overview.emperorRank.value:SetText(emperorRankValue);
	Pointificator._gui.statistics.overview.tvProfit.value:SetText(tvProfit);
	
	-- update statistics combat gui
	Pointificator._gui.statistics.combat.killingBlows.value:SetText(Pointificator._session.killingBlows);
	Pointificator._gui.statistics.combat.deaths.value:SetText(Pointificator._session.deaths);
	Pointificator._gui.statistics.combat.deathsByPvP.value:SetText(Pointificator._session.deathsByPvP);
	Pointificator._gui.statistics.combat.deathsByPvE.value:SetText(Pointificator._session.deathsByPvE);
	Pointificator._gui.statistics.combat.deathsBySuicide.value:SetText(Pointificator._session.deathsBySuicide);
	Pointificator._gui.statistics.combat.ratio.value:SetText(killDeathRatio);
	Pointificator._gui.statistics.combat.avenges.value:SetText(Pointificator._session.avenges);
	Pointificator._gui.statistics.combat.revenges.value:SetText(Pointificator._session.revenges);
	Pointificator._gui.statistics.combat.killingStreak.value:SetText(Pointificator._session.killingStreak);
	Pointificator._gui.statistics.combat.bestKillingStreak.value:SetText(Pointificator._session.killingStreakRecord);
	
	-- update statistics currency gui
	Pointificator._gui.statistics.currency.alliancePoints.value:SetText(Pointificator._sessionPoints);
	Pointificator._gui.statistics.currency.alliancePointsPerHour.value:SetText(pointsPerHour);
	Pointificator._gui.statistics.currency.largestApDifference.value:SetText(Pointificator._session.largestApDifference);
	Pointificator._gui.statistics.currency.telVarStonesProfit.value:SetText(tvProfit);
	Pointificator._gui.statistics.currency.telVarStonesGained.value:SetText(Pointificator._session.telVarStonesGained);
	Pointificator._gui.statistics.currency.telVarStonesLost.value:SetText(Pointificator._session.telVarStonesLost);
	Pointificator._gui.statistics.currency.telVarStonesPerHour.value:SetText(telVarPerHour);
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.value:SetText(Pointificator._session.largestTelVarGain);
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.value:SetText(Pointificator._session.largestTelVarLoss);
	
	-- update statistics lifetime gui
	Pointificator._gui.statistics.lifetime.totalKillingBlows.value:SetText(Pointificator.SavedVariables.records.killingBlows);
	Pointificator._gui.statistics.lifetime.totalDeaths.value:SetText(Pointificator.SavedVariables.records.deaths);
	Pointificator._gui.statistics.lifetime.ratio.value:SetText(lifeTimeKillDeathRatio);
	Pointificator._gui.statistics.lifetime.totalAvenges.value:SetText(Pointificator.SavedVariables.records.avenges);
	Pointificator._gui.statistics.lifetime.totalRevenges.value:SetText(Pointificator.SavedVariables.records.revenges);
	Pointificator._gui.statistics.lifetime.bestKillingStreak.value:SetText(Pointificator.SavedVariables.records.largestKillingStreak);
	Pointificator._gui.statistics.lifetime.largestApDifference.value:SetText(Pointificator.SavedVariables.records.largestApDifference);
	Pointificator._gui.statistics.lifetime.largestTvGain.value:SetText(Pointificator.SavedVariables.records.largestTvGain);
	Pointificator._gui.statistics.lifetime.largestTvLoss.value:SetText(Pointificator.SavedVariables.records.largestTvLoss);
	
	-- update history values
	Pointificator.UpdateHistoryValues();
end

-------------------------------------------------------------------------------------------------
--  Gets number of AP/H  --
-------------------------------------------------------------------------------------------------
Pointificator.GetPointsPerHour = function()
	
	if (Pointificator._sessionPoints <= 0) then
		return 0;
	end
	
	local currentTime = GetTimeStamp();
	
	local timeDifferenceSeconds = GetDiffBetweenTimeStamps(currentTime, Pointificator._sessionStart);
	
	local timeDifferenceMinutes = timeDifferenceSeconds / 60;
	
	local pointsPerMinute = Pointificator._sessionPoints / timeDifferenceMinutes;
	
	local pointsPerHour = pointsPerMinute * 60;
	
	return math.floor(pointsPerHour);
end

-------------------------------------------------------------------------------------------------
--  Gets number of TV/H  --
-------------------------------------------------------------------------------------------------
Pointificator.GetTelVarPerHour = function()
	
	if (Pointificator._session.telVarStonesGained <= 0) then
		return 0;
	end
	
	local currentTime = GetTimeStamp();
	
	local timeDifferenceSeconds = GetDiffBetweenTimeStamps(currentTime, Pointificator._sessionStart);
	
	local timeDifferenceMinutes = timeDifferenceSeconds / 60;
	
	local stonesPerMinute = Pointificator._session.telVarStonesGained / timeDifferenceMinutes;
	
	local stonesPerHour = stonesPerMinute * 60;
	
	return math.floor(stonesPerHour);
end

-------------------------------------------------------------------------------------------------
--  Gets the rank percentage  --
-------------------------------------------------------------------------------------------------
Pointificator.GetRankPercentage = function()
	
	local currentAvARankPoints = GetUnitAvARankPoints("player");

	local subRankStartsAt, nextSubRankAt, rankStartsAt, nextRankAt = GetAvARankProgress(currentAvARankPoints);
	
	local totalRankPoints = (nextSubRankAt - subRankStartsAt);
	
	local currentPointsInRank = (currentAvARankPoints - subRankStartsAt);
	
	local rankPercentage = currentPointsInRank / (totalRankPoints / 100);
	
	return math.floor(rankPercentage);
end

-------------------------------------------------------------------------------------------------
--  Resets the current session  --
-------------------------------------------------------------------------------------------------
Pointificator.ResetSession = function()

	Pointificator._sessionPoints = 0;
	Pointificator._sessionStart = GetTimeStamp();

	Pointificator._session = {
		killingBlows = 0,
		invalidKills = 0,
		deaths = 0,
		deathsBySuicide = 0,
		deathsByPvE = 0,
		deathsByPvP = 0,
		avenges = 0,
		revenges = 0,
		killingStreak = 0,
		killingStreakRecord = 0,
		largestApDifference = 0,
		initialCampaignRank = nil,
		currentCampaignRank = nil,
		telVarStonesGained = 0,
		telVarStonesLost = 0,
		largestTelVarGain = 0,
		largestTelVarLoss = 0,
		history = {}
	};
	
	Pointificator.ResetHistoryTable();
	
	Pointificator.SetTracker();
	
	local allianceRank = Pointificator.GetCampaignInformation();
	
	Pointificator._session.initialCampaignRank = allianceRank;
	Pointificator._session.currentCampaignRank = allianceRank;
	
	local message = string.format(
		Pointificator._notificationFormat, 
		"Session reset!"
	);
	
	Pointificator.Output(message);
end

-------------------------------------------------------------------------------------------------
--  Shows the current session info  --
-------------------------------------------------------------------------------------------------
Pointificator.ShowSessionInfo = function()

	local isHidden = Pointificator._gui.statistics:IsHidden();

	if (isHidden) then
		Pointificator._gui.statistics:SetHidden(false);	
		SetGameCameraUIMode(true);
	else
		Pointificator._gui.statistics:SetHidden(true);
	end
end

-------------------------------------------------------------------------------------------------
--  Shows the help info  --
-------------------------------------------------------------------------------------------------
Pointificator.ShowHelpInfo = function()

	Pointificator.Output(string.format(
		Pointificator._notificationFormat, 
		"Pointificator " .. Pointificator._version
	));
	
	Pointificator.Output(string.format(
		Pointificator._notificationFormat, 
		"Available commands (also as key bindings):"
	));
	
	Pointificator.Output(string.format(
		Pointificator._notificationFormat, 
		"'/pcr reset' - resets current session"
	));
	
	Pointificator.Output(string.format(
		Pointificator._notificationFormat, 
		"'/pcr session' - displays current session statistics"
	));
	
	Pointificator.Output(string.format(
		Pointificator._notificationFormat, 
		"'/pcr share' - copies your session to clipboard"
	));
end

-------------------------------------------------------------------------------------------------
--  Function for getting campaign information  --
-------------------------------------------------------------------------------------------------
Pointificator.GetCampaignInformation = function()

	local allianceRank = nil;
	
	if (CAMPAIGN_EMPEROR ~= nil and CAMPAIGN_EMPEROR.playerRow ~=nil and CAMPAIGN_EMPEROR.playerRow.rankLabel ~= nil) then
		 local rankLabelText = CAMPAIGN_EMPEROR.playerRow.rankLabel:GetText();
		 
		 allianceRank = tonumber(rankLabelText);
	end

	return allianceRank;
end

-------------------------------------------------------------------------------------------------
--  Initializes the slash commands  --
-------------------------------------------------------------------------------------------------
Pointificator.SlashCommands = function(arg)

	if (arg == Pointificator._slashCommands.resetSession) then
		Pointificator.ResetSession();
	elseif (arg == Pointificator._slashCommands.showSessionInfo) then
		Pointificator.ShowSessionInfo();
	elseif (arg == Pointificator._slashCommands.share) then
		Pointificator.PostStatistics();
	elseif (arg == Pointificator._slashCommands.test) then
	else
		Pointificator.ShowHelpInfo();
	end
end

-------------------------------------------------------------------------------------------------
--  Saves the GUI location  --
-------------------------------------------------------------------------------------------------
function Pointificator.SaveGUILocation()
	Pointificator.SavedVariables.OffsetX = Pointificator._gui:GetLeft()
	Pointificator.SavedVariables.OffsetY = Pointificator._gui:GetTop()
end

-------------------------------------------------------------------------------------------------
--  Event for posting statistics to chat  --
-------------------------------------------------------------------------------------------------
function Pointificator.PostStatistics()
	
	local currentTime = GetTimeStamp();
	local timeDifferenceInSeconds = GetDiffBetweenTimeStamps(currentTime, Pointificator._sessionStart);
	local killDeathRatio = Pointificator.GetKillDeathRatio(Pointificator._session.killingBlows, Pointificator._session.deaths)
	local pointsPerHour = Pointificator.GetPointsPerHour();
	pointsPerHour = Pointificator.PrettifyNumber(pointsPerHour);
	
	local sessionTime = string.format(
		"%.2d:%.2d:%.2d", 
		timeDifferenceInSeconds/(60*60), 
		timeDifferenceInSeconds/60%60, 
		timeDifferenceInSeconds%60
	);
	
	local shareFormat = Pointificator.GetShareFormat();
	local formattedText = shareFormat;
	
	formattedText = string.gsub(formattedText, Pointificator.shareKeys.sessionTime, sessionTime);
	formattedText = string.gsub(formattedText, Pointificator.shareKeys.alliancePoints, Pointificator._sessionPoints);
	formattedText = string.gsub(formattedText, Pointificator.shareKeys.alliancePointsPerHour, pointsPerHour);
	formattedText = string.gsub(formattedText, Pointificator.shareKeys.killingBlows, Pointificator._session.killingBlows);
	formattedText = string.gsub(formattedText, Pointificator.shareKeys.deaths, Pointificator._session.deaths);
	formattedText = string.gsub(formattedText, Pointificator.shareKeys.avenges, Pointificator._session.avenges);
	formattedText = string.gsub(formattedText, Pointificator.shareKeys.revenges, Pointificator._session.revenges);
	formattedText = string.gsub(formattedText, Pointificator.shareKeys.killDeathRatio, killDeathRatio);
	formattedText = string.gsub(formattedText, Pointificator.shareKeys.killingStreak, Pointificator._session.killingStreak);
	formattedText = string.gsub(formattedText, Pointificator.shareKeys.largestApDifference, Pointificator._session.largestApDifference);
	formattedText = string.gsub(formattedText, Pointificator.shareKeys.telvarStonesGained, Pointificator._session.telVarStonesGained);
	formattedText = string.gsub(formattedText, Pointificator.shareKeys.telvarStonesLost, Pointificator._session.telVarStonesLost);
	formattedText = string.gsub(formattedText, Pointificator.shareKeys.largestTvGain, Pointificator._session.largestTelVarGain);
	formattedText = string.gsub(formattedText, Pointificator.shareKeys.largestTvLoss, Pointificator._session.largestTelVarLoss);
	
	if (Pointificator._session.currentCampaignRank ~= nil) then
		formattedText = string.gsub(formattedText, Pointificator.shareKeys.emperorRank, Pointificator._session.currentCampaignRank);
	end
	
	CHAT_SYSTEM.textEntry:SetText(formattedText);
	CHAT_SYSTEM:Maximize();
	CHAT_SYSTEM.textEntry:Open();
	CHAT_SYSTEM.textEntry:FadeIn();
end

-------------------------------------------------------------------------------------------------
--  Function for triggering a leaderboard query every minute --
-------------------------------------------------------------------------------------------------
function Pointificator.QueryCampaignLeaderboard()
	QueryCampaignLeaderboardData();
	zo_callLater(Pointificator.QueryCampaignLeaderboard, 60000);
end

-------------------------------------------------------------------------------------------------
--  Function for triggering a UI update --
-------------------------------------------------------------------------------------------------
function Pointificator.UpdateGUI()
	if (Pointificator.SetTracker) then
		Pointificator.SetTracker();
	end
	
	local isInAvAWorld = IsPlayerInAvAWorld();
	local display = (isInAvAWorld or not Pointificator.SavedVariables.addonSettings.widget.onlyInAvA);
	local isHidden = Pointificator._gui:IsHidden();
	
	if display and isHidden and not Pointificator._forceHideUI then
		-- ensure ui is visible when in ava
		Pointificator._gui:SetHidden(false);
	elseif (not display) and (not isHidden) then
		-- ensure ui is hidden when outside of ava
		Pointificator._gui:SetHidden(true);
	end
end

-------------------------------------------------------------------------------------------------
--  Function for getting the selected channel output  --
-------------------------------------------------------------------------------------------------
Pointificator.GetSelectedChannelOutput = function()
	
	local channelOptions = Pointificator.GetChannelOptions();
	
	local defaultChannel = channelOptions[1];
	
	local selectedChannel = defaultChannel;
	
	if Pointificator.SavedVariables.addonSettings.channelOutput ~= nil then
		selectedChannel = Pointificator.SavedVariables.addonSettings.channelOutput;
	end

	-- find tab index and container index
	local patternStart = string.find(selectedChannel, "{");
	local patternEnd = string.find(selectedChannel, "}");
	
	local pattern = string.sub(selectedChannel, patternStart, patternEnd);
	
	local patternDivider = string.find(pattern, ":");
	
	local containerIndexStr = string.sub(pattern, 2, patternDivider - 1);
	local containerTabIndexStr = string.sub(pattern, patternDivider + 1, string.len(pattern) - 1);
	
	return tonumber(containerIndexStr), tonumber(containerTabIndexStr);
end

-------------------------------------------------------------------------------------------------
--  Function for message outputs --
-------------------------------------------------------------------------------------------------
function Pointificator.Output(msg)

	local containerIndex, containerTabIndex = Pointificator.GetSelectedChannelOutput();
	
	CHAT_SYSTEM.containers[containerIndex].windows[containerTabIndex].buffer:AddMessage(msg)
end

------------------------------------------------------------------------------------------------- 
--  Gets the attacker info from last death recap summary  -- 
------------------------------------------------------------------------------------------------- 
Pointificator.GetAttackerInfo = function()

	local numberOfKillingAttacks = GetNumKillingAttacks();
	local hasAttacker = false;
	local attackerRawName = nil;
	local attackerVeteranRank = nil;
	local attackerLevel = nil;
	local attackerAvARank = nil;
	local isPlayer = false;
	local isBoss = false;
	local alliance = nil;
	local minionName = nil;

	for killingAttackIndex = 1, numberOfKillingAttacks, 1 do

		local attackName, attackDamage, attackIcon, wasKillingBlow, castTimeAgoMS, durationMS = GetKillingAttackInfo(killingAttackIndex);

		if wasKillingBlow then

			hasAttacker = DoesKillingAttackHaveAttacker(killingAttackIndex);

			if hasAttacker then
				
				attackerRawName, 
				attackerVeteranRank, 
				attackerLevel, 
				attackerAvARank, 
				isPlayer, 
				isBoss, 
				alliance, 
				minionName = GetKillingAttackerInfo(killingAttackIndex);
			end

			-- always break when we reach the killing blow
			break;
		end
	end

	return 
		hasAttacker, 
		attackerRawName, 
		attackerVeteranRank, 
		attackerLevel, 
		attackerAvARank, 
		isPlayer, 
		isBoss, 
		alliance, 
		minionName; 
end