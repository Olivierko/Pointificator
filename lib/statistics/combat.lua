-------------------------------------------------------------------------------------------------
-- Builds the combat page --
-------------------------------------------------------------------------------------------------
Pointificator.BuildCombatPage = function()

	-- combat container
	Pointificator._gui.statistics.combat = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.pagesContainer, CT_CONTROL);
	Pointificator._gui.statistics.combat:SetDimensions(640, 330);
	Pointificator._gui.statistics.combat:SetAnchor(TOPLEFT, Pointificator._gui.statistics.pagesContainer, TOPLEFT, 25, 0);
	Pointificator._gui.statistics.combat:SetHidden(true);
	
	-- killing blows container
	Pointificator._gui.statistics.combat.killingBlows = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat, CT_CONTROL);
	Pointificator._gui.statistics.combat.killingBlows:SetDimensions(540, 50);
	Pointificator._gui.statistics.combat.killingBlows:SetAnchor(TOPLEFT, Pointificator._gui.statistics.combat, TOPLEFT, 125, 0);
	
	-- killing blows icon
	Pointificator._gui.statistics.combat.killingBlows.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.killingBlows, CT_TEXTURE);
	Pointificator._gui.statistics.combat.killingBlows.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.combat.killingBlows.icon:SetAnchor(LEFT, Pointificator._gui.statistics.combat.killingBlows, LEFT, 0, 0);
	Pointificator._gui.statistics.combat.killingBlows.icon:SetTexture("Pointificator/media/swords.dds");
	
	-- killing blows label
	Pointificator._gui.statistics.combat.killingBlows.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.killingBlows, CT_LABEL);
	Pointificator._gui.statistics.combat.killingBlows.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.killingBlows.label:SetAnchor(LEFT, Pointificator._gui.statistics.combat.killingBlows, LEFT, 20, 0);
	Pointificator._gui.statistics.combat.killingBlows.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.killingBlows.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.killingBlows.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.combat.killingBlows.label:SetText("Killing blows:");
	
	-- killing blows value
	Pointificator._gui.statistics.combat.killingBlows.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.killingBlows, CT_LABEL);
	Pointificator._gui.statistics.combat.killingBlows.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.killingBlows.value:SetAnchor(LEFT, Pointificator._gui.statistics.combat.killingBlows, LEFT, 275, 0);
	Pointificator._gui.statistics.combat.killingBlows.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.killingBlows.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.killingBlows.value:SetFont(Pointificator._fontMedium);
	
	-- deaths container
	Pointificator._gui.statistics.combat.deaths = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat, CT_CONTROL);
	Pointificator._gui.statistics.combat.deaths:SetDimensions(540, 50);
	Pointificator._gui.statistics.combat.deaths:SetAnchor(TOPLEFT, Pointificator._gui.statistics.combat, TOPLEFT, 125, 30);

	-- deaths icon
	Pointificator._gui.statistics.combat.deaths.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.deaths, CT_TEXTURE);
	Pointificator._gui.statistics.combat.deaths.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.combat.deaths.icon:SetAnchor(LEFT, Pointificator._gui.statistics.combat.deaths, LEFT, 0, 0);
	Pointificator._gui.statistics.combat.deaths.icon:SetTexture("Pointificator/media/skull.dds");
	
	-- deaths label
	Pointificator._gui.statistics.combat.deaths.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.deaths, CT_LABEL);
	Pointificator._gui.statistics.combat.deaths.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.deaths.label:SetAnchor(LEFT, Pointificator._gui.statistics.combat.deaths, LEFT, 20, 0);
	Pointificator._gui.statistics.combat.deaths.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.deaths.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.deaths.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.combat.deaths.label:SetText("Deaths:");
	
	-- deaths value
	Pointificator._gui.statistics.combat.deaths.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.deaths, CT_LABEL);
	Pointificator._gui.statistics.combat.deaths.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.deaths.value:SetAnchor(LEFT, Pointificator._gui.statistics.combat.deaths, LEFT, 275, 0);
	Pointificator._gui.statistics.combat.deaths.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.deaths.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.deaths.value:SetFont(Pointificator._fontMedium);
	
	-- deaths by pvp container
	Pointificator._gui.statistics.combat.deathsByPvP = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat, CT_CONTROL);
	Pointificator._gui.statistics.combat.deathsByPvP:SetDimensions(540, 50);
	Pointificator._gui.statistics.combat.deathsByPvP:SetAnchor(TOPLEFT, Pointificator._gui.statistics.combat, TOPLEFT, 125, 60);
	
	-- deaths by pvp label
	Pointificator._gui.statistics.combat.deathsByPvP.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.deathsByPvP, CT_LABEL);
	Pointificator._gui.statistics.combat.deathsByPvP.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.deathsByPvP.label:SetAnchor(LEFT, Pointificator._gui.statistics.combat.deathsByPvP, LEFT, 20, 0);
	Pointificator._gui.statistics.combat.deathsByPvP.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.deathsByPvP.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.deathsByPvP.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.combat.deathsByPvP.label:SetText("- Deaths by PvP:");
	
	-- deaths by pvp value
	Pointificator._gui.statistics.combat.deathsByPvP.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.deathsByPvP, CT_LABEL);
	Pointificator._gui.statistics.combat.deathsByPvP.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.deathsByPvP.value:SetAnchor(LEFT, Pointificator._gui.statistics.combat.deathsByPvP, LEFT, 275, 0);
	Pointificator._gui.statistics.combat.deathsByPvP.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.deathsByPvP.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.deathsByPvP.value:SetFont(Pointificator._fontMedium);
	
	-- deaths by pve container
	Pointificator._gui.statistics.combat.deathsByPvE = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat, CT_CONTROL);
	Pointificator._gui.statistics.combat.deathsByPvE:SetDimensions(540, 50);
	Pointificator._gui.statistics.combat.deathsByPvE:SetAnchor(TOPLEFT, Pointificator._gui.statistics.combat, TOPLEFT, 125, 90);
	
	-- deaths by pve label
	Pointificator._gui.statistics.combat.deathsByPvE.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.deathsByPvE, CT_LABEL);
	Pointificator._gui.statistics.combat.deathsByPvE.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.deathsByPvE.label:SetAnchor(LEFT, Pointificator._gui.statistics.combat.deathsByPvE, LEFT, 20, 0);
	Pointificator._gui.statistics.combat.deathsByPvE.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.deathsByPvE.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.deathsByPvE.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.combat.deathsByPvE.label:SetText("- Deaths by PvE:");
	
	-- deaths by pve value
	Pointificator._gui.statistics.combat.deathsByPvE.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.deathsByPvE, CT_LABEL);
	Pointificator._gui.statistics.combat.deathsByPvE.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.deathsByPvE.value:SetAnchor(LEFT, Pointificator._gui.statistics.combat.deathsByPvE, LEFT, 275, 0);
	Pointificator._gui.statistics.combat.deathsByPvE.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.deathsByPvE.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.deathsByPvE.value:SetFont(Pointificator._fontMedium);
	
	-- deaths by suicide container
	Pointificator._gui.statistics.combat.deathsBySuicide = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat, CT_CONTROL);
	Pointificator._gui.statistics.combat.deathsBySuicide:SetDimensions(540, 50);
	Pointificator._gui.statistics.combat.deathsBySuicide:SetAnchor(TOPLEFT, Pointificator._gui.statistics.combat, TOPLEFT, 125, 120);
	
	-- deaths by suicide label
	Pointificator._gui.statistics.combat.deathsBySuicide.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.deathsBySuicide, CT_LABEL);
	Pointificator._gui.statistics.combat.deathsBySuicide.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.deathsBySuicide.label:SetAnchor(LEFT, Pointificator._gui.statistics.combat.deathsBySuicide, LEFT, 20, 0);
	Pointificator._gui.statistics.combat.deathsBySuicide.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.deathsBySuicide.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.deathsBySuicide.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.combat.deathsBySuicide.label:SetText("- Deaths by suicide:");
	
	-- deaths by suicide value
	Pointificator._gui.statistics.combat.deathsBySuicide.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.deathsBySuicide, CT_LABEL);
	Pointificator._gui.statistics.combat.deathsBySuicide.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.deathsBySuicide.value:SetAnchor(LEFT, Pointificator._gui.statistics.combat.deathsBySuicide, LEFT, 275, 0);
	Pointificator._gui.statistics.combat.deathsBySuicide.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.deathsBySuicide.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.deathsBySuicide.value:SetFont(Pointificator._fontMedium);
	
	-- ratio container
	Pointificator._gui.statistics.combat.ratio = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat, CT_CONTROL);
	Pointificator._gui.statistics.combat.ratio:SetDimensions(540, 50);
	Pointificator._gui.statistics.combat.ratio:SetAnchor(TOPLEFT, Pointificator._gui.statistics.combat, TOPLEFT, 125, 150);
	
	-- ratio icon
	Pointificator._gui.statistics.combat.ratio.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.ratio, CT_TEXTURE);
	Pointificator._gui.statistics.combat.ratio.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.combat.ratio.icon:SetAnchor(LEFT, Pointificator._gui.statistics.combat.ratio, LEFT, 0, 0);
	Pointificator._gui.statistics.combat.ratio.icon:SetTexture("Pointificator/media/pulse1.dds");	

	-- ratio label
	Pointificator._gui.statistics.combat.ratio.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.ratio, CT_LABEL);
	Pointificator._gui.statistics.combat.ratio.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.ratio.label:SetAnchor(LEFT, Pointificator._gui.statistics.combat.ratio, LEFT, 20, 0);
	Pointificator._gui.statistics.combat.ratio.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.ratio.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.ratio.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.combat.ratio.label:SetText("K/D:");
	
	-- ratio value
	Pointificator._gui.statistics.combat.ratio.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.ratio, CT_LABEL);
	Pointificator._gui.statistics.combat.ratio.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.ratio.value:SetAnchor(LEFT, Pointificator._gui.statistics.combat.ratio, LEFT, 275, 0);
	Pointificator._gui.statistics.combat.ratio.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.ratio.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.ratio.value:SetFont(Pointificator._fontMedium);
	
	-- avenges container
	Pointificator._gui.statistics.combat.avenges = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat, CT_CONTROL);
	Pointificator._gui.statistics.combat.avenges:SetDimensions(540, 50);
	Pointificator._gui.statistics.combat.avenges:SetAnchor(TOPLEFT, Pointificator._gui.statistics.combat, TOPLEFT, 125, 180);
	
	-- avenges icon
	Pointificator._gui.statistics.combat.avenges.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.avenges, CT_TEXTURE);
	Pointificator._gui.statistics.combat.avenges.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.combat.avenges.icon:SetAnchor(LEFT, Pointificator._gui.statistics.combat.avenges, LEFT, 0, 0);
	Pointificator._gui.statistics.combat.avenges.icon:SetTexture("Pointificator/media/avenger.dds");
	
	-- avenges label
	Pointificator._gui.statistics.combat.avenges.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.avenges, CT_LABEL);
	Pointificator._gui.statistics.combat.avenges.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.avenges.label:SetAnchor(LEFT, Pointificator._gui.statistics.combat.avenges, LEFT, 20, 0);
	Pointificator._gui.statistics.combat.avenges.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.avenges.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.avenges.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.combat.avenges.label:SetText("Avenges:");
	
	-- avenges value
	Pointificator._gui.statistics.combat.avenges.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.avenges, CT_LABEL);
	Pointificator._gui.statistics.combat.avenges.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.avenges.value:SetAnchor(LEFT, Pointificator._gui.statistics.combat.avenges, LEFT, 275, 0);
	Pointificator._gui.statistics.combat.avenges.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.avenges.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.avenges.value:SetFont(Pointificator._fontMedium);
	
	-- revenges container
	Pointificator._gui.statistics.combat.revenges = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat, CT_CONTROL);
	Pointificator._gui.statistics.combat.revenges:SetDimensions(540, 50);
	Pointificator._gui.statistics.combat.revenges:SetAnchor(TOPLEFT, Pointificator._gui.statistics.combat, TOPLEFT, 125, 210);
	
	-- revenges icon
	Pointificator._gui.statistics.combat.revenges.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.revenges, CT_TEXTURE);
	Pointificator._gui.statistics.combat.revenges.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.combat.revenges.icon:SetAnchor(LEFT, Pointificator._gui.statistics.combat.revenges, LEFT, 0, 0);
	Pointificator._gui.statistics.combat.revenges.icon:SetTexture("Pointificator/media/fist.dds");
	
	-- revenges label
	Pointificator._gui.statistics.combat.revenges.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.revenges, CT_LABEL);
	Pointificator._gui.statistics.combat.revenges.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.revenges.label:SetAnchor(LEFT, Pointificator._gui.statistics.combat.revenges, LEFT, 20, 0);
	Pointificator._gui.statistics.combat.revenges.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.revenges.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.revenges.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.combat.revenges.label:SetText("Revenges:");
	
	-- revenges value
	Pointificator._gui.statistics.combat.revenges.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.revenges, CT_LABEL);
	Pointificator._gui.statistics.combat.revenges.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.revenges.value:SetAnchor(LEFT, Pointificator._gui.statistics.combat.revenges, LEFT, 275, 0);
	Pointificator._gui.statistics.combat.revenges.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.revenges.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.revenges.value:SetFont(Pointificator._fontMedium);
	
	-- killing streak container
	Pointificator._gui.statistics.combat.killingStreak = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat, CT_CONTROL);
	Pointificator._gui.statistics.combat.killingStreak:SetDimensions(540, 50);
	Pointificator._gui.statistics.combat.killingStreak:SetAnchor(TOPLEFT, Pointificator._gui.statistics.combat, TOPLEFT, 125, 240);
	
	-- killing streak icon
	Pointificator._gui.statistics.combat.killingStreak.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.killingStreak, CT_TEXTURE);
	Pointificator._gui.statistics.combat.killingStreak.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.combat.killingStreak.icon:SetAnchor(LEFT, Pointificator._gui.statistics.combat.killingStreak, LEFT, 0, 0);
	Pointificator._gui.statistics.combat.killingStreak.icon:SetTexture("Pointificator/media/lightning.dds");
	
	-- killing streak label
	Pointificator._gui.statistics.combat.killingStreak.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.killingStreak, CT_LABEL);
	Pointificator._gui.statistics.combat.killingStreak.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.killingStreak.label:SetAnchor(LEFT, Pointificator._gui.statistics.combat.killingStreak, LEFT, 20, 0);
	Pointificator._gui.statistics.combat.killingStreak.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.killingStreak.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.killingStreak.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.combat.killingStreak.label:SetText("Killing streak:");
	
	-- killing streak value
	Pointificator._gui.statistics.combat.killingStreak.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.killingStreak, CT_LABEL);
	Pointificator._gui.statistics.combat.killingStreak.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.killingStreak.value:SetAnchor(LEFT, Pointificator._gui.statistics.combat.killingStreak, LEFT, 275, 0);
	Pointificator._gui.statistics.combat.killingStreak.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.killingStreak.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.killingStreak.value:SetFont(Pointificator._fontMedium);
	
	-- best killing streak container
	Pointificator._gui.statistics.combat.bestKillingStreak = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat, CT_CONTROL);
	Pointificator._gui.statistics.combat.bestKillingStreak:SetDimensions(540, 50);
	Pointificator._gui.statistics.combat.bestKillingStreak:SetAnchor(TOPLEFT, Pointificator._gui.statistics.combat, TOPLEFT, 125, 270);
	
	-- best killing streak icon
	Pointificator._gui.statistics.combat.bestKillingStreak.icon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.bestKillingStreak, CT_TEXTURE);
	Pointificator._gui.statistics.combat.bestKillingStreak.icon:SetDimensions(16, 16);
	Pointificator._gui.statistics.combat.bestKillingStreak.icon:SetAnchor(LEFT, Pointificator._gui.statistics.combat.bestKillingStreak, LEFT, 0, 0);
	Pointificator._gui.statistics.combat.bestKillingStreak.icon:SetTexture("Pointificator/media/lightning.dds");
	
	-- best killing streak label
	Pointificator._gui.statistics.combat.bestKillingStreak.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.bestKillingStreak, CT_LABEL);
	Pointificator._gui.statistics.combat.bestKillingStreak.label:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.bestKillingStreak.label:SetAnchor(LEFT, Pointificator._gui.statistics.combat.bestKillingStreak, LEFT, 20, 0);
	Pointificator._gui.statistics.combat.bestKillingStreak.label:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.bestKillingStreak.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.bestKillingStreak.label:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.combat.bestKillingStreak.label:SetText("Best killing streak:");
	
	-- best killing streak value
	Pointificator._gui.statistics.combat.bestKillingStreak.value = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.combat.bestKillingStreak, CT_LABEL);
	Pointificator._gui.statistics.combat.bestKillingStreak.value:SetDimensions(210, 50);
	Pointificator._gui.statistics.combat.bestKillingStreak.value:SetAnchor(LEFT, Pointificator._gui.statistics.combat.bestKillingStreak, LEFT, 275, 0);
	Pointificator._gui.statistics.combat.bestKillingStreak.value:SetHorizontalAlignment(0);
	Pointificator._gui.statistics.combat.bestKillingStreak.value:SetVerticalAlignment(1);
	Pointificator._gui.statistics.combat.bestKillingStreak.value:SetFont(Pointificator._fontMedium);
end