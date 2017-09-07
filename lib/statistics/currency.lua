-------------------------------------------------------------------------------------------------
-- Builds the currency page --
-------------------------------------------------------------------------------------------------
Pointificator.BuildCurrencyPage = function()

	-- currency container
	Pointificator._gui.statistics.currency = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.pagesContainer, CT_CONTROL);
	Pointificator._gui.statistics.currency:SetDimensions(640, 330);
	Pointificator._gui.statistics.currency:SetAnchor(TOPLEFT, Pointificator._gui.statistics.pagesContainer, TOPLEFT, 25, 0);
	Pointificator._gui.statistics.currency:SetHidden(true);
	
	-- alliance points container
	Pointificator._gui.statistics.currency.alliancePoints = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency, CT_CONTROL);
	Pointificator._gui.statistics.currency.alliancePoints:SetDimensions(540, 50);
	Pointificator._gui.statistics.currency.alliancePoints:SetAnchor(TOPLEFT, Pointificator._gui.statistics.currency, TOPLEFT, 125, 0);
	
	-- alliance points icon
	Pointificator._gui.statistics.currency.alliancePoints.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.alliancePoints, CT_TEXTURE);
	Pointificator._gui.statistics.currency.alliancePoints.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.currency.alliancePoints.icon:SetAnchor(LEFT, Pointificator._gui.statistics.currency.alliancePoints, LEFT, 0, 0);
	Pointificator._gui.statistics.currency.alliancePoints.icon:SetTexture("Pointificator/media/money1.dds");
	
	-- alliance points label
	Pointificator._gui.statistics.currency.alliancePoints.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.alliancePoints, CT_LABEL);
	Pointificator._gui.statistics.currency.alliancePoints.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.alliancePoints.label:SetAnchor(LEFT, Pointificator._gui.statistics.currency.alliancePoints, LEFT, 20, 0);
	Pointificator._gui.statistics.currency.alliancePoints.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.alliancePoints.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.alliancePoints.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.currency.alliancePoints.label:SetText("Alliance points:");
	
	-- alliance points value
	Pointificator._gui.statistics.currency.alliancePoints.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.alliancePoints, CT_LABEL);
	Pointificator._gui.statistics.currency.alliancePoints.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.alliancePoints.value:SetAnchor(LEFT, Pointificator._gui.statistics.currency.alliancePoints, LEFT, 275, 0);
	Pointificator._gui.statistics.currency.alliancePoints.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.alliancePoints.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.alliancePoints.value:SetFont(Pointificator._fontMedium);
	
	-- alliance points per hour container
	Pointificator._gui.statistics.currency.alliancePointsPerHour = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency, CT_CONTROL);
	Pointificator._gui.statistics.currency.alliancePointsPerHour:SetDimensions(540, 50);
	Pointificator._gui.statistics.currency.alliancePointsPerHour:SetAnchor(TOPLEFT, Pointificator._gui.statistics.currency, TOPLEFT, 125, 30);

	-- alliance points per hour icon
	Pointificator._gui.statistics.currency.alliancePointsPerHour.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.alliancePointsPerHour, CT_TEXTURE);
	Pointificator._gui.statistics.currency.alliancePointsPerHour.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.currency.alliancePointsPerHour.icon:SetAnchor(LEFT, Pointificator._gui.statistics.currency.alliancePointsPerHour, LEFT, 0, 0);
	Pointificator._gui.statistics.currency.alliancePointsPerHour.icon:SetTexture("Pointificator/media/moneyexchange.dds");
	
	-- alliance points per hour label
	Pointificator._gui.statistics.currency.alliancePointsPerHour.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.alliancePointsPerHour, CT_LABEL);
	Pointificator._gui.statistics.currency.alliancePointsPerHour.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.alliancePointsPerHour.label:SetAnchor(LEFT, Pointificator._gui.statistics.currency.alliancePointsPerHour, LEFT, 20, 0);
	Pointificator._gui.statistics.currency.alliancePointsPerHour.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.alliancePointsPerHour.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.alliancePointsPerHour.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.currency.alliancePointsPerHour.label:SetText("AP/H:");
	
	-- alliance points per hour value
	Pointificator._gui.statistics.currency.alliancePointsPerHour.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.alliancePointsPerHour, CT_LABEL);
	Pointificator._gui.statistics.currency.alliancePointsPerHour.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.alliancePointsPerHour.value:SetAnchor(LEFT, Pointificator._gui.statistics.currency.alliancePointsPerHour, LEFT, 275, 0);
	Pointificator._gui.statistics.currency.alliancePointsPerHour.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.alliancePointsPerHour.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.alliancePointsPerHour.value:SetFont(Pointificator._fontMedium);
	
	-- largest alliance points difference container
	Pointificator._gui.statistics.currency.largestApDifference = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency, CT_CONTROL);
	Pointificator._gui.statistics.currency.largestApDifference:SetDimensions(600, 50);
	Pointificator._gui.statistics.currency.largestApDifference:SetAnchor(TOPLEFT, Pointificator._gui.statistics.currency, TOPLEFT, 125, 60);
	
	-- largest alliance points difference icon
	Pointificator._gui.statistics.currency.largestApDifference.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.largestApDifference, CT_TEXTURE);
	Pointificator._gui.statistics.currency.largestApDifference.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.currency.largestApDifference.icon:SetAnchor(LEFT, Pointificator._gui.statistics.currency.largestApDifference, LEFT, 0, 0);
	Pointificator._gui.statistics.currency.largestApDifference.icon:SetTexture("Pointificator/media/gain.dds");
	
	-- largest alliance points difference label
	Pointificator._gui.statistics.currency.largestApDifference.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.largestApDifference, CT_LABEL);
	Pointificator._gui.statistics.currency.largestApDifference.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.largestApDifference.label:SetAnchor(LEFT, Pointificator._gui.statistics.currency.largestApDifference, LEFT, 20, 0);
	Pointificator._gui.statistics.currency.largestApDifference.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.largestApDifference.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.largestApDifference.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.currency.largestApDifference.label:SetText("Largest AP gain:");
	
	-- largest alliance points difference value
	Pointificator._gui.statistics.currency.largestApDifference.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.largestApDifference, CT_LABEL);
	Pointificator._gui.statistics.currency.largestApDifference.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.largestApDifference.value:SetAnchor(LEFT, Pointificator._gui.statistics.currency.largestApDifference, LEFT, 275, 0);
	Pointificator._gui.statistics.currency.largestApDifference.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.largestApDifference.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.largestApDifference.value:SetFont(Pointificator._fontMedium);
	
	-- tel var stones profit container
	Pointificator._gui.statistics.currency.telVarStonesProfit = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency, CT_CONTROL);
	Pointificator._gui.statistics.currency.telVarStonesProfit:SetDimensions(540, 50);
	Pointificator._gui.statistics.currency.telVarStonesProfit:SetAnchor(TOPLEFT, Pointificator._gui.statistics.currency, TOPLEFT, 125, 90);
	
	-- tel var stones profit icon
	Pointificator._gui.statistics.currency.telVarStonesProfit.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.telVarStonesProfit, CT_TEXTURE);
	Pointificator._gui.statistics.currency.telVarStonesProfit.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.currency.telVarStonesProfit.icon:SetAnchor(LEFT, Pointificator._gui.statistics.currency.telVarStonesProfit, LEFT, 0, 0);
	Pointificator._gui.statistics.currency.telVarStonesProfit.icon:SetTexture("Pointificator/media/tel_var.dds");
	
	-- tel var stones profit label
	Pointificator._gui.statistics.currency.telVarStonesProfit.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.telVarStonesProfit, CT_LABEL);
	Pointificator._gui.statistics.currency.telVarStonesProfit.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.telVarStonesProfit.label:SetAnchor(LEFT, Pointificator._gui.statistics.currency.telVarStonesProfit, LEFT, 20, 0);
	Pointificator._gui.statistics.currency.telVarStonesProfit.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.telVarStonesProfit.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.telVarStonesProfit.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.currency.telVarStonesProfit.label:SetText("TV stones profit:");
	
	-- tel var stones profit value
	Pointificator._gui.statistics.currency.telVarStonesProfit.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.telVarStonesProfit, CT_LABEL);
	Pointificator._gui.statistics.currency.telVarStonesProfit.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.telVarStonesProfit.value:SetAnchor(LEFT, Pointificator._gui.statistics.currency.telVarStonesProfit, LEFT, 275, 0);
	Pointificator._gui.statistics.currency.telVarStonesProfit.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.telVarStonesProfit.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.telVarStonesProfit.value:SetFont(Pointificator._fontMedium);
	
	-- tel var stones gained container
	Pointificator._gui.statistics.currency.telVarStonesGained = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency, CT_CONTROL);
	Pointificator._gui.statistics.currency.telVarStonesGained:SetDimensions(540, 50);
	Pointificator._gui.statistics.currency.telVarStonesGained:SetAnchor(TOPLEFT, Pointificator._gui.statistics.currency, TOPLEFT, 125, 120);
	
	-- tel var stones gained icon
	Pointificator._gui.statistics.currency.telVarStonesGained.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.telVarStonesGained, CT_TEXTURE);
	Pointificator._gui.statistics.currency.telVarStonesGained.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.currency.telVarStonesGained.icon:SetAnchor(LEFT, Pointificator._gui.statistics.currency.telVarStonesGained, LEFT, 0, 0);
	Pointificator._gui.statistics.currency.telVarStonesGained.icon:SetTexture("Pointificator/media/tel_var.dds");
	
	-- tel var stones gained label
	Pointificator._gui.statistics.currency.telVarStonesGained.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.telVarStonesGained, CT_LABEL);
	Pointificator._gui.statistics.currency.telVarStonesGained.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.telVarStonesGained.label:SetAnchor(LEFT, Pointificator._gui.statistics.currency.telVarStonesGained, LEFT, 20, 0);
	Pointificator._gui.statistics.currency.telVarStonesGained.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.telVarStonesGained.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.telVarStonesGained.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.currency.telVarStonesGained.label:SetText("TV stones gained:");
	
	-- tel var stones gained value
	Pointificator._gui.statistics.currency.telVarStonesGained.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.telVarStonesGained, CT_LABEL);
	Pointificator._gui.statistics.currency.telVarStonesGained.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.telVarStonesGained.value:SetAnchor(LEFT, Pointificator._gui.statistics.currency.telVarStonesGained, LEFT, 275, 0);
	Pointificator._gui.statistics.currency.telVarStonesGained.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.telVarStonesGained.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.telVarStonesGained.value:SetFont(Pointificator._fontMedium);
	
	-- tel var stones lost container
	Pointificator._gui.statistics.currency.telVarStonesLost = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency, CT_CONTROL);
	Pointificator._gui.statistics.currency.telVarStonesLost:SetDimensions(540, 50);
	Pointificator._gui.statistics.currency.telVarStonesLost:SetAnchor(TOPLEFT, Pointificator._gui.statistics.currency, TOPLEFT, 125, 150);
	
	-- tel var stones lost icon
	Pointificator._gui.statistics.currency.telVarStonesLost.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.telVarStonesLost, CT_TEXTURE);
	Pointificator._gui.statistics.currency.telVarStonesLost.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.currency.telVarStonesLost.icon:SetAnchor(LEFT, Pointificator._gui.statistics.currency.telVarStonesLost, LEFT, 0, 0);
	Pointificator._gui.statistics.currency.telVarStonesLost.icon:SetTexture("Pointificator/media/tel_var.dds");
	
	-- tel var stones lost label
	Pointificator._gui.statistics.currency.telVarStonesLost.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.telVarStonesLost, CT_LABEL);
	Pointificator._gui.statistics.currency.telVarStonesLost.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.telVarStonesLost.label:SetAnchor(LEFT, Pointificator._gui.statistics.currency.telVarStonesLost, LEFT, 20, 0);
	Pointificator._gui.statistics.currency.telVarStonesLost.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.telVarStonesLost.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.telVarStonesLost.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.currency.telVarStonesLost.label:SetText("TV stones lost:");
	
	-- tel var stones lost value
	Pointificator._gui.statistics.currency.telVarStonesLost.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.telVarStonesLost, CT_LABEL);
	Pointificator._gui.statistics.currency.telVarStonesLost.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.telVarStonesLost.value:SetAnchor(LEFT, Pointificator._gui.statistics.currency.telVarStonesLost, LEFT, 275, 0);
	Pointificator._gui.statistics.currency.telVarStonesLost.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.telVarStonesLost.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.telVarStonesLost.value:SetFont(Pointificator._fontMedium);

	-- tel var stones per hour container
	Pointificator._gui.statistics.currency.telVarStonesPerHour = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency, CT_CONTROL);
	Pointificator._gui.statistics.currency.telVarStonesPerHour:SetDimensions(540, 50);
	Pointificator._gui.statistics.currency.telVarStonesPerHour:SetAnchor(TOPLEFT, Pointificator._gui.statistics.currency, TOPLEFT, 125, 180);
	
	-- tel var stones per hour icon
	Pointificator._gui.statistics.currency.telVarStonesPerHour.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.telVarStonesPerHour, CT_TEXTURE);
	Pointificator._gui.statistics.currency.telVarStonesPerHour.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.currency.telVarStonesPerHour.icon:SetAnchor(LEFT, Pointificator._gui.statistics.currency.telVarStonesPerHour, LEFT, 0, 0);
	Pointificator._gui.statistics.currency.telVarStonesPerHour.icon:SetTexture("Pointificator/media/tel_var.dds");
	
	-- tel var stones per hour label
	Pointificator._gui.statistics.currency.telVarStonesPerHour.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.telVarStonesPerHour, CT_LABEL);
	Pointificator._gui.statistics.currency.telVarStonesPerHour.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.telVarStonesPerHour.label:SetAnchor(LEFT, Pointificator._gui.statistics.currency.telVarStonesPerHour, LEFT, 20, 0);
	Pointificator._gui.statistics.currency.telVarStonesPerHour.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.telVarStonesPerHour.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.telVarStonesPerHour.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.currency.telVarStonesPerHour.label:SetText("TV/H:");
	
	-- tel var stones per hour value
	Pointificator._gui.statistics.currency.telVarStonesPerHour.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.telVarStonesPerHour, CT_LABEL);
	Pointificator._gui.statistics.currency.telVarStonesPerHour.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.telVarStonesPerHour.value:SetAnchor(LEFT, Pointificator._gui.statistics.currency.telVarStonesPerHour, LEFT, 275, 0);
	Pointificator._gui.statistics.currency.telVarStonesPerHour.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.telVarStonesPerHour.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.telVarStonesPerHour.value:SetFont(Pointificator._fontMedium);
	
	-- largest tel var stones gain container
	Pointificator._gui.statistics.currency.largestTelVarStoneGain = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency, CT_CONTROL);
	Pointificator._gui.statistics.currency.largestTelVarStoneGain:SetDimensions(540, 50);
	Pointificator._gui.statistics.currency.largestTelVarStoneGain:SetAnchor(TOPLEFT, Pointificator._gui.statistics.currency, TOPLEFT, 125, 210);
	
	-- largest tel var stones gain icon
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.largestTelVarStoneGain, CT_TEXTURE);
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.icon:SetAnchor(LEFT, Pointificator._gui.statistics.currency.largestTelVarStoneGain, LEFT, 0, 0);
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.icon:SetTexture("Pointificator/media/tel_var.dds");
	
	-- largest tel var stones gain label
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.largestTelVarStoneGain, CT_LABEL);
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.label:SetAnchor(LEFT, Pointificator._gui.statistics.currency.largestTelVarStoneGain, LEFT, 20, 0);
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.label:SetText("Largest TV gain:");
	
	-- largest tel var stones gain value
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.largestTelVarStoneGain, CT_LABEL);
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.value:SetAnchor(LEFT, Pointificator._gui.statistics.currency.largestTelVarStoneGain, LEFT, 275, 0);
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.largestTelVarStoneGain.value:SetFont(Pointificator._fontMedium);
	
	-- largest tel var stones loss container
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency, CT_CONTROL);
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss:SetDimensions(540, 50);
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss:SetAnchor(TOPLEFT, Pointificator._gui.statistics.currency, TOPLEFT, 125, 240);
	
	-- largest tel var stones loss icon
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.largestTelVarStoneLoss, CT_TEXTURE);
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.icon:SetAnchor(LEFT, Pointificator._gui.statistics.currency.largestTelVarStoneLoss, LEFT, 0, 0);
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.icon:SetTexture("Pointificator/media/tel_var.dds");
	
	-- largest tel var stones loss label
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.largestTelVarStoneLoss, CT_LABEL);
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.label:SetAnchor(LEFT, Pointificator._gui.statistics.currency.largestTelVarStoneLoss, LEFT, 20, 0);
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.label:SetText("Largest TV loss:");
	
	-- largest tel var stones loss value
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.currency.largestTelVarStoneLoss, CT_LABEL);
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.value:SetAnchor(LEFT, Pointificator._gui.statistics.currency.largestTelVarStoneLoss, LEFT, 275, 0);
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.currency.largestTelVarStoneLoss.value:SetFont(Pointificator._fontMedium);
end