-------------------------------------------------------------------------------------------------
-- Builds the actual UI --
-------------------------------------------------------------------------------------------------
Pointificator.BuildUI = function()

	Pointificator.BuildWidget();
	Pointificator.BuildStatistics();
end

-------------------------------------------------------------------------------------------------
-- Builds the widget UI --
-------------------------------------------------------------------------------------------------
Pointificator.BuildWidget = function()

	local widgetPadding = 10;
	local widgetHeight = 30;
	local iconHeight = 16;
	local iconWidth = 16;
	local valuePadddding = iconWidth + 8;
	local valueMaxWidth = 150;
	local wrapperMaxWidth = (valueMaxWidth + valuePadddding + iconWidth + widgetPadding);
	local widgetMaxWidth = (wrapperMaxWidth * 13);
	local font = "Pointificator/fonts/Metamorphous.otf|" .. Pointificator.SavedVariables.addonSettings.widget.fontSize .. "|soft-shadow-thin";
	
	local transparency = nil;
	if Pointificator.SavedVariables.addonSettings.widget.transparencyLevel > 9 then 
		transparency = 1.0;
	else
		transparency = tonumber("0." .. Pointificator.SavedVariables.addonSettings.widget.transparencyLevel);
	end
	
	-- top level window
	Pointificator._gui = Pointificator._wm:CreateTopLevelWindow("PointificatorGUI");
	Pointificator._gui:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, Pointificator.SavedVariables.OffsetX, Pointificator.SavedVariables.OffsetY);
	Pointificator._gui:SetClampedToScreen(true);
	Pointificator._gui:SetMouseEnabled(true);
	Pointificator._gui:SetMovable(true);
	Pointificator._gui:SetHidden(true);
	Pointificator._gui:SetAlpha(1);
	Pointificator._gui:SetHandler("OnMoveStop", Pointificator.SaveGUILocation);

	-- backdrop
	Pointificator._gui.backdrop = Pointificator._wm:CreateControl(nil, Pointificator._gui, CT_BACKDROP);
	Pointificator._gui.backdrop:SetAnchorFill(Pointificator._gui);
	Pointificator._gui.backdrop:SetCenterColor(0.0, 0.0, 0.0, transparency);
	Pointificator._gui.backdrop:SetEdgeColor(0, 0, 0, 0.3);
	Pointificator._gui.backdrop:SetEdgeTexture(nil, 1, 1, 1.0, 1.0);

	-- alliance points
	if Pointificator.SavedVariables.addonSettings.widget.showAlliancePoints then
	
		Pointificator._gui.alliancePoints = Pointificator._wm:CreateControl(nil, Pointificator._gui, CT_CONTROL);
		Pointificator._gui.alliancePoints:SetDimensions(wrapperMaxWidth, widgetHeight);
		
		Pointificator._gui.alliancePoints.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.alliancePoints, CT_TEXTURE);
		Pointificator._gui.alliancePoints.icon:SetDimensions(iconWidth, iconHeight);
		Pointificator._gui.alliancePoints.icon:SetAnchor(LEFT, Pointificator._gui.alliancePoints, LEFT, widgetPadding, 0);
		Pointificator._gui.alliancePoints.icon:SetTexture("Pointificator/media/money1.dds");
		
		Pointificator._gui.alliancePoints.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.alliancePoints.icon, CT_LABEL);
		Pointificator._gui.alliancePoints.label:SetDimensions(valueMaxWidth, widgetHeight);
		Pointificator._gui.alliancePoints.label:SetAnchor(LEFT, Pointificator._gui.alliancePoints.icon, LEFT, valuePadddding, 0);
		Pointificator._gui.alliancePoints.label:SetHorizontalAlignment(0);
		Pointificator._gui.alliancePoints.label:SetVerticalAlignment(1);
		Pointificator._gui.alliancePoints.label:SetFont(font);
	end
	
	-- alliance points / hour
	if Pointificator.SavedVariables.addonSettings.widget.showAlliancePointsPerHour then
		
		Pointificator._gui.alliancePointsPerHour = Pointificator._wm:CreateControl(nil, Pointificator._gui, CT_CONTROL);
		Pointificator._gui.alliancePointsPerHour:SetDimensions(wrapperMaxWidth, widgetHeight);
		
		Pointificator._gui.alliancePointsPerHour.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.alliancePointsPerHour, CT_TEXTURE);
		Pointificator._gui.alliancePointsPerHour.icon:SetDimensions(iconWidth, iconHeight);
		Pointificator._gui.alliancePointsPerHour.icon:SetAnchor(LEFT, Pointificator._gui.alliancePointsPerHour, LEFT, widgetPadding, 0);
		Pointificator._gui.alliancePointsPerHour.icon:SetTexture("Pointificator/media/moneyexchange.dds");
		
		Pointificator._gui.alliancePointsPerHour.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.alliancePointsPerHour.icon, CT_LABEL);
		Pointificator._gui.alliancePointsPerHour.label:SetDimensions(valueMaxWidth, widgetHeight);
		Pointificator._gui.alliancePointsPerHour.label:SetAnchor(LEFT, Pointificator._gui.alliancePointsPerHour.icon, LEFT, valuePadddding, 0);
		Pointificator._gui.alliancePointsPerHour.label:SetHorizontalAlignment(0);
		Pointificator._gui.alliancePointsPerHour.label:SetVerticalAlignment(1);
		Pointificator._gui.alliancePointsPerHour.label:SetFont(font);
	end

	-- percentage to rank
	if Pointificator.SavedVariables.addonSettings.widget.showAllianceRankPercentage then
		
		Pointificator._gui.percentageToRank = Pointificator._wm:CreateControl(nil, Pointificator._gui, CT_CONTROL);
		Pointificator._gui.percentageToRank:SetDimensions(wrapperMaxWidth, widgetHeight);
		
		Pointificator._gui.percentageToRank.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.percentageToRank, CT_TEXTURE);
		Pointificator._gui.percentageToRank.icon:SetDimensions(iconWidth, iconHeight);
		Pointificator._gui.percentageToRank.icon:SetAnchor(LEFT, Pointificator._gui.percentageToRank, LEFT, widgetPadding, 0);
		Pointificator._gui.percentageToRank.icon:SetTexture("Pointificator/media/militaryrank.dds");
		
		Pointificator._gui.percentageToRank.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.percentageToRank.icon, CT_LABEL);
		Pointificator._gui.percentageToRank.label:SetDimensions(valueMaxWidth, widgetHeight);
		Pointificator._gui.percentageToRank.label:SetAnchor(LEFT, Pointificator._gui.percentageToRank.icon, LEFT, valuePadddding, 0);
		Pointificator._gui.percentageToRank.label:SetHorizontalAlignment(0);
		Pointificator._gui.percentageToRank.label:SetVerticalAlignment(1);
		Pointificator._gui.percentageToRank.label:SetFont(font);
	end

	-- time elapsed
	if Pointificator.SavedVariables.addonSettings.widget.showSessionTime then
		
		Pointificator._gui.timeElapsed = Pointificator._wm:CreateControl(nil, Pointificator._gui, CT_CONTROL);
		Pointificator._gui.timeElapsed:SetDimensions(wrapperMaxWidth, widgetHeight);

		Pointificator._gui.timeElapsed.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.timeElapsed, CT_TEXTURE);
		Pointificator._gui.timeElapsed.icon:SetDimensions(iconWidth, iconHeight);
		Pointificator._gui.timeElapsed.icon:SetAnchor(LEFT, Pointificator._gui.timeElapsed, LEFT, widgetPadding, 0);
		Pointificator._gui.timeElapsed.icon:SetTexture("Pointificator/media/elapsed.dds");
		
		Pointificator._gui.timeElapsed.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.timeElapsed.icon, CT_LABEL);
		Pointificator._gui.timeElapsed.label:SetDimensions(valueMaxWidth, widgetHeight);
		Pointificator._gui.timeElapsed.label:SetAnchor(LEFT, Pointificator._gui.timeElapsed.icon, LEFT, valuePadddding, 0);
		Pointificator._gui.timeElapsed.label:SetHorizontalAlignment(0);
		Pointificator._gui.timeElapsed.label:SetVerticalAlignment(1);
		Pointificator._gui.timeElapsed.label:SetFont(font);
	end
	
	-- killing blows
	if Pointificator.SavedVariables.addonSettings.widget.showKillingBlows then
		
		Pointificator._gui.killingBlows = Pointificator._wm:CreateControl(nil, Pointificator._gui, CT_CONTROL);
		Pointificator._gui.killingBlows:SetDimensions(wrapperMaxWidth, widgetHeight);
	
		Pointificator._gui.killingBlows.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.killingBlows, CT_TEXTURE);
		Pointificator._gui.killingBlows.icon:SetDimensions(iconWidth, iconHeight);
		Pointificator._gui.killingBlows.icon:SetAnchor(LEFT, Pointificator._gui.killingBlows, LEFT, widgetPadding, 0);
		Pointificator._gui.killingBlows.icon:SetTexture("Pointificator/media/swords.dds");
		
		Pointificator._gui.killingBlows.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.killingBlows.icon, CT_LABEL);
		Pointificator._gui.killingBlows.label:SetDimensions(valueMaxWidth, widgetHeight);
		Pointificator._gui.killingBlows.label:SetAnchor(LEFT, Pointificator._gui.killingBlows.icon, LEFT, valuePadddding, 0);
		Pointificator._gui.killingBlows.label:SetHorizontalAlignment(0);
		Pointificator._gui.killingBlows.label:SetVerticalAlignment(1);
		Pointificator._gui.killingBlows.label:SetFont(font);
	end
	
	-- deaths
	if Pointificator.SavedVariables.addonSettings.widget.showDeaths then
		
		Pointificator._gui.deaths = Pointificator._wm:CreateControl(nil, Pointificator._gui, CT_CONTROL);
		Pointificator._gui.deaths:SetDimensions(wrapperMaxWidth, widgetHeight);
	
		Pointificator._gui.deaths.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.deaths, CT_TEXTURE);
		Pointificator._gui.deaths.icon:SetDimensions(iconWidth, iconHeight);
		Pointificator._gui.deaths.icon:SetAnchor(LEFT, Pointificator._gui.deaths, LEFT, widgetPadding, 0);
		Pointificator._gui.deaths.icon:SetTexture("Pointificator/media/skull.dds");
		
		Pointificator._gui.deaths.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.deaths.icon, CT_LABEL);
		Pointificator._gui.deaths.label:SetDimensions(valueMaxWidth, widgetHeight);
		Pointificator._gui.deaths.label:SetAnchor(LEFT, Pointificator._gui.deaths.icon, LEFT, valuePadddding, 0);
		Pointificator._gui.deaths.label:SetHorizontalAlignment(0);
		Pointificator._gui.deaths.label:SetVerticalAlignment(1);
		Pointificator._gui.deaths.label:SetFont(font);
	end
	
	-- k/d
	if Pointificator.SavedVariables.addonSettings.widget.showKillDeathRatio then

		Pointificator._gui.kdRatio = Pointificator._wm:CreateControl(nil, Pointificator._gui, CT_CONTROL);
		Pointificator._gui.kdRatio:SetDimensions(wrapperMaxWidth, widgetHeight);

		Pointificator._gui.kdRatio.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.kdRatio, CT_TEXTURE);
		Pointificator._gui.kdRatio.icon:SetDimensions(iconWidth, iconHeight);
		Pointificator._gui.kdRatio.icon:SetAnchor(LEFT, Pointificator._gui.kdRatio, LEFT, widgetPadding, 0);
		Pointificator._gui.kdRatio.icon:SetTexture("Pointificator/media/pulse1.dds");
		
		Pointificator._gui.kdRatio.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.kdRatio.icon, CT_LABEL);
		Pointificator._gui.kdRatio.label:SetDimensions(valueMaxWidth, widgetHeight);
		Pointificator._gui.kdRatio.label:SetAnchor(LEFT, Pointificator._gui.kdRatio.icon, LEFT, valuePadddding, 0);
		Pointificator._gui.kdRatio.label:SetHorizontalAlignment(0);
		Pointificator._gui.kdRatio.label:SetVerticalAlignment(1);
		Pointificator._gui.kdRatio.label:SetFont(font);
	end
	
	-- killing streak
	if Pointificator.SavedVariables.addonSettings.widget.showKillingStreak then

		Pointificator._gui.killingStreak = Pointificator._wm:CreateControl(nil, Pointificator._gui, CT_CONTROL);
		Pointificator._gui.killingStreak:SetDimensions(wrapperMaxWidth, widgetHeight);

		Pointificator._gui.killingStreak.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.killingStreak, CT_TEXTURE);
		Pointificator._gui.killingStreak.icon:SetDimensions(iconWidth, iconHeight);
		Pointificator._gui.killingStreak.icon:SetAnchor(LEFT, Pointificator._gui.killingStreak, LEFT, widgetPadding, 0);
		Pointificator._gui.killingStreak.icon:SetTexture("Pointificator/media/lightning.dds");
		
		Pointificator._gui.killingStreak.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.killingStreak.icon, CT_LABEL);
		Pointificator._gui.killingStreak.label:SetDimensions(valueMaxWidth, widgetHeight);
		Pointificator._gui.killingStreak.label:SetAnchor(LEFT, Pointificator._gui.killingStreak.icon, LEFT, valuePadddding, 0);
		Pointificator._gui.killingStreak.label:SetHorizontalAlignment(0);
		Pointificator._gui.killingStreak.label:SetVerticalAlignment(1);
		Pointificator._gui.killingStreak.label:SetFont(font);
	end
	
	-- emperor rank
	if Pointificator.SavedVariables.addonSettings.widget.showEmperorRank then
		
		Pointificator._gui.emperorRank = Pointificator._wm:CreateControl(nil, Pointificator._gui, CT_CONTROL);
		Pointificator._gui.emperorRank:SetDimensions(wrapperMaxWidth, widgetHeight);

		Pointificator._gui.emperorRank.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.emperorRank, CT_TEXTURE);
		Pointificator._gui.emperorRank.icon:SetDimensions(iconWidth, iconHeight);
		Pointificator._gui.emperorRank.icon:SetAnchor(LEFT, Pointificator._gui.emperorRank, LEFT, widgetPadding, 0);
		Pointificator._gui.emperorRank.icon:SetTexture("Pointificator/media/trophy1.dds");
		
		Pointificator._gui.emperorRank.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.emperorRank.icon, CT_LABEL);
		Pointificator._gui.emperorRank.label:SetDimensions(valueMaxWidth, widgetHeight);
		Pointificator._gui.emperorRank.label:SetAnchor(LEFT, Pointificator._gui.emperorRank.icon, LEFT, valuePadddding, 0);
		Pointificator._gui.emperorRank.label:SetHorizontalAlignment(0);
		Pointificator._gui.emperorRank.label:SetVerticalAlignment(1);
		Pointificator._gui.emperorRank.label:SetFont(font);
	end

	-- TV profit
	if Pointificator.SavedVariables.addonSettings.widget.showTelVarStonesProfit then
		
		Pointificator._gui.tvProfit = Pointificator._wm:CreateControl(nil, Pointificator._gui, CT_CONTROL);
		Pointificator._gui.tvProfit:SetDimensions(wrapperMaxWidth, widgetHeight);

		Pointificator._gui.tvProfit.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.tvProfit, CT_TEXTURE);
		Pointificator._gui.tvProfit.icon:SetDimensions(iconWidth, iconHeight);
		Pointificator._gui.tvProfit.icon:SetAnchor(LEFT, Pointificator._gui.tvProfit, LEFT, widgetPadding, 0);
		Pointificator._gui.tvProfit.icon:SetTexture("Pointificator/media/tel_var.dds");
		
		Pointificator._gui.tvProfit.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.tvProfit.icon, CT_LABEL);
		Pointificator._gui.tvProfit.label:SetDimensions(valueMaxWidth, widgetHeight);
		Pointificator._gui.tvProfit.label:SetAnchor(LEFT, Pointificator._gui.tvProfit.icon, LEFT, valuePadddding, 0);
		Pointificator._gui.tvProfit.label:SetHorizontalAlignment(0);
		Pointificator._gui.tvProfit.label:SetVerticalAlignment(1);
		Pointificator._gui.tvProfit.label:SetFont(font);
	end
	
	-- TV gained
	if Pointificator.SavedVariables.addonSettings.widget.showTelVarStonesGained then
		
		Pointificator._gui.tvGained = Pointificator._wm:CreateControl(nil, Pointificator._gui, CT_CONTROL);
		Pointificator._gui.tvGained:SetDimensions(wrapperMaxWidth, widgetHeight);

		Pointificator._gui.tvGained.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.tvGained, CT_TEXTURE);
		Pointificator._gui.tvGained.icon:SetDimensions(iconWidth, iconHeight);
		Pointificator._gui.tvGained.icon:SetAnchor(LEFT, Pointificator._gui.tvGained, LEFT, widgetPadding, 0);
		Pointificator._gui.tvGained.icon:SetTexture("Pointificator/media/tel_var.dds");
		
		Pointificator._gui.tvGained.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.tvGained.icon, CT_LABEL);
		Pointificator._gui.tvGained.label:SetDimensions(valueMaxWidth, widgetHeight);
		Pointificator._gui.tvGained.label:SetAnchor(LEFT, Pointificator._gui.tvGained.icon, LEFT, valuePadddding, 0);
		Pointificator._gui.tvGained.label:SetHorizontalAlignment(0);
		Pointificator._gui.tvGained.label:SetVerticalAlignment(1);
		Pointificator._gui.tvGained.label:SetFont(font);
	end

	-- TV lost
	if Pointificator.SavedVariables.addonSettings.widget.showTelVarStonesLost then
	
		Pointificator._gui.tvLost = Pointificator._wm:CreateControl(nil, Pointificator._gui, CT_CONTROL);
		Pointificator._gui.tvLost:SetDimensions(wrapperMaxWidth, widgetHeight);

		Pointificator._gui.tvLost.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.tvLost, CT_TEXTURE);
		Pointificator._gui.tvLost.icon:SetDimensions(iconWidth, iconHeight);
		Pointificator._gui.tvLost.icon:SetAnchor(LEFT, Pointificator._gui.tvLost, LEFT, widgetPadding, 0);
		Pointificator._gui.tvLost.icon:SetTexture("Pointificator/media/tel_var.dds");
		
		Pointificator._gui.tvLost.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.tvLost.icon, CT_LABEL);
		Pointificator._gui.tvLost.label:SetDimensions(valueMaxWidth, widgetHeight);
		Pointificator._gui.tvLost.label:SetAnchor(LEFT, Pointificator._gui.tvLost.icon, LEFT, valuePadddding, 0);
		Pointificator._gui.tvLost.label:SetHorizontalAlignment(0);
		Pointificator._gui.tvLost.label:SetVerticalAlignment(1);
		Pointificator._gui.tvLost.label:SetFont(font);
	end

	-- TV per hour
	if Pointificator.SavedVariables.addonSettings.widget.showTelVarStonesPerHour then
	
		Pointificator._gui.tvPerHour = Pointificator._wm:CreateControl(nil, Pointificator._gui, CT_CONTROL);
		Pointificator._gui.tvPerHour:SetDimensions(wrapperMaxWidth, widgetHeight);

		Pointificator._gui.tvPerHour.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.tvPerHour, CT_TEXTURE);
		Pointificator._gui.tvPerHour.icon:SetDimensions(iconWidth, iconHeight);
		Pointificator._gui.tvPerHour.icon:SetAnchor(LEFT, Pointificator._gui.tvPerHour, LEFT, widgetPadding, 0);
		Pointificator._gui.tvPerHour.icon:SetTexture("Pointificator/media/tel_var.dds");
		
		Pointificator._gui.tvPerHour.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.tvPerHour.icon, CT_LABEL);
		Pointificator._gui.tvPerHour.label:SetDimensions(valueMaxWidth, widgetHeight);
		Pointificator._gui.tvPerHour.label:SetAnchor(LEFT, Pointificator._gui.tvPerHour.icon, LEFT, valuePadddding, 0);
		Pointificator._gui.tvPerHour.label:SetHorizontalAlignment(0);
		Pointificator._gui.tvPerHour.label:SetVerticalAlignment(1);
		Pointificator._gui.tvPerHour.label:SetFont(font);
	end

	-- set the width of the widget
	Pointificator._gui:SetDimensions(widgetMaxWidth, widgetHeight);
end

-------------------------------------------------------------------------------------------------
-- Adjusts the widget size --
-------------------------------------------------------------------------------------------------
Pointificator.AdjustWidgetSize = function()

	local widgetWidth = 0;
	local currentWidth = 0;
	local widgetHeight = 30;
	local widgetPadding = Pointificator.SavedVariables.addonSettings.widget.widgetSpacing;
	local iconWidth = 16;
	local valuePadddding = iconWidth + 8;
	local wrapperWidth = 0;
	local totalWidth = 0;
	local totalHeight = 0;
	local anchorPoint = Pointificator._gui;
	local previousWidth = 0;
	local widest = 0;
	local isFirst = true;
	local marginTop = 0;
	
	if Pointificator._gui.alliancePoints ~= nil then
		
		currentWidth = Pointificator._gui.alliancePoints.label:GetTextWidth();
		
		wrapperWidth = (currentWidth + valuePadddding + iconWidth + widgetPadding);
		totalWidth = (totalWidth + wrapperWidth);
		totalHeight = (totalHeight + widgetHeight + widgetPadding);
		widest = math.max(widest, wrapperWidth);
		
		if not isFirst then
			marginTop = (widgetHeight + widgetPadding); 
		end
		
		Pointificator._gui.alliancePoints:SetDimensions(wrapperWidth, widgetHeight);
		
		if Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.horizontal then
			Pointificator._gui.alliancePoints:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, previousWidth, 0);
		elseif Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.vertical then
			Pointificator._gui.alliancePoints:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, 0, marginTop);
		end
		
		previousWidth = wrapperWidth;
		anchorPoint = Pointificator._gui.alliancePoints;
		isFirst = false;
	end
	
	if Pointificator._gui.alliancePointsPerHour ~= nil then
		
		currentWidth = Pointificator._gui.alliancePointsPerHour.label:GetTextWidth();
		
		wrapperWidth = (currentWidth + valuePadddding + iconWidth + widgetPadding);
		totalWidth = (totalWidth + wrapperWidth);
		totalHeight = (totalHeight + widgetHeight + widgetPadding);
		widest = math.max(widest, wrapperWidth);
		
		if not isFirst then
			marginTop = (widgetHeight + widgetPadding); 
		end
		
		Pointificator._gui.alliancePointsPerHour:SetDimensions(wrapperWidth, widgetHeight);
		
		if Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.horizontal then
			Pointificator._gui.alliancePointsPerHour:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, previousWidth, 0);
		elseif Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.vertical then
			Pointificator._gui.alliancePointsPerHour:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, 0, marginTop);
		end
		
		previousWidth = wrapperWidth;
		anchorPoint = Pointificator._gui.alliancePointsPerHour;
		isFirst = false;
	end
	
	if Pointificator._gui.percentageToRank ~= nil then
		
		currentWidth = Pointificator._gui.percentageToRank.label:GetTextWidth();
		
		wrapperWidth = (currentWidth + valuePadddding + iconWidth + widgetPadding);
		totalWidth = (totalWidth + wrapperWidth);
		totalHeight = (totalHeight + widgetHeight + widgetPadding);
		widest = math.max(widest, wrapperWidth);
		
		if not isFirst then
			marginTop = (widgetHeight + widgetPadding); 
		end
		
		Pointificator._gui.percentageToRank:SetDimensions(wrapperWidth, widgetHeight);
		
		if Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.horizontal then
			Pointificator._gui.percentageToRank:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, previousWidth, 0);
		elseif Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.vertical then
			Pointificator._gui.percentageToRank:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, 0, marginTop);
		end
		
		previousWidth = wrapperWidth;
		anchorPoint = Pointificator._gui.percentageToRank;
		isFirst = false;
	end
	
	if Pointificator._gui.timeElapsed ~= nil then
		
		-- special case for elapsed time to avoid flickering
		currentWidth = 72;
		
		wrapperWidth = (currentWidth + valuePadddding + iconWidth + widgetPadding);
		totalWidth = (totalWidth + wrapperWidth);
		totalHeight = (totalHeight + widgetHeight + widgetPadding);
		widest = math.max(widest, wrapperWidth);
		
		if not isFirst then
			marginTop = (widgetHeight + widgetPadding); 
		end
		
		Pointificator._gui.timeElapsed:SetDimensions(wrapperWidth, widgetHeight);
		
		if Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.horizontal then
			Pointificator._gui.timeElapsed:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, previousWidth, 0);
		elseif Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.vertical then
			Pointificator._gui.timeElapsed:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, 0, marginTop);
		end
		
		previousWidth = wrapperWidth;
		anchorPoint = Pointificator._gui.timeElapsed;
		isFirst = false;
	end

	if Pointificator._gui.killingBlows ~= nil then
		
		currentWidth = Pointificator._gui.killingBlows.label:GetTextWidth();
		
		wrapperWidth = (currentWidth + valuePadddding + iconWidth + widgetPadding);
		totalWidth = (totalWidth + wrapperWidth);
		totalHeight = (totalHeight + widgetHeight + widgetPadding);
		widest = math.max(widest, wrapperWidth);
		
		if not isFirst then
			marginTop = (widgetHeight + widgetPadding); 
		end
		
		Pointificator._gui.killingBlows:SetDimensions(wrapperWidth, widgetHeight);
		
		if Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.horizontal then
			Pointificator._gui.killingBlows:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, previousWidth, 0);
		elseif Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.vertical then
			Pointificator._gui.killingBlows:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, 0, marginTop);
		end
		
		previousWidth = wrapperWidth;
		anchorPoint = Pointificator._gui.killingBlows;
		isFirst = false;
	end
	
	if Pointificator._gui.deaths ~= nil then
		
		currentWidth = Pointificator._gui.deaths.label:GetTextWidth();
		
		wrapperWidth = (currentWidth + valuePadddding + iconWidth + widgetPadding);
		totalWidth = (totalWidth + wrapperWidth);
		totalHeight = (totalHeight + widgetHeight + widgetPadding);
		widest = math.max(widest, wrapperWidth);
		
		if not isFirst then
			marginTop = (widgetHeight + widgetPadding); 
		end
		
		Pointificator._gui.deaths:SetDimensions(wrapperWidth, widgetHeight);
		
		if Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.horizontal then
			Pointificator._gui.deaths:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, previousWidth, 0);
		elseif Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.vertical then
			Pointificator._gui.deaths:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, 0, marginTop);
		end
		
		previousWidth = wrapperWidth;
		anchorPoint = Pointificator._gui.deaths;
		isFirst = false;
	end
	
	if Pointificator._gui.kdRatio ~= nil then
		
		currentWidth = Pointificator._gui.kdRatio.label:GetTextWidth();
		
		wrapperWidth = (currentWidth + valuePadddding + iconWidth + widgetPadding);
		totalWidth = (totalWidth + wrapperWidth);
		totalHeight = (totalHeight + widgetHeight + widgetPadding);
		widest = math.max(widest, wrapperWidth);
		
		if not isFirst then
			marginTop = (widgetHeight + widgetPadding); 
		end
		
		Pointificator._gui.kdRatio:SetDimensions(wrapperWidth, widgetHeight);
		
		if Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.horizontal then
			Pointificator._gui.kdRatio:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, previousWidth, 0);
		elseif Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.vertical then
			Pointificator._gui.kdRatio:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, 0, marginTop);
		end		
		
		previousWidth = wrapperWidth;
		anchorPoint = Pointificator._gui.kdRatio;
		isFirst = false;
	end
	
	if Pointificator._gui.killingStreak ~= nil then
		
		currentWidth = Pointificator._gui.killingStreak.label:GetTextWidth();
		
		wrapperWidth = (currentWidth + valuePadddding + iconWidth + widgetPadding);
		totalWidth = (totalWidth + wrapperWidth);
		totalHeight = (totalHeight + widgetHeight + widgetPadding);
		widest = math.max(widest, wrapperWidth);
		
		if not isFirst then
			marginTop = (widgetHeight + widgetPadding); 
		end
		
		Pointificator._gui.killingStreak:SetDimensions(wrapperWidth, widgetHeight);
		
		if Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.horizontal then
			Pointificator._gui.killingStreak:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, previousWidth, 0);
		elseif Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.vertical then
			Pointificator._gui.killingStreak:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, 0, marginTop);
		end
		
		previousWidth = wrapperWidth;
		anchorPoint = Pointificator._gui.killingStreak;
		isFirst = false;
	end
	
	if Pointificator._gui.emperorRank ~= nil then
		
		currentWidth = Pointificator._gui.emperorRank.label:GetTextWidth();
		
		wrapperWidth = (currentWidth + valuePadddding + iconWidth + widgetPadding);
		totalWidth = (totalWidth + wrapperWidth);
		totalHeight = (totalHeight + widgetHeight + widgetPadding);
		widest = math.max(widest, wrapperWidth);
		
		if not isFirst then
			marginTop = (widgetHeight + widgetPadding); 
		end
		
		Pointificator._gui.emperorRank:SetDimensions(wrapperWidth, widgetHeight);
		
		if Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.horizontal then
			Pointificator._gui.emperorRank:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, previousWidth, 0);
		elseif Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.vertical then
			Pointificator._gui.emperorRank:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, 0, marginTop);
		end
		
		previousWidth = wrapperWidth;
		anchorPoint = Pointificator._gui.emperorRank;
		isFirst = false;
	end
	
	if Pointificator._gui.tvProfit ~= nil then
		
		currentWidth = Pointificator._gui.tvProfit.label:GetTextWidth();
		
		wrapperWidth = (currentWidth + valuePadddding + iconWidth + widgetPadding);
		totalWidth = (totalWidth + wrapperWidth);
		totalHeight = (totalHeight + widgetHeight + widgetPadding);
		widest = math.max(widest, wrapperWidth);
		
		if not isFirst then
			marginTop = (widgetHeight + widgetPadding); 
		end
		
		Pointificator._gui.tvProfit:SetDimensions(wrapperWidth, widgetHeight);
		
		if Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.horizontal then
			Pointificator._gui.tvProfit:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, previousWidth, 0);
		elseif Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.vertical then
			Pointificator._gui.tvProfit:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, 0, marginTop);
		end
		
		previousWidth = wrapperWidth;
		anchorPoint = Pointificator._gui.tvProfit;
		isFirst = false;
	end

	if Pointificator._gui.tvGained ~= nil then
		
		currentWidth = Pointificator._gui.tvGained.label:GetTextWidth();
		
		wrapperWidth = (currentWidth + valuePadddding + iconWidth + widgetPadding);
		totalWidth = (totalWidth + wrapperWidth);
		totalHeight = (totalHeight + widgetHeight + widgetPadding);
		widest = math.max(widest, wrapperWidth);
		
		if not isFirst then
			marginTop = (widgetHeight + widgetPadding); 
		end
		
		Pointificator._gui.tvGained:SetDimensions(wrapperWidth, widgetHeight);
		
		if Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.horizontal then
			Pointificator._gui.tvGained:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, previousWidth, 0);
		elseif Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.vertical then
			Pointificator._gui.tvGained:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, 0, marginTop);
		end
		
		previousWidth = wrapperWidth;
		anchorPoint = Pointificator._gui.tvGained;
		isFirst = false;
	end
	
	if Pointificator._gui.tvLost ~= nil then
		
		currentWidth = Pointificator._gui.tvLost.label:GetTextWidth();
		
		wrapperWidth = (currentWidth + valuePadddding + iconWidth + widgetPadding);
		totalWidth = (totalWidth + wrapperWidth);
		totalHeight = (totalHeight + widgetHeight + widgetPadding);
		widest = math.max(widest, wrapperWidth);
		
		if not isFirst then
			marginTop = (widgetHeight + widgetPadding); 
		end
		
		Pointificator._gui.tvLost:SetDimensions(wrapperWidth, widgetHeight);
		
		if Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.horizontal then
			Pointificator._gui.tvLost:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, previousWidth, 0);
		elseif Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.vertical then
			Pointificator._gui.tvLost:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, 0, marginTop);
		end
		
		previousWidth = wrapperWidth;
		anchorPoint = Pointificator._gui.tvLost;
		isFirst = false;
	end
	
	if Pointificator._gui.tvPerHour ~= nil then
		
		currentWidth = Pointificator._gui.tvPerHour.label:GetTextWidth();
		
		wrapperWidth = (currentWidth + valuePadddding + iconWidth + widgetPadding);
		totalWidth = (totalWidth + wrapperWidth);
		totalHeight = (totalHeight + widgetHeight + widgetPadding);
		widest = math.max(widest, wrapperWidth);
		
		if not isFirst then
			marginTop = (widgetHeight + widgetPadding); 
		end
		
		Pointificator._gui.tvPerHour:SetDimensions(wrapperWidth, widgetHeight);
		
		if Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.horizontal then
			Pointificator._gui.tvPerHour:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, previousWidth, 0);
		elseif Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.vertical then
			Pointificator._gui.tvPerHour:SetAnchor(TOPLEFT, anchorPoint, TOPLEFT, 0, marginTop);
		end
		
		previousWidth = wrapperWidth;
		anchorPoint = Pointificator._gui.tvPerHour;
		isFirst = false;
	end
	
	-- ignore the last padding
	totalHeight = (totalHeight - widgetPadding);
	
	-- set the width of the widget
	if Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.horizontal then
		Pointificator._gui:SetDimensions(totalWidth, widgetHeight);
	elseif Pointificator.SavedVariables.addonSettings.widget.widgetDisplayType == Pointificator.widgetDisplayTypes.vertical then
		Pointificator._gui:SetDimensions(widest, totalHeight);
	end
end