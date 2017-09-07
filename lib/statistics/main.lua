-------------------------------------------------------------------------------------------------
-- Builds the statistics window --
-------------------------------------------------------------------------------------------------
Pointificator.BuildStatistics = function()

	-- statistics
	Pointificator._gui.statistics = Pointificator._wm:CreateTopLevelWindow("PointificatorStatisticsGUI");
	Pointificator._gui.statistics:SetDimensions(720, 500);
	Pointificator._gui.statistics:SetAnchor(CENTER, GuiRoot, CENTER, 0, -100);
	Pointificator._gui.statistics:SetAlpha(1);
	Pointificator._gui.statistics:SetHidden(true);
	
	-- backdrop
	Pointificator._gui.statistics.backdrop = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics, CT_BACKDROP);
	Pointificator._gui.statistics.backdrop:SetAnchorFill(Pointificator._gui.statistics);
	Pointificator._gui.statistics.backdrop:SetCenterColor(0.0, 0.0, 0.0, 0.6);
	Pointificator._gui.statistics.backdrop:SetEdgeColor(0, 0, 0, 0.8);
	Pointificator._gui.statistics.backdrop:SetEdgeTexture(nil, 1, 1, 1.0, 1.0);
	
	-- title container
	Pointificator._gui.statistics.title = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics, CT_CONTROL);
	Pointificator._gui.statistics.title:SetDimensions(720, 100);
	Pointificator._gui.statistics.title:SetAnchor(TOP, Pointificator._gui.statistics, TOP, 0, 0);
	
	-- title label
	Pointificator._gui.statistics.title.label = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.title, CT_LABEL);
	Pointificator._gui.statistics.title.label:SetDimensions(720, 60);
	Pointificator._gui.statistics.title.label:SetAnchor(CENTER, Pointificator._gui.statistics.title, CENTER, 0, 0);
	Pointificator._gui.statistics.title.label:SetHorizontalAlignment(1);
	Pointificator._gui.statistics.title.label:SetVerticalAlignment(1);
	Pointificator._gui.statistics.title.label:SetFont(Pointificator._fontLarge);
	Pointificator._gui.statistics.title.label:SetText("Pointificator");
	
	-- title divider
	Pointificator._gui.statistics.title.divider = Pointificator._wm:CreateControlFromVirtual(nil, Pointificator._gui.statistics.title.label, "ZO_Options_Divider");
	Pointificator._gui.statistics.title.divider:SetWidth(600);
	Pointificator._gui.statistics.title.divider:SetAnchor(CENTER, Pointificator._gui.statistics.title.label, BOTTOM, 0, 0);

	-- session info
	Pointificator._gui.statistics.session = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics, CT_CONTROL);
	Pointificator._gui.statistics.session:SetDimensions(720, 270);
	Pointificator._gui.statistics.session:SetAnchor(TOP, Pointificator._gui.statistics, TOP, 40, 0);

	Pointificator.BuildPager();
	
	Pointificator.BuildPages();
	
	Pointificator.TogglePage(Pointificator._statisticPages.overview.id);
end

Pointificator.BuildPager = function()

	Pointificator._gui.statistics.pager = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics, CT_CONTROL);
	Pointificator._gui.statistics.pager:SetDimensions(720, 100);
	Pointificator._gui.statistics.pager:SetAnchor(BOTTOMLEFT, Pointificator._gui.statistics, BOTTOMLEFT, 70, 50);
	
	-- overview is active by default
	local activePage = Pointificator._statisticPages.overview;
	
	Pointificator._gui.statistics.pageName = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.pager, CT_LABEL);
	Pointificator._gui.statistics.pageName:SetDimensions(200, 30);
	Pointificator._gui.statistics.pageName:SetAnchor(TOPLEFT, Pointificator._gui.statistics.pager, TOPLEFT, 190, 0);
	Pointificator._gui.statistics.pageName:SetFont(Pointificator._fontMedium);
	Pointificator._gui.statistics.pageName:SetHorizontalAlignment(1);
	Pointificator._gui.statistics.pageName:SetText(activePage.name);
	
	Pointificator._gui.statistics.previous = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.pageName, CT_BUTTON);
	Pointificator._gui.statistics.previous:SetAnchor(CENTER, Pointificator._gui.statistics.pageName, CENTER, -110, 0);
	Pointificator._gui.statistics.previous:SetDimensions(32, 32);
	Pointificator._gui.statistics.previous:SetMouseEnabled(true);
	Pointificator._gui.statistics.previous:SetHandler("OnClicked", function(self) 
		Pointificator.TogglePage(Pointificator._state.activeStatisticPage - 1);
	end)
	
	Pointificator._gui.statistics.previousIcon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.previous, CT_TEXTURE);
	Pointificator._gui.statistics.previousIcon:SetDimensions(32, 32);
	Pointificator._gui.statistics.previousIcon:SetAnchor(LEFT, Pointificator._gui.statistics.previous, LEFT, 0, 0);
	Pointificator._gui.statistics.previousIcon:SetTexture("Pointificator/media/left.dds");
	
	Pointificator._gui.statistics.previous:SetHandler("OnMouseEnter",function(self)
		Pointificator._gui.statistics.previousIcon:SetTexture("Pointificator/media/left_3.dds");
	end);
	
	Pointificator._gui.statistics.previous:SetHandler("OnMouseExit",function(self) 
		Pointificator._gui.statistics.previousIcon:SetTexture("Pointificator/media/left.dds");
	end);
	
	Pointificator._gui.statistics.next = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.pageName, CT_BUTTON);
	Pointificator._gui.statistics.next:SetAnchor(CENTER, Pointificator._gui.statistics.pageName, CENTER, 110, 0);
	Pointificator._gui.statistics.next:SetDimensions(32, 32);
	Pointificator._gui.statistics.next:SetMouseEnabled(true);
	Pointificator._gui.statistics.next:SetHandler("OnClicked", function(self) 
		Pointificator.TogglePage(Pointificator._state.activeStatisticPage + 1);
	end)
	
	Pointificator._gui.statistics.nextIcon = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.next, CT_TEXTURE);
	Pointificator._gui.statistics.nextIcon:SetDimensions(32, 32);
	Pointificator._gui.statistics.nextIcon:SetAnchor(LEFT, Pointificator._gui.statistics.next, LEFT, 0, 0);
	Pointificator._gui.statistics.nextIcon:SetTexture("Pointificator/media/right.dds");
	
	Pointificator._gui.statistics.next:SetHandler("OnMouseEnter",function(self)
		Pointificator._gui.statistics.nextIcon:SetTexture("Pointificator/media/right_3.dds");
	end);
	
	Pointificator._gui.statistics.next:SetHandler("OnMouseExit",function(self) 
		Pointificator._gui.statistics.nextIcon:SetTexture("Pointificator/media/right.dds");
	end);

end

Pointificator.BuildPages = function()

	-- pages container
	Pointificator._gui.statistics.pagesContainer = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.session, CT_CONTROL);
	Pointificator._gui.statistics.pagesContainer:SetDimensions(640, 330);
	Pointificator._gui.statistics.pagesContainer:SetAnchor(TOPLEFT, Pointificator._gui.statistics.session, TOPLEFT, 0, 110);
	
	Pointificator.BuildOverviewPage();
	Pointificator.BuildCombatPage();
	Pointificator.BuildCurrencyPage();
	Pointificator.BuildLifetimePage();
	Pointificator.BuildHistoryPage();
end

Pointificator.TogglePage = function(pageId)
	
	local page = nil;
	
	if pageId == Pointificator._statisticPages.overview.id then
		
		page = Pointificator._statisticPages.overview;
		
		Pointificator._gui.statistics.overview:SetHidden(false);
		Pointificator._gui.statistics.combat:SetHidden(true);
		Pointificator._gui.statistics.currency:SetHidden(true);
		Pointificator._gui.statistics.lifetime:SetHidden(true);
		Pointificator._gui.statistics.history:SetHidden(true);
		
	elseif pageId == Pointificator._statisticPages.combat.id then
	
		page = Pointificator._statisticPages.combat;
		
		Pointificator._gui.statistics.overview:SetHidden(true);
		Pointificator._gui.statistics.combat:SetHidden(false);
		Pointificator._gui.statistics.currency:SetHidden(true);
		Pointificator._gui.statistics.lifetime:SetHidden(true);
		Pointificator._gui.statistics.history:SetHidden(true);
		
	elseif pageId == Pointificator._statisticPages.currency.id then
	
		page = Pointificator._statisticPages.currency;
		
		Pointificator._gui.statistics.overview:SetHidden(true);
		Pointificator._gui.statistics.combat:SetHidden(true);
		Pointificator._gui.statistics.currency:SetHidden(false);
		Pointificator._gui.statistics.lifetime:SetHidden(true);
		Pointificator._gui.statistics.history:SetHidden(true);
		
	elseif pageId == Pointificator._statisticPages.lifetime.id then
	
		page = Pointificator._statisticPages.lifetime;
		
		Pointificator._gui.statistics.overview:SetHidden(true);
		Pointificator._gui.statistics.combat:SetHidden(true);
		Pointificator._gui.statistics.currency:SetHidden(true);
		Pointificator._gui.statistics.lifetime:SetHidden(false);
		Pointificator._gui.statistics.history:SetHidden(true);
		
	elseif pageId == Pointificator._statisticPages.history.id then
	
		page = Pointificator._statisticPages.history;
		
		Pointificator._gui.statistics.overview:SetHidden(true);
		Pointificator._gui.statistics.combat:SetHidden(true);
		Pointificator._gui.statistics.currency:SetHidden(true);
		Pointificator._gui.statistics.lifetime:SetHidden(true);
		Pointificator._gui.statistics.history:SetHidden(false);
	end

	if page == nil then
		return
	end

	Pointificator._state.activeStatisticPage = page.id;
	
	Pointificator._gui.statistics.pageName:SetText(page.name);
end