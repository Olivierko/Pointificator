-------------------------------------------------------------------------------------------------
--  Function for getting the share format  --
-------------------------------------------------------------------------------------------------
Pointificator.GetShareFormat = function()
	if (Pointificator.SavedVariables.addonSettings.shareFormat ~= "{}") then 
		return Pointificator.SavedVariables.addonSettings.shareFormat;
	else 
		return Pointificator._defaultSettings.addonSettings.shareFormat;
	end
end

-------------------------------------------------------------------------------------------------
--  Function for getting channels  --
-------------------------------------------------------------------------------------------------
Pointificator.GetChannelOptions = function()
	
	local options = {};

	local nrOfChatContainers = GetNumChatContainers();
	local nrOfChatContainerTabs = nil;
	
	for chatContainerIndex = 1, nrOfChatContainers, 1 do
	
		nrOfChatContainerTabs = GetNumChatContainerTabs(chatContainerIndex);
		
		for chatContainerTabIndex = 1, nrOfChatContainerTabs, 1 do
		
			local tabName = GetChatContainerTabInfo(
				chatContainerIndex, 
				chatContainerTabIndex
			);
			
			local option = string.format(
				"%s {%d:%d}",
				tabName,
				chatContainerIndex,
				chatContainerTabIndex
			);
			
			table.insert(options, option);
		end
	end
	
	return options;
end

-------------------------------------------------------------------------------------------------
--  Function for initializing settings  --
-------------------------------------------------------------------------------------------------
Pointificator.InitializeSettings = function()

	local LAM2 = LibStub("LibAddonMenu-2.0")
	
	local panel = {
		type = "panel",
		name = "Pointificator",
		author = "@Olivierko",
		version = Pointificator._version,
		slashCommand = "/pcr settings"
	};
	
	local channelOptions = Pointificator.GetChannelOptions();
	
	local fontSizes = { 10, 12, 14, 16, 18, 20 };
	
	local widgetDisplayTypes = { Pointificator.widgetDisplayTypes.horizontal, Pointificator.widgetDisplayTypes.vertical };
	
	local settings = {
		[1] = {
			type = "submenu",
			name = "Widget",
			tooltip = "Settings for the main widget UI.",
			controls = {
				[1] = {
					type = "description",
					title = nil,
					text = "Customize your widget UI by selecting the type of data you want to have included in your main widget UI, changing these settings may require a '/reloadui'.",
					width = "full",
				},
				[2] = {
					type = "checkbox",
					name = "Alliance points:",
					tooltip = "Whether or not to display alliance points within the widget.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.showAlliancePoints end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.widget.showAlliancePoints = value end,
					warning = "Changing this option will require a reload of your UI.",
				},
				[3] = {
					type = "checkbox",
					name = "Alliance points per hour:",
					tooltip = "Whether or not to display alliance points per hour within the widget.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.showAlliancePointsPerHour end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.widget.showAlliancePointsPerHour = value end,
					warning = "Changing this option will require a reload of your UI.",
				},
				[4] = {
					type = "checkbox",
					name = "Alliance rank percentage:",
					tooltip = "Whether or not to display alliance rank percentage within the widget.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.showAllianceRankPercentage end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.widget.showAllianceRankPercentage = value end,
					warning = "Changing this option will require a reload of your UI.",
				},
				[5] = {
					type = "checkbox",
					name = "Session time:",
					tooltip = "Whether or not to display elapsed session time within the widget.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.showSessionTime end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.widget.showSessionTime = value end,
					warning = "Changing this option will require a reload of your UI.",
				},
				[6] = {
					type = "checkbox",
					name = "Killing blows:",
					tooltip = "Whether or not to display killing blows within the widget.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.showKillingBlows end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.widget.showKillingBlows = value end,
					warning = "Changing this option will require a reload of your UI.",
				},
				[7] = {
					type = "checkbox",
					name = "Deaths:",
					tooltip = "Whether or not to display deaths within the widget.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.showDeaths end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.widget.showDeaths = value end,
					warning = "Changing this option will require a reload of your UI.",
				},
				[8] = {
					type = "checkbox",
					name = "Kill/Death ratio:",
					tooltip = "Whether or not to display K/D ratio within the widget.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.showKillDeathRatio end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.widget.showKillDeathRatio = value end,
					warning = "Changing this option will require a reload of your UI.",
				},
				[9] = {
					type = "checkbox",
					name = "Killing streak:",
					tooltip = "Whether or not to display killing streak within the widget.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.showKillingStreak end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.widget.showKillingStreak = value end,
					warning = "Changing this option will require a reload of your UI.",
				},
				[10] = {
					type = "checkbox",
					name = "Emperor rank:",
					tooltip = "Whether or not to display emperor rank within the widget.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.showEmperorRank end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.widget.showEmperorRank = value end,
					warning = "Changing this option will require a reload of your UI.",
				},
				[11] = {
					type = "checkbox",
					name = "Tel Var stones profit:",
					tooltip = "Whether or not to display your TV stones profit within the widget.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.showTelVarStonesProfit end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.widget.showTelVarStonesProfit = value end,
					warning = "Changing this option will require a reload of your UI.",
				},
				[12] = {
					type = "checkbox",
					name = "Tel Var stones gained:",
					tooltip = "Whether or not to display gained TV stones within the widget.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.showTelVarStonesGained end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.widget.showTelVarStonesGained = value end,
					warning = "Changing this option will require a reload of your UI.",
				},
				[13] = {
					type = "checkbox",
					name = "Tel Var stones lost:",
					tooltip = "Whether or not to display lost TV stones within the widget.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.showTelVarStonesLost end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.widget.showTelVarStonesLost = value end,
					warning = "Changing this option will require a reload of your UI.",
				},
				[14] = {
					type = "checkbox",
					name = "Tel Var stones per hour:",
					tooltip = "Whether or not to display TV stones per hour within the widget.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.showTelVarStonesPerHour end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.widget.showTelVarStonesPerHour = value end,
					warning = "Changing this option will require a reload of your UI.",
				},
				[15] = {
					type = "slider",
					name = "Transparency:",
					tooltip = "The transparency level of the background.",
					min = 1,
					max = 10,
					step = 1,
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.transparencyLevel end,
					setFunc = function(value) 
						
						local transparency = nil;
						if value > 9 then 
							transparency = 1.0;
						else
							transparency = tonumber("0." .. value);
						end
						
						Pointificator.SavedVariables.addonSettings.widget.transparencyLevel = value;
						
						Pointificator._gui.backdrop:SetCenterColor(0.0, 0.0, 0.0, transparency);
					end,
				},
				[16] = {
					type = "checkbox",
					name = "Only in AvA:",
					tooltip = "Whether or not to only display the addon whilst you're inside a alliance versus alliance zone.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.onlyInAvA end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.widget.onlyInAvA = value end,
				},
				[17] = {
					type = "dropdown",
					name = "Font size:",
					tooltip = "The font size of each value within the widget.",
					choices = fontSizes,
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.fontSize end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.widget.fontSize = value end,
					warning = "Changing this option will require a reload of your UI.",
				},
				[18] = {
					type = "slider",
					name = "Widget spacing:",
					tooltip = "The spacing between each value within the widget.",
					min = 0,
					max = 50,
					step = 1,
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.widgetSpacing end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.widget.widgetSpacing = value end,
				},
				[19] = {
					type = "dropdown",
					name = "Display type:",
					tooltip = "The display type for the widget.",
					choices = widgetDisplayTypes,
					getFunc = function() return Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType = value end,
				},
				[20] = {
					type = "button",
					name = "Reload UI",
					tooltip = "Reloads the UI.",
					func = function() ReloadUI(); end,
					width = "full",	
					warning = "Pressing this button will trigger a reload of the UI.",
				},
			},
		},
		[2] = {
			type = "submenu",
			name = "Notifications",
			tooltip = "Settings for various notifications.",
			controls = {
				[1] = {
					type = "checkbox",
					name = "Play sounds:",
					tooltip = "Whether or not to play any sounds on notifications.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.playSounds end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.playSounds = value end,
				},
				[2] = {
					type = "checkbox",
					name = "Killing blows:",
					tooltip = "Whether or not to output killing blows in the chat window.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.killingBlowNotifications end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.killingBlowNotifications = value end,
				},
				[3] = {
					type = "checkbox",
					name = "Deaths:",
					tooltip = "Whether or not to output deaths in the chat window.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.deathNotifications end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.deathNotifications = value end,
				},
				[4] = {
					type = "checkbox",
					name = "Avenges:",
					tooltip = "Whether or not to output avenges in the chat window.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.avengeNotifications end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.avengeNotifications = value end,
				},
				[5] = {
					type = "checkbox",
					name = "Revenges:",
					tooltip = "Whether or not to output revenges in the chat window.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.revengeNotifications end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.revengeNotifications = value end,
				},
				[6] = {
					type = "checkbox",
					name = "Alliance points:",
					tooltip = "Whether or not to output alliance points when gained in the chat window.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.alliancePointsNotifications end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.alliancePointsNotifications = value end,
				},
				[7] = {
					type = "slider",
					name = "Alliance points threshold:",
					tooltip = "The threshold amount when to allow logging of alliance points.",
					min = 1,
					max = 10000,
					getFunc = function() return Pointificator.SavedVariables.addonSettings.alliancePointsThreshold end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.alliancePointsThreshold = value end,
				},
				[8] = {
					type = "checkbox",
					name = "Tel Var stones:",
					tooltip = "Whether or not to output when you loose or gain Tel Var stones in the chat window.",
					getFunc = function() return Pointificator.SavedVariables.addonSettings.telVarStonesNotifications end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.telVarStonesNotifications = value end,
				},
				[9] = {
					type = "slider",
					name = "Tel Var stones threshold:",
					tooltip = "The threshold amount when to allow logging of Tel Var stones (both gains and losses).",
					min = 1,
					max = 10000,
					getFunc = function() return Pointificator.SavedVariables.addonSettings.telVarStonesThreshold end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.telVarStonesThreshold = value end,
				},
				[10] = {
					type = "dropdown",
					name = "Channel output:",
					tooltip = "The channel to use for message outputs.",
					choices = channelOptions,
					getFunc = function() return Pointificator.SavedVariables.addonSettings.channelOutput end,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.channelOutput = value end,
				},
				[11] = {
					type = "colorpicker",
					name = "Alliance points output color",
					tooltip = "The color for alliance points output.",
					getFunc = function() 
						return 
							Pointificator.SavedVariables.addonSettings.notificationColors.alliancePoints.r, 
							Pointificator.SavedVariables.addonSettings.notificationColors.alliancePoints.g, 
							Pointificator.SavedVariables.addonSettings.notificationColors.alliancePoints.b
					end,	
					setFunc = function(r,g,b,a) 
						Pointificator.SavedVariables.addonSettings.notificationColors.alliancePoints.r = r;
						Pointificator.SavedVariables.addonSettings.notificationColors.alliancePoints.g = g;
						Pointificator.SavedVariables.addonSettings.notificationColors.alliancePoints.b = b;
					end,
					width = "full",
				},
				[12] = {
					type = "colorpicker",
					name = "Tel var stones output color",
					tooltip = "The color for tel var stones output.",
					getFunc = function() 
						return 
							Pointificator.SavedVariables.addonSettings.notificationColors.telVarStones.r, 
							Pointificator.SavedVariables.addonSettings.notificationColors.telVarStones.g, 
							Pointificator.SavedVariables.addonSettings.notificationColors.telVarStones.b
					end,	
					setFunc = function(r,g,b,a) 
						Pointificator.SavedVariables.addonSettings.notificationColors.telVarStones.r = r;
						Pointificator.SavedVariables.addonSettings.notificationColors.telVarStones.g = g;
						Pointificator.SavedVariables.addonSettings.notificationColors.telVarStones.b = b;
					end,
					width = "full",
				},
			},
		},
		[3] = {
			type = "submenu",
			name = "Social",
			tooltip = "Settings for social interactions.",
			controls = {
				[1] = {
					type = "editbox",
					name = "Text share format:",
					tooltip = "The text share format.",
					width = "full",
					isMultiline = true,
					getFunc = Pointificator.GetShareFormat,
					setFunc = function(value) Pointificator.SavedVariables.addonSettings.shareFormat = value end,
				},
				[2] = {
					type = "description",
					title = "Share formats:",
					width = "full",
					text = "Session time: {st}\nAlliance points: {ap}\nAlliance points per hour: {aph}\nKilling blows: {kb}\nDeaths: {d}\nAvenges: {a}\nRevenges: {r}\nKill death ratio: {kdr}\nKilling streak: {ks}\nLargest AP difference: {lapd}\nEmperor rank: {er}\nTel Var stones gained: {tvg}\nTel Var stones lost: {tvl}\nLargest Tel Var stones gain: {ltvg}\nLargest Tel Var stones loss: {ltvl}",
				},
			},
		},
	};
	
	LAM2:RegisterAddonPanel("MyAddonOptions", panel);
	LAM2:RegisterOptionControls("MyAddonOptions", settings);
end

Pointificator.RGBToHex = function(r, g, b, a)
	
	local colorDef = ZO_ColorDef:New(r, g, b, a);
	
	return colorDef:ToHex();
end