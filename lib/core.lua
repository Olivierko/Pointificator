Pointificator = {}

-------------------------------------------------------------------------------------------------
--  Initialize constants --
-------------------------------------------------------------------------------------------------
Pointificator._wm = WINDOW_MANAGER;
Pointificator._version = "3.7";
Pointificator._tracker = "Pointificator";
Pointificator._slashCommand = "/pcr";
Pointificator._slashCommands = {
	resetSession = "reset",
	showSessionInfo = "session",
	share = "share",
	test = "test"
};
Pointificator.shareKeys = {
	sessionTime = "{st}",
	alliancePoints = "{ap}",
	alliancePointsPerHour = "{aph}",
	killingBlows = "{kb}",
	deaths = "{d}",
	avenges = "{a}",
	revenges = "{r}",
	killDeathRatio = "{kdr}",
	killingStreak = "{ks}",
	largestApDifference = "{lapd}",
	emperorRank = "{er}",
	telvarStonesGained = "{tvg}",
	telvarStonesLost = "{tvl}",
	largestTvGain = "{ltvg}",
	largestTvLoss = "{ltvl}"
};
Pointificator._playerLeaderBoardIndex = 101;
Pointificator._pollInterval = 1000;
Pointificator._killTimeDelay = 2;
Pointificator._state = {
	activeStatisticPage = 1,
	history = {
		startIndex = 1
	}
};
Pointificator._statisticPages = {
	overview = {
		id = 1,
		name = "Overview"
	},
	combat = {
		id = 2,
		name = "Combat"
	},
	currency = {
		id = 3,
		name = "Currency"
	},
	lifetime = {
		id = 4,
		name = "Lifetime"
	},
	history = {
		id = 5,
		name = "History"
	},
};
Pointificator._history = {
	minEntries = 1,
	maxEntries = 10
};
Pointificator._notificationFormat = "|cFF3300//|r %s";
Pointificator._allianceColors = {
	[1] = "FFCC00",
	[2] = "990000",
	[3] = "0066ff"
};
Pointificator._fontXSmall = "Pointificator/fonts/Metamorphous.otf|" .. 12 .. "|soft-shadow-thin";
Pointificator._fontSmall = "Pointificator/fonts/Metamorphous.otf|" .. 14 .. "|soft-shadow-thin";
Pointificator._font = "Pointificator/fonts/Metamorphous.otf|" .. 16 .. "|soft-shadow-thin";
Pointificator._fontMedium = "Pointificator/fonts/Metamorphous.otf|" .. 18 .. "|soft-shadow-thin";
Pointificator._fontLarge = "Pointificator/fonts/Metamorphous.otf|" .. 24 .. "|soft-shadow-thin";
Pointificator._playerName = GetUnitName("player");
Pointificator.widgetDisplayTypes = {
	horizontal = "Horizontal",
	vertical = "Vertical"
};
-------------------------------------------------------------------------------------------------
--  Initialize variables --
-------------------------------------------------------------------------------------------------
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
Pointificator._defaultSettings = {
	OffsetX = 0,
	OffsetY = 0,
	addonSettings = {
		playSounds = true,
		killingBlowNotifications = true,
		deathNotifications = true,
		avengeNotifications = true,
		revengeNotifications = true,
		alliancePointsNotifications = true,
		telVarStonesNotifications = true,
		alliancePointsThreshold = 100,
		telVarStonesThreshold = 10,
		shareFormat = "Time played: {st} >> Kills: {kb} >> Deaths: {d} >> Alliance points: {ap} >> Emperor rank: {er}",
		channelOutput = nil,
		widget = {
			onlyInAvA = true,
			transparencyLevel = 2,
			showAlliancePoints = true,
			showAlliancePointsPerHour = true,
			showAllianceRankPercentage = true,
			showSessionTime = true,
			showKillingBlows = true,
			showDeaths = true,
			showKillDeathRatio = true,
			showKillingStreak = true,
			showEmperorRank = true,
			showTelVarStonesProfit = true,
			showTelVarStonesGained = true,
			showTelVarStonesLost = true,
			showTelVarStonesPerHour = true,
			fontSize = 16,
			widgetSpacing = 10,
			widgetDisplayType = Pointificator.widgetDisplayTypes.horizontal,
		},
		notificationColors = {
			alliancePoints = {
				r = 0.2745098174,
				g = 0.7921568751,
				b = 0.1372549087
			},
			telVarStones = {
				r = 0.1607843190,
				g = 0.4470588267,
				b = 0.8823529482
			}
		}
	},
	records = {
		killingBlows = 0,
		deaths = 0,
		deathsBySuicide = 0,
		deathsByPvE = 0,
		deathsByPvP = 0,
		avenges = 0,
		revenges = 0,
		largestKillingStreak = 0,
		largestApDifference = 0,
		largestTvGain = 0,
		largestTvLoss = 0
	},
};
Pointificator._forceHideUI = false;
Pointificator._mainUILayer = 2;