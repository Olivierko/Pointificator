-------------------------------------------------------------------------------------------------
-- Builds the overview page --
-------------------------------------------------------------------------------------------------
Pointificator.BuildOverviewPage = function()

	-- overview container
	Pointificator._gui.statistics.overview = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.pagesContainer, CT_CONTROL);
	Pointificator._gui.statistics.overview:SetDimensions(640, 330);
	Pointificator._gui.statistics.overview:SetAnchor(TOPLEFT, Pointificator._gui.statistics.pagesContainer, TOPLEFT, 25, 0);
	Pointificator._gui.statistics.overview:SetHidden(true);
		
	-- session time container
	Pointificator._gui.statistics.overview.sessionTime = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview, CT_CONTROL);
	Pointificator._gui.statistics.overview.sessionTime:SetDimensions(540, 50);
	Pointificator._gui.statistics.overview.sessionTime:SetAnchor(TOPLEFT, Pointificator._gui.statistics.overview, TOPLEFT, 125, 0);

	-- session time icon
	Pointificator._gui.statistics.overview.sessionTime.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.sessionTime, CT_TEXTURE);
	Pointificator._gui.statistics.overview.sessionTime.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.overview.sessionTime.icon:SetAnchor(LEFT, Pointificator._gui.statistics.overview.sessionTime, LEFT, 0, 0);
	Pointificator._gui.statistics.overview.sessionTime.icon:SetTexture("Pointificator/media/elapsed.dds");
	
	-- session time label
	Pointificator._gui.statistics.overview.sessionTime.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.sessionTime, CT_LABEL);
	Pointificator._gui.statistics.overview.sessionTime.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.overview.sessionTime.label:SetAnchor(LEFT, Pointificator._gui.statistics.overview.sessionTime, LEFT, 20, 0);
	Pointificator._gui.statistics.overview.sessionTime.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.overview.sessionTime.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.overview.sessionTime.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.overview.sessionTime.label:SetText("Session time:");
	
	-- session time value
	Pointificator._gui.statistics.overview.sessionTime.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.sessionTime, CT_LABEL);
	Pointificator._gui.statistics.overview.sessionTime.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.overview.sessionTime.value:SetAnchor(LEFT, Pointificator._gui.statistics.overview.sessionTime, LEFT, 275, 0);
	Pointificator._gui.statistics.overview.sessionTime.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.overview.sessionTime.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.overview.sessionTime.value:SetFont(Pointificator._fontMedium);
	
	-- alliance points container
	Pointificator._gui.statistics.overview.alliancePoints = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview, CT_CONTROL);
	Pointificator._gui.statistics.overview.alliancePoints:SetDimensions(540, 50);
	Pointificator._gui.statistics.overview.alliancePoints:SetAnchor(TOPLEFT, Pointificator._gui.statistics.overview, TOPLEFT, 125, 30);
	
	-- alliance points icon
	Pointificator._gui.statistics.overview.alliancePoints.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.alliancePoints, CT_TEXTURE);
	Pointificator._gui.statistics.overview.alliancePoints.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.overview.alliancePoints.icon:SetAnchor(LEFT, Pointificator._gui.statistics.overview.alliancePoints, LEFT, 0, 0);
	Pointificator._gui.statistics.overview.alliancePoints.icon:SetTexture("Pointificator/media/money1.dds");
	
	-- alliance points label
	Pointificator._gui.statistics.overview.alliancePoints.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.alliancePoints, CT_LABEL);
	Pointificator._gui.statistics.overview.alliancePoints.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.overview.alliancePoints.label:SetAnchor(LEFT, Pointificator._gui.statistics.overview.alliancePoints, LEFT, 20, 0);
	Pointificator._gui.statistics.overview.alliancePoints.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.overview.alliancePoints.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.overview.alliancePoints.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.overview.alliancePoints.label:SetText("Alliance points:");
	
	-- alliance points value
	Pointificator._gui.statistics.overview.alliancePoints.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.alliancePoints, CT_LABEL);
	Pointificator._gui.statistics.overview.alliancePoints.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.overview.alliancePoints.value:SetAnchor(LEFT, Pointificator._gui.statistics.overview.alliancePoints, LEFT, 275, 0);
	Pointificator._gui.statistics.overview.alliancePoints.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.overview.alliancePoints.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.overview.alliancePoints.value:SetFont(Pointificator._fontMedium);
	
	-- alliance points per hour container
	Pointificator._gui.statistics.overview.alliancePointsPerHour = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview, CT_CONTROL);
	Pointificator._gui.statistics.overview.alliancePointsPerHour:SetDimensions(540, 50);
	Pointificator._gui.statistics.overview.alliancePointsPerHour:SetAnchor(TOPLEFT, Pointificator._gui.statistics.overview, TOPLEFT, 125, 60);
	
	-- alliance points per hour icon
	Pointificator._gui.statistics.overview.alliancePointsPerHour.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.alliancePointsPerHour, CT_TEXTURE);
	Pointificator._gui.statistics.overview.alliancePointsPerHour.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.overview.alliancePointsPerHour.icon:SetAnchor(LEFT, Pointificator._gui.statistics.overview.alliancePointsPerHour, LEFT, 0, 0);
	Pointificator._gui.statistics.overview.alliancePointsPerHour.icon:SetTexture("Pointificator/media/moneyexchange.dds");
	
	-- alliance points per hour label
	Pointificator._gui.statistics.overview.alliancePointsPerHour.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.alliancePointsPerHour, CT_LABEL);
	Pointificator._gui.statistics.overview.alliancePointsPerHour.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.overview.alliancePointsPerHour.label:SetAnchor(LEFT, Pointificator._gui.statistics.overview.alliancePointsPerHour, LEFT, 20, 0);
	Pointificator._gui.statistics.overview.alliancePointsPerHour.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.overview.alliancePointsPerHour.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.overview.alliancePointsPerHour.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.overview.alliancePointsPerHour.label:SetText("AP/H:");
	
	-- alliance points per hour value
	Pointificator._gui.statistics.overview.alliancePointsPerHour.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.alliancePointsPerHour, CT_LABEL);
	Pointificator._gui.statistics.overview.alliancePointsPerHour.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.overview.alliancePointsPerHour.value:SetAnchor(LEFT, Pointificator._gui.statistics.overview.alliancePointsPerHour, LEFT, 275, 0);
	Pointificator._gui.statistics.overview.alliancePointsPerHour.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.overview.alliancePointsPerHour.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.overview.alliancePointsPerHour.value:SetFont(Pointificator._fontMedium);
	
	-- killing blows container
	Pointificator._gui.statistics.overview.killingBlows = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview, CT_CONTROL);
	Pointificator._gui.statistics.overview.killingBlows:SetDimensions(540, 50);
	Pointificator._gui.statistics.overview.killingBlows:SetAnchor(TOPLEFT, Pointificator._gui.statistics.overview, TOPLEFT, 125, 90);
	
	-- killing blows icon
	Pointificator._gui.statistics.overview.killingBlows.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.killingBlows, CT_TEXTURE);
	Pointificator._gui.statistics.overview.killingBlows.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.overview.killingBlows.icon:SetAnchor(LEFT, Pointificator._gui.statistics.overview.killingBlows, LEFT, 0, 0);
	Pointificator._gui.statistics.overview.killingBlows.icon:SetTexture("Pointificator/media/swords.dds");
	
	-- killing blows label
	Pointificator._gui.statistics.overview.killingBlows.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.killingBlows, CT_LABEL);
	Pointificator._gui.statistics.overview.killingBlows.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.overview.killingBlows.label:SetAnchor(LEFT, Pointificator._gui.statistics.overview.killingBlows, LEFT, 20, 0);
	Pointificator._gui.statistics.overview.killingBlows.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.overview.killingBlows.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.overview.killingBlows.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.overview.killingBlows.label:SetText("Killing blows:");
	
	-- killing blows value
	Pointificator._gui.statistics.overview.killingBlows.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.killingBlows, CT_LABEL);
	Pointificator._gui.statistics.overview.killingBlows.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.overview.killingBlows.value:SetAnchor(LEFT, Pointificator._gui.statistics.overview.killingBlows, LEFT, 275, 0);
	Pointificator._gui.statistics.overview.killingBlows.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.overview.killingBlows.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.overview.killingBlows.value:SetFont(Pointificator._fontMedium);
	
	-- deaths container
	Pointificator._gui.statistics.overview.deaths = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview, CT_CONTROL);
	Pointificator._gui.statistics.overview.deaths:SetDimensions(540, 50);
	Pointificator._gui.statistics.overview.deaths:SetAnchor(TOPLEFT, Pointificator._gui.statistics.overview, TOPLEFT, 125, 120);

	-- deaths icon
	Pointificator._gui.statistics.overview.deaths.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.deaths, CT_TEXTURE);
	Pointificator._gui.statistics.overview.deaths.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.overview.deaths.icon:SetAnchor(LEFT, Pointificator._gui.statistics.overview.deaths, LEFT, 0, 0);
	Pointificator._gui.statistics.overview.deaths.icon:SetTexture("Pointificator/media/skull.dds");
	
	-- deaths label
	Pointificator._gui.statistics.overview.deaths.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.deaths, CT_LABEL);
	Pointificator._gui.statistics.overview.deaths.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.overview.deaths.label:SetAnchor(LEFT, Pointificator._gui.statistics.overview.deaths, LEFT, 20, 0);
	Pointificator._gui.statistics.overview.deaths.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.overview.deaths.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.overview.deaths.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.overview.deaths.label:SetText("Deaths:");
	
	-- deaths value
	Pointificator._gui.statistics.overview.deaths.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.deaths, CT_LABEL);
	Pointificator._gui.statistics.overview.deaths.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.overview.deaths.value:SetAnchor(LEFT, Pointificator._gui.statistics.overview.deaths, LEFT, 275, 0);
	Pointificator._gui.statistics.overview.deaths.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.overview.deaths.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.overview.deaths.value:SetFont(Pointificator._fontMedium);
	
	-- ratio container
	Pointificator._gui.statistics.overview.ratio = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview, CT_CONTROL);
	Pointificator._gui.statistics.overview.ratio:SetDimensions(540, 50);
	Pointificator._gui.statistics.overview.ratio:SetAnchor(TOPLEFT, Pointificator._gui.statistics.overview, TOPLEFT, 125, 150);
	
	-- ratio icon
	Pointificator._gui.statistics.overview.ratio.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.ratio, CT_TEXTURE);
	Pointificator._gui.statistics.overview.ratio.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.overview.ratio.icon:SetAnchor(LEFT, Pointificator._gui.statistics.overview.ratio, LEFT, 0, 0);
	Pointificator._gui.statistics.overview.ratio.icon:SetTexture("Pointificator/media/pulse1.dds");
	
	-- ratio label
	Pointificator._gui.statistics.overview.ratio.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.ratio, CT_LABEL);
	Pointificator._gui.statistics.overview.ratio.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.overview.ratio.label:SetAnchor(LEFT, Pointificator._gui.statistics.overview.ratio, LEFT, 20, 0);
	Pointificator._gui.statistics.overview.ratio.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.overview.ratio.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.overview.ratio.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.overview.ratio.label:SetText("K/D:");
	
	-- ratio value
	Pointificator._gui.statistics.overview.ratio.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.ratio, CT_LABEL);
	Pointificator._gui.statistics.overview.ratio.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.overview.ratio.value:SetAnchor(LEFT, Pointificator._gui.statistics.overview.ratio, LEFT, 275, 0);
	Pointificator._gui.statistics.overview.ratio.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.overview.ratio.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.overview.ratio.value:SetFont(Pointificator._fontMedium);
	
	-- emperor rank container
	Pointificator._gui.statistics.overview.emperorRank = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview, CT_CONTROL);
	Pointificator._gui.statistics.overview.emperorRank:SetDimensions(540, 50);
	Pointificator._gui.statistics.overview.emperorRank:SetAnchor(TOPLEFT, Pointificator._gui.statistics.overview, TOPLEFT, 125, 180);

	-- emperor rank icon
	Pointificator._gui.statistics.overview.emperorRank.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.emperorRank, CT_TEXTURE);
	Pointificator._gui.statistics.overview.emperorRank.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.overview.emperorRank.icon:SetAnchor(LEFT, Pointificator._gui.statistics.overview.emperorRank, LEFT, 0, 0);
	Pointificator._gui.statistics.overview.emperorRank.icon:SetTexture("Pointificator/media/trophy1.dds");
	
	-- emperor rank label
	Pointificator._gui.statistics.overview.emperorRank.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.emperorRank, CT_LABEL);
	Pointificator._gui.statistics.overview.emperorRank.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.overview.emperorRank.label:SetAnchor(LEFT, Pointificator._gui.statistics.overview.emperorRank, LEFT, 20, 0);
	Pointificator._gui.statistics.overview.emperorRank.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.overview.emperorRank.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.overview.emperorRank.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.overview.emperorRank.label:SetText("Emperor rank:");
	
	-- emperor rank value
	Pointificator._gui.statistics.overview.emperorRank.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.emperorRank, CT_LABEL);
	Pointificator._gui.statistics.overview.emperorRank.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.overview.emperorRank.value:SetAnchor(LEFT, Pointificator._gui.statistics.overview.emperorRank, LEFT, 275, 0);
	Pointificator._gui.statistics.overview.emperorRank.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.overview.emperorRank.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.overview.emperorRank.value:SetFont(Pointificator._fontMedium);
	
	-- tel var stones profit container
	Pointificator._gui.statistics.overview.tvProfit = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview, CT_CONTROL);
	Pointificator._gui.statistics.overview.tvProfit:SetDimensions(540, 50);
	Pointificator._gui.statistics.overview.tvProfit:SetAnchor(TOPLEFT, Pointificator._gui.statistics.overview, TOPLEFT, 125, 210);

	-- tel var stones profit icon
	Pointificator._gui.statistics.overview.tvProfit.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.tvProfit, CT_TEXTURE);
	Pointificator._gui.statistics.overview.tvProfit.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.overview.tvProfit.icon:SetAnchor(LEFT, Pointificator._gui.statistics.overview.tvProfit, LEFT, 0, 0);
	Pointificator._gui.statistics.overview.tvProfit.icon:SetTexture("Pointificator/media/tel_var.dds");
	
	-- tel var stones profit label
	Pointificator._gui.statistics.overview.tvProfit.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.tvProfit, CT_LABEL);
	Pointificator._gui.statistics.overview.tvProfit.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.overview.tvProfit.label:SetAnchor(LEFT, Pointificator._gui.statistics.overview.tvProfit, LEFT, 20, 0);
	Pointificator._gui.statistics.overview.tvProfit.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.overview.tvProfit.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.overview.tvProfit.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.overview.tvProfit.label:SetText("Tel Var profit:");
	
	-- tel var stones profit value
	Pointificator._gui.statistics.overview.tvProfit.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.overview.tvProfit, CT_LABEL);
	Pointificator._gui.statistics.overview.tvProfit.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.overview.tvProfit.value:SetAnchor(LEFT, Pointificator._gui.statistics.overview.tvProfit, LEFT, 275, 0);
	Pointificator._gui.statistics.overview.tvProfit.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.overview.tvProfit.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.overview.tvProfit.value:SetFont(Pointificator._fontMedium);
end