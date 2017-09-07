-------------------------------------------------------------------------------------------------
-- Builds the lifetime page --
-------------------------------------------------------------------------------------------------
Pointificator.BuildLifetimePage = function()

	-- lifetime container
	Pointificator._gui.statistics.lifetime = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.pagesContainer, CT_CONTROL);
	Pointificator._gui.statistics.lifetime:SetDimensions(640, 330);
	Pointificator._gui.statistics.lifetime:SetAnchor(TOPLEFT, Pointificator._gui.statistics.pagesContainer, TOPLEFT, 25, 0);
	Pointificator._gui.statistics.lifetime:SetHidden(true);
	
	-- killing blows container
	Pointificator._gui.statistics.lifetime.totalKillingBlows = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime, CT_CONTROL);
	Pointificator._gui.statistics.lifetime.totalKillingBlows:SetDimensions(540, 50);
	Pointificator._gui.statistics.lifetime.totalKillingBlows:SetAnchor(TOPLEFT, Pointificator._gui.statistics.lifetime, TOPLEFT, 125, 0);
	
	-- killing blows icon
	Pointificator._gui.statistics.lifetime.totalKillingBlows.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.totalKillingBlows, CT_TEXTURE);
	Pointificator._gui.statistics.lifetime.totalKillingBlows.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.lifetime.totalKillingBlows.icon:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.totalKillingBlows, LEFT, 0, 0);
	Pointificator._gui.statistics.lifetime.totalKillingBlows.icon:SetTexture("Pointificator/media/swords.dds");
	
	-- killing blows label
	Pointificator._gui.statistics.lifetime.totalKillingBlows.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.totalKillingBlows, CT_LABEL);
	Pointificator._gui.statistics.lifetime.totalKillingBlows.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.totalKillingBlows.label:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.totalKillingBlows, LEFT, 20, 0);
	Pointificator._gui.statistics.lifetime.totalKillingBlows.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.totalKillingBlows.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.totalKillingBlows.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.lifetime.totalKillingBlows.label:SetText("Killing blows:");
	
	-- killing blows value
	Pointificator._gui.statistics.lifetime.totalKillingBlows.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.totalKillingBlows, CT_LABEL);
	Pointificator._gui.statistics.lifetime.totalKillingBlows.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.totalKillingBlows.value:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.totalKillingBlows, LEFT, 275, 0);
	Pointificator._gui.statistics.lifetime.totalKillingBlows.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.totalKillingBlows.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.totalKillingBlows.value:SetFont(Pointificator._fontMedium);
	
	-- deaths container
	Pointificator._gui.statistics.lifetime.totalDeaths = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime, CT_CONTROL);
	Pointificator._gui.statistics.lifetime.totalDeaths:SetDimensions(540, 50);
	Pointificator._gui.statistics.lifetime.totalDeaths:SetAnchor(TOPLEFT, Pointificator._gui.statistics.lifetime, TOPLEFT, 125, 30);
	
	-- deaths icon
	Pointificator._gui.statistics.lifetime.totalDeaths.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.totalDeaths, CT_TEXTURE);
	Pointificator._gui.statistics.lifetime.totalDeaths.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.lifetime.totalDeaths.icon:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.totalDeaths, LEFT, 0, 0);
	Pointificator._gui.statistics.lifetime.totalDeaths.icon:SetTexture("Pointificator/media/skull.dds");
	
	-- deaths label
	Pointificator._gui.statistics.lifetime.totalDeaths.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.totalDeaths, CT_LABEL);
	Pointificator._gui.statistics.lifetime.totalDeaths.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.totalDeaths.label:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.totalDeaths, LEFT, 20, 0);
	Pointificator._gui.statistics.lifetime.totalDeaths.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.totalDeaths.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.totalDeaths.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.lifetime.totalDeaths.label:SetText("Deaths:");
	
	-- deaths value
	Pointificator._gui.statistics.lifetime.totalDeaths.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.totalDeaths, CT_LABEL);
	Pointificator._gui.statistics.lifetime.totalDeaths.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.totalDeaths.value:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.totalDeaths, LEFT, 275, 0);
	Pointificator._gui.statistics.lifetime.totalDeaths.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.totalDeaths.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.totalDeaths.value:SetFont(Pointificator._fontMedium);
	
	-- ratio container
	Pointificator._gui.statistics.lifetime.ratio = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime, CT_CONTROL);
	Pointificator._gui.statistics.lifetime.ratio:SetDimensions(540, 50);
	Pointificator._gui.statistics.lifetime.ratio:SetAnchor(TOPLEFT, Pointificator._gui.statistics.lifetime, TOPLEFT, 125, 60);
	
	-- ratio icon
	Pointificator._gui.statistics.lifetime.ratio.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.ratio, CT_TEXTURE);
	Pointificator._gui.statistics.lifetime.ratio.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.lifetime.ratio.icon:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.ratio, LEFT, 0, 0);
	Pointificator._gui.statistics.lifetime.ratio.icon:SetTexture("Pointificator/media/pulse1.dds");
	
	-- ratio label
	Pointificator._gui.statistics.lifetime.ratio.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.ratio, CT_LABEL);
	Pointificator._gui.statistics.lifetime.ratio.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.ratio.label:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.ratio, LEFT, 20, 0);
	Pointificator._gui.statistics.lifetime.ratio.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.ratio.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.ratio.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.lifetime.ratio.label:SetText("K/D:");
	
	-- ratio value
	Pointificator._gui.statistics.lifetime.ratio.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.ratio, CT_LABEL);
	Pointificator._gui.statistics.lifetime.ratio.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.ratio.value:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.ratio, LEFT, 275, 0);
	Pointificator._gui.statistics.lifetime.ratio.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.ratio.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.ratio.value:SetFont(Pointificator._fontMedium);
	
	-- avenges container
	Pointificator._gui.statistics.lifetime.totalAvenges = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime, CT_CONTROL);
	Pointificator._gui.statistics.lifetime.totalAvenges:SetDimensions(540, 50);
	Pointificator._gui.statistics.lifetime.totalAvenges:SetAnchor(TOPLEFT, Pointificator._gui.statistics.lifetime, TOPLEFT, 125, 90);
	
	-- avenges icon
	Pointificator._gui.statistics.lifetime.totalAvenges.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.totalAvenges, CT_TEXTURE);
	Pointificator._gui.statistics.lifetime.totalAvenges.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.lifetime.totalAvenges.icon:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.totalAvenges, LEFT, 0, 0);
	Pointificator._gui.statistics.lifetime.totalAvenges.icon:SetTexture("Pointificator/media/avenger.dds");
	
	-- avenges label
	Pointificator._gui.statistics.lifetime.totalAvenges.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.totalAvenges, CT_LABEL);
	Pointificator._gui.statistics.lifetime.totalAvenges.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.totalAvenges.label:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.totalAvenges, LEFT, 20, 0);
	Pointificator._gui.statistics.lifetime.totalAvenges.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.totalAvenges.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.totalAvenges.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.lifetime.totalAvenges.label:SetText("Avenges:");
	
	-- avenges value
	Pointificator._gui.statistics.lifetime.totalAvenges.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.totalAvenges, CT_LABEL);
	Pointificator._gui.statistics.lifetime.totalAvenges.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.totalAvenges.value:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.totalAvenges, LEFT, 275, 0);
	Pointificator._gui.statistics.lifetime.totalAvenges.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.totalAvenges.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.totalAvenges.value:SetFont(Pointificator._fontMedium);
	
	-- revenges container
	Pointificator._gui.statistics.lifetime.totalRevenges = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime, CT_CONTROL);
	Pointificator._gui.statistics.lifetime.totalRevenges:SetDimensions(540, 50);
	Pointificator._gui.statistics.lifetime.totalRevenges:SetAnchor(TOPLEFT, Pointificator._gui.statistics.lifetime, TOPLEFT, 125, 120);
	
	-- revenges icon
	Pointificator._gui.statistics.lifetime.totalRevenges.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.totalRevenges, CT_TEXTURE);
	Pointificator._gui.statistics.lifetime.totalRevenges.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.lifetime.totalRevenges.icon:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.totalRevenges, LEFT, 0, 0);
	Pointificator._gui.statistics.lifetime.totalRevenges.icon:SetTexture("Pointificator/media/fist.dds");
	
	-- revenges label
	Pointificator._gui.statistics.lifetime.totalRevenges.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.totalRevenges, CT_LABEL);
	Pointificator._gui.statistics.lifetime.totalRevenges.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.totalRevenges.label:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.totalRevenges, LEFT, 20, 0);
	Pointificator._gui.statistics.lifetime.totalRevenges.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.totalRevenges.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.totalRevenges.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.lifetime.totalRevenges.label:SetText("Revenges:");
	
	-- revenges value
	Pointificator._gui.statistics.lifetime.totalRevenges.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.totalRevenges, CT_LABEL);
	Pointificator._gui.statistics.lifetime.totalRevenges.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.totalRevenges.value:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.totalRevenges, LEFT, 275, 0);
	Pointificator._gui.statistics.lifetime.totalRevenges.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.totalRevenges.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.totalRevenges.value:SetFont(Pointificator._fontMedium);
	
	-- killing streak container
	Pointificator._gui.statistics.lifetime.bestKillingStreak = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime, CT_CONTROL);
	Pointificator._gui.statistics.lifetime.bestKillingStreak:SetDimensions(540, 50);
	Pointificator._gui.statistics.lifetime.bestKillingStreak:SetAnchor(TOPLEFT, Pointificator._gui.statistics.lifetime, TOPLEFT, 125, 150);
	
	-- killing streak icon
	Pointificator._gui.statistics.lifetime.bestKillingStreak.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.bestKillingStreak, CT_TEXTURE);
	Pointificator._gui.statistics.lifetime.bestKillingStreak.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.lifetime.bestKillingStreak.icon:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.bestKillingStreak, LEFT, 0, 0);
	Pointificator._gui.statistics.lifetime.bestKillingStreak.icon:SetTexture("Pointificator/media/lightning.dds");
	
	-- killing streak label
	Pointificator._gui.statistics.lifetime.bestKillingStreak.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.bestKillingStreak, CT_LABEL);
	Pointificator._gui.statistics.lifetime.bestKillingStreak.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.bestKillingStreak.label:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.bestKillingStreak, LEFT, 20, 0);
	Pointificator._gui.statistics.lifetime.bestKillingStreak.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.bestKillingStreak.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.bestKillingStreak.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.lifetime.bestKillingStreak.label:SetText("Best killing streak:");
	
	-- killing streak value
	Pointificator._gui.statistics.lifetime.bestKillingStreak.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.bestKillingStreak, CT_LABEL);
	Pointificator._gui.statistics.lifetime.bestKillingStreak.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.bestKillingStreak.value:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.bestKillingStreak, LEFT, 275, 0);
	Pointificator._gui.statistics.lifetime.bestKillingStreak.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.bestKillingStreak.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.bestKillingStreak.value:SetFont(Pointificator._fontMedium);
	
	-- largest ap difference container
	Pointificator._gui.statistics.lifetime.largestApDifference = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime, CT_CONTROL);
	Pointificator._gui.statistics.lifetime.largestApDifference:SetDimensions(540, 50);
	Pointificator._gui.statistics.lifetime.largestApDifference:SetAnchor(TOPLEFT, Pointificator._gui.statistics.lifetime, TOPLEFT, 125, 180);
	
	-- largest ap difference icon
	Pointificator._gui.statistics.lifetime.largestApDifference.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.largestApDifference, CT_TEXTURE);
	Pointificator._gui.statistics.lifetime.largestApDifference.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.lifetime.largestApDifference.icon:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.largestApDifference, LEFT, 0, 0);
	Pointificator._gui.statistics.lifetime.largestApDifference.icon:SetTexture("Pointificator/media/gain.dds");
	
	-- largest ap difference label
	Pointificator._gui.statistics.lifetime.largestApDifference.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.largestApDifference, CT_LABEL);
	Pointificator._gui.statistics.lifetime.largestApDifference.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.largestApDifference.label:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.largestApDifference, LEFT, 20, 0);
	Pointificator._gui.statistics.lifetime.largestApDifference.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.largestApDifference.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.largestApDifference.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.lifetime.largestApDifference.label:SetText("Largest AP gain:");
	
	-- largest ap difference value
	Pointificator._gui.statistics.lifetime.largestApDifference.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.largestApDifference, CT_LABEL);
	Pointificator._gui.statistics.lifetime.largestApDifference.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.largestApDifference.value:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.largestApDifference, LEFT, 275, 0);
	Pointificator._gui.statistics.lifetime.largestApDifference.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.largestApDifference.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.largestApDifference.value:SetFont(Pointificator._fontMedium);
	
	-- largest tv gain container
	Pointificator._gui.statistics.lifetime.largestTvGain = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime, CT_CONTROL);
	Pointificator._gui.statistics.lifetime.largestTvGain:SetDimensions(540, 50);
	Pointificator._gui.statistics.lifetime.largestTvGain:SetAnchor(TOPLEFT, Pointificator._gui.statistics.lifetime, TOPLEFT, 125, 210);
	
	-- largest tv gain icon
	Pointificator._gui.statistics.lifetime.largestTvGain.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.largestTvGain, CT_TEXTURE);
	Pointificator._gui.statistics.lifetime.largestTvGain.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.lifetime.largestTvGain.icon:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.largestTvGain, LEFT, 0, 0);
	Pointificator._gui.statistics.lifetime.largestTvGain.icon:SetTexture("Pointificator/media/tel_var.dds");
	
	-- largest tv gain label
	Pointificator._gui.statistics.lifetime.largestTvGain.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.largestTvGain, CT_LABEL);
	Pointificator._gui.statistics.lifetime.largestTvGain.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.largestTvGain.label:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.largestTvGain, LEFT, 20, 0);
	Pointificator._gui.statistics.lifetime.largestTvGain.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.largestTvGain.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.largestTvGain.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.lifetime.largestTvGain.label:SetText("Largest TV gain:");
	
	-- largest tv gain value
	Pointificator._gui.statistics.lifetime.largestTvGain.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.largestTvGain, CT_LABEL);
	Pointificator._gui.statistics.lifetime.largestTvGain.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.largestTvGain.value:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.largestTvGain, LEFT, 275, 0);
	Pointificator._gui.statistics.lifetime.largestTvGain.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.largestTvGain.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.largestTvGain.value:SetFont(Pointificator._fontMedium);
	
	-- largest tv loss container
	Pointificator._gui.statistics.lifetime.largestTvLoss = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime, CT_CONTROL);
	Pointificator._gui.statistics.lifetime.largestTvLoss:SetDimensions(540, 50);
	Pointificator._gui.statistics.lifetime.largestTvLoss:SetAnchor(TOPLEFT, Pointificator._gui.statistics.lifetime, TOPLEFT, 125, 240);
	
	-- largest tv loss icon
	Pointificator._gui.statistics.lifetime.largestTvLoss.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.largestTvLoss, CT_TEXTURE);
	Pointificator._gui.statistics.lifetime.largestTvLoss.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.lifetime.largestTvLoss.icon:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.largestTvLoss, LEFT, 0, 0);
	Pointificator._gui.statistics.lifetime.largestTvLoss.icon:SetTexture("Pointificator/media/tel_var.dds");
	
	-- largest tv loss label
	Pointificator._gui.statistics.lifetime.largestTvLoss.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.largestTvLoss, CT_LABEL);
	Pointificator._gui.statistics.lifetime.largestTvLoss.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.largestTvLoss.label:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.largestTvLoss, LEFT, 20, 0);
	Pointificator._gui.statistics.lifetime.largestTvLoss.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.largestTvLoss.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.largestTvLoss.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.lifetime.largestTvLoss.label:SetText("Largest TV loss:");
	
	-- largest tv loss value
	Pointificator._gui.statistics.lifetime.largestTvLoss.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.lifetime.largestTvLoss, CT_LABEL);
	Pointificator._gui.statistics.lifetime.largestTvLoss.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.lifetime.largestTvLoss.value:SetAnchor(LEFT, Pointificator._gui.statistics.lifetime.largestTvLoss, LEFT, 275, 0);
	Pointificator._gui.statistics.lifetime.largestTvLoss.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.lifetime.largestTvLoss.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.lifetime.largestTvLoss.value:SetFont(Pointificator._fontMedium);
end