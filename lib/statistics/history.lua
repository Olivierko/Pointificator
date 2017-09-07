-------------------------------------------------------------------------------------------------
-- Builds the history page --
-------------------------------------------------------------------------------------------------
Pointificator.BuildHistoryPage = function()

	-- history container
	Pointificator._gui.statistics.history = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.pagesContainer, CT_CONTROL);
	Pointificator._gui.statistics.history:SetDimensions(640, 330);
	Pointificator._gui.statistics.history:SetAnchor(TOPLEFT, Pointificator._gui.statistics.pagesContainer, TOPLEFT, 25, 0);
	Pointificator._gui.statistics.history:SetHidden(true);
	
	-- scroll
	Pointificator._gui.statistics.history.scroll = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.history, CT_CONTROL);
	Pointificator._gui.statistics.history.scroll:SetDimensions(640, 330);
	Pointificator._gui.statistics.history.scroll:SetAnchor(TOP, Pointificator._gui.statistics.history, TOP, 70, 0);
	Pointificator._gui.statistics.history.scroll.entries = {};
	Pointificator._gui.statistics.history.scroll:SetMouseEnabled(true);
	
	Pointificator._gui.statistics.history.scroll:SetHandler("OnMouseWheel", function(self, delta) 
		
		local currentValue = Pointificator._gui.statistics.history.slider:GetValue();
		
		if delta > 0 then
			Pointificator._gui.statistics.history.slider:SetValue(currentValue - 1);
		else
			Pointificator._gui.statistics.history.slider:SetValue(currentValue + 1);
		end
	end)

	-- slider
	local texture = "/esoui/art/miscellaneous/scrollbox_elevator_disabled.dds"; -- 16x32
	Pointificator._gui.statistics.history.slider = WINDOW_MANAGER:CreateControl(nil, Pointificator._gui.statistics.history.scroll, CT_SLIDER);
	Pointificator._gui.statistics.history.slider:SetDimensions(13, 300);
	Pointificator._gui.statistics.history.slider:SetMouseEnabled(true);
	Pointificator._gui.statistics.history.slider:SetThumbTexture(texture, texture, texture, 13, 35, 0, 0, 1, 1);
	Pointificator._gui.statistics.history.slider:SetValue(0);
	Pointificator._gui.statistics.history.slider:SetValueStep(1);
	Pointificator._gui.statistics.history.slider:SetAnchorFill();
	Pointificator._gui.statistics.history.slider:SetMinMax(Pointificator._history.minEntries, Pointificator._history.maxEntries);
	Pointificator._gui.statistics.history.slider:ClearAnchors();
	Pointificator._gui.statistics.history.slider:SetAnchor(TOPLEFT, Pointificator._gui.statistics.history.scroll, TOPLEFT, Pointificator._gui.statistics.history.scroll:GetWidth() - 100, 30);
	
	-- draw initial headers
	Pointificator.BuildHistoryTableHeader();
	
	for index = 1, Pointificator._history.maxEntries do
		local entryItem = Pointificator.BuildHistoryTableEntry(index);
		table.insert(Pointificator._gui.statistics.history.scroll.entries, index, entryItem);
	end
	
	-- draw default history
	Pointificator.DrawHistory(1);
	
	Pointificator._gui.statistics.history.slider:SetHandler("OnValueChanged", function(self, value)
		
		local isHidden = self:IsHidden();
		
		if isHidden then
			-- scrolling not active
			return
		end
		
		Pointificator.DrawHistory(value);
	end)
end

Pointificator.BuildHistoryTableHeader = function()

	-- container
	local container = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.history, CT_CONTROL);
	container:SetDimensions(600, 30);
	container:SetAnchor(TOPLEFT, Pointificator._gui.statistics.history, TOPLEFT, 0, 0);
	
	local containerColor = 0.9;
	local transperency = 0.4;
	
	-- backdrop
	local backdrop = Pointificator._wm:CreateControl(nil, container, CT_BACKDROP);
	backdrop:SetAnchorFill(container);
	backdrop:SetCenterColor(containerColor, containerColor, containerColor, transperency);
	backdrop:SetEdgeColor(containerColor, containerColor, containerColor, transperency);
	backdrop:SetEdgeTexture(nil, 1, 1, 1.0, 1.0);
	
	-- index
	local indexContainer = Pointificator._wm:CreateControl(nil, container, CT_CONTROL);
	indexContainer:SetDimensions(30, 30);
	indexContainer:SetAnchor(TOPLEFT, container, TOPLEFT, 5, 0);
	
	local index = Pointificator._wm:CreateControl(nil, indexContainer, CT_BUTTON);
	index:SetDimensions(30, 30);
	index:SetAnchor(LEFT, indexContainer, LEFT, 0, 0);
	index:SetFont(Pointificator._fontSmall);
	index:SetText('#');
	index:SetMouseEnabled(true);
	index:SetHorizontalAlignment(0);
	index:SetVerticalAlignment(1);
	
	-- name
	local nameContainer = Pointificator._wm:CreateControl(nil, container, CT_CONTROL);
	nameContainer:SetDimensions(238, 30);
	nameContainer:SetAnchor(TOPLEFT, indexContainer, TOPLEFT, 30, 0);
	
	local name = Pointificator._wm:CreateControl(nil, nameContainer, CT_BUTTON);
	name:SetDimensions(238, 30);
	name:SetAnchor(LEFT, nameContainer, LEFT, 0, 0);
	name:SetFont(Pointificator._fontSmall);
	name:SetText('Name');
	name:SetMouseEnabled(true);
	name:SetHorizontalAlignment(0);
	name:SetVerticalAlignment(1);
	
	-- kills
	local killsContainer = Pointificator._wm:CreateControl(nil, container, CT_CONTROL);
	killsContainer:SetDimensions(70, 30);
	killsContainer:SetAnchor(TOPLEFT, nameContainer, TOPLEFT, 238, 0);
	
	local kills = Pointificator._wm:CreateControl(nil, killsContainer, CT_BUTTON);
	kills:SetDimensions(70, 30);
	kills:SetAnchor(LEFT, killsContainer, LEFT, 0, 0);
	kills:SetFont(Pointificator._fontSmall);
	kills:SetText('Kills');
	kills:SetMouseEnabled(true);
	kills:SetHorizontalAlignment(0);
	kills:SetVerticalAlignment(1);
	
	-- deaths	
	local deathsContainer = Pointificator._wm:CreateControl(nil, container, CT_CONTROL);
	deathsContainer:SetDimensions(90, 30);
	deathsContainer:SetAnchor(TOPLEFT, killsContainer, TOPLEFT, 70, 0);
	
	local deaths = Pointificator._wm:CreateControl(nil, deathsContainer, CT_BUTTON);
	deaths:SetDimensions(90, 30);
	deaths:SetAnchor(LEFT, deathsContainer, LEFT, 0, 0);
	deaths:SetFont(Pointificator._fontSmall);
	deaths:SetText('Deaths');
	deaths:SetMouseEnabled(true);
	deaths:SetHorizontalAlignment(0);
	deaths:SetVerticalAlignment(1);
	
	-- killed time
	local killedTimeContainer = Pointificator._wm:CreateControl(nil, container, CT_CONTROL);
	killedTimeContainer:SetDimensions(93, 30);
	killedTimeContainer:SetAnchor(TOPLEFT, deathsContainer, TOPLEFT, 90, 0);
	
	local killedTime = Pointificator._wm:CreateControl(nil, killedTimeContainer, CT_BUTTON);
	killedTime:SetDimensions(93, 30);
	killedTime:SetAnchor(LEFT, killedTimeContainer, LEFT, 0, 0);
	killedTime:SetFont(Pointificator._fontSmall);
	killedTime:SetText('Killed');
	killedTime:SetMouseEnabled(true);
	killedTime:SetHorizontalAlignment(0);
	killedTime:SetVerticalAlignment(1);
	
	local deathTimeContainer = Pointificator._wm:CreateControl(nil, container, CT_CONTROL);
	deathTimeContainer:SetDimensions(113, 30);
	deathTimeContainer:SetAnchor(TOPLEFT, killedTimeContainer, TOPLEFT, 93, 0);
	
	-- death time
	local deathTime = Pointificator._wm:CreateControl(nil, deathTimeContainer, CT_BUTTON);
	deathTime:SetDimensions(113, 30);
	deathTime:SetAnchor(LEFT, deathTimeContainer, LEFT, 0, 0);
	deathTime:SetFont(Pointificator._fontSmall);
	deathTime:SetText('Died');
	deathTime:SetMouseEnabled(true);
	deathTime:SetHorizontalAlignment(0);
	deathTime:SetVerticalAlignment(1);
end

Pointificator.BuildHistoryTableEntry = function(index)

	local marginTop = index * 30;

	-- container
	local container = Pointificator._wm:CreateControl(nil, Pointificator._gui.statistics.history, CT_CONTROL);
	container:SetDimensions(600, 30);
	container:SetAnchor(TOPLEFT, Pointificator._gui.statistics.history, TOPLEFT, 0, marginTop);
	
	local containerColor;
	local transperency = 0.3;
	
	if index % 2 == 0 then
		containerColor = 0.5;
	else
		containerColor = 0.3;
	end
		
	-- backdrop
	local backdrop = Pointificator._wm:CreateControl(nil, container, CT_BACKDROP);
	backdrop:SetAnchorFill(container);
	backdrop:SetCenterColor(containerColor, containerColor, containerColor, transperency);
	backdrop:SetEdgeColor(containerColor, containerColor, containerColor, transperency);
	backdrop:SetEdgeTexture(nil, 1, 1, 1.0, 1.0);
	
	-- id
	local id = Pointificator._wm:CreateControl(nil, container, CT_LABEL);
	id:SetDimensions(30, 30);
	id:SetAnchor(LEFT, container, LEFT, 5, 5);
	id:SetFont(Pointificator._fontSmall);
	
	-- name
	local name = Pointificator._wm:CreateControl(nil, container, CT_BUTTON);
	name:SetDimensions(238, 30);
	name:SetAnchor(TOPLEFT, id, TOPLEFT, 30, 0);
	name:SetFont(Pointificator._fontSmall);
	name:SetMouseEnabled(true);
	name:SetHorizontalAlignment(0);
	name:SetMouseOverFontColor(0.5, 0.5, 0.5, 1);
	name:SetHandler("OnClicked", function(self)
		
		local playerName = self:GetLabelControl():GetText();
		
		if playerName == nil or playerName == '' then
			return;
		end
		
		CHAT_SYSTEM:StartTextEntry("", CHAT_CHANNEL_WHISPER, playerName);
	end);
	
	-- kills
	local kills = Pointificator._wm:CreateControl(nil, container, CT_LABEL);
	kills:SetDimensions(70, 30);
	kills:SetAnchor(LEFT, name, LEFT, 238, 0);
	kills:SetFont(Pointificator._fontSmall);
	
	-- deaths
	local deaths = Pointificator._wm:CreateControl(nil, container, CT_LABEL);
	deaths:SetDimensions(90, 30);
	deaths:SetAnchor(LEFT, kills, LEFT, 70, 0);
	deaths:SetFont(Pointificator._fontSmall);
	
	-- killed time
	local killedTime = Pointificator._wm:CreateControl(nil, container, CT_LABEL);
	killedTime:SetDimensions(93, 30);
	killedTime:SetAnchor(LEFT, deaths, LEFT, 90, 0);
	killedTime:SetFont(Pointificator._fontSmall);
	
	-- death time
	local deathTime = Pointificator._wm:CreateControl(nil, container, CT_LABEL);
	deathTime:SetDimensions(113, 30);
	deathTime:SetAnchor(LEFT, killedTime, LEFT, 93, 0);
	deathTime:SetFont(Pointificator._fontSmall);
	
	local entryItem = {
		container = container,
		id = id,
		name = name,
		kills = kills,
		deaths = deaths,
		killedTime = killedTime,
		deathTime = deathTime
	};
	
	return entryItem;
end

Pointificator.GetNumberOfEntries = function(tableToCount)

	local count = 0;

	for key, value in pairs(tableToCount) do
		count = count + 1;
	end
	
	return count;
end

Pointificator.GetTimeDifferenceString = function(timeStamp)
	
	if timeStamp == nil then
		return "N/A";
	end
	
	local currentTime = GetTimeStamp();
	local timeDifferenceInSeconds = GetDiffBetweenTimeStamps(currentTime, timeStamp);
	
	local hours = timeDifferenceInSeconds/(60*60);
	local minutes = timeDifferenceInSeconds/60%60;
	local seconds = timeDifferenceInSeconds%60;
	
	local differenceString = string.format(
		"%.2d:%.2d:%.2d", 
		timeDifferenceInSeconds/(60*60), 
		timeDifferenceInSeconds/60%60, 
		timeDifferenceInSeconds%60
	);
	
	return differenceString;
end

Pointificator.DrawHistory = function(startIndex)

	Pointificator._state.history.startIndex = startIndex;

	local numberOfEntries = Pointificator.GetNumberOfEntries(Pointificator._session.history);
	
	local maxSlider = nil;
	
	if numberOfEntries > Pointificator._history.maxEntries then
		
		-- ensure we display slider
		Pointificator._gui.statistics.history.slider:SetHidden(false);
		
		-- adjust max slider value
		maxSlider = numberOfEntries - 9;
	else
		-- no need to display slider
		Pointificator._gui.statistics.history.slider:SetHidden(true);

		-- doesnt matter what we set this to since it's not visible
		maxSlider = numberOfEntries;
	end
	
	-- ensure we adjust the slider each time history changes
	Pointificator._gui.statistics.history.slider:SetMinMax(Pointificator._history.minEntries, maxSlider);
	
	local entryIndex = 1;
	local tableEntryIndex = 1;
	local skip;

	for key, value in pairs(Pointificator._session.history) do
		
		skip = ((entryIndex < startIndex) or (entryIndex > (startIndex + Pointificator._history.maxEntries)));
		
		if (not skip) then
			
			local killTimeString = Pointificator.GetTimeDifferenceString(value.killTime);
			local deathTimeString = Pointificator.GetTimeDifferenceString(value.deathTime);
			local playerName = zo_strformat("<<1>>", key);
			
			-- populate entry
			Pointificator._gui.statistics.history.scroll.entries[tableEntryIndex].id:SetText(entryIndex);
			Pointificator._gui.statistics.history.scroll.entries[tableEntryIndex].name:SetText(playerName);
			Pointificator._gui.statistics.history.scroll.entries[tableEntryIndex].kills:SetText(value.kills);
			Pointificator._gui.statistics.history.scroll.entries[tableEntryIndex].deaths:SetText(value.deaths);
			Pointificator._gui.statistics.history.scroll.entries[tableEntryIndex].killedTime:SetText(killTimeString);
			Pointificator._gui.statistics.history.scroll.entries[tableEntryIndex].deathTime:SetText(deathTimeString);
			
			Pointificator._gui.statistics.history.scroll.entries[tableEntryIndex].key = key;
			
			tableEntryIndex = tableEntryIndex + 1;
		end
		
		-- determine if break
		if tableEntryIndex > Pointificator._history.maxEntries then
			break;
		end
		
		entryIndex = entryIndex + 1;
	end
end

Pointificator.ResetHistoryTable = function()

	for index = Pointificator._history.minEntries, Pointificator._history.maxEntries do
		
		Pointificator._gui.statistics.history.scroll.entries[index].id:SetText("");
		Pointificator._gui.statistics.history.scroll.entries[index].name:SetText("");
		Pointificator._gui.statistics.history.scroll.entries[index].kills:SetText("");
		Pointificator._gui.statistics.history.scroll.entries[index].deaths:SetText("");
		Pointificator._gui.statistics.history.scroll.entries[index].killedTime:SetText("");
		Pointificator._gui.statistics.history.scroll.entries[index].deathTime:SetText("");
		
		Pointificator._gui.statistics.history.scroll.entries[index].key = nil;
	end
end

Pointificator.UpdateHistoryValues = function()

	for index = Pointificator._history.minEntries, Pointificator._history.maxEntries do
		
		local key = Pointificator._gui.statistics.history.scroll.entries[index].key;
		
		if key ~= nil then
		
			local entry = Pointificator._session.history[key];
			
			local killTimeString = Pointificator.GetTimeDifferenceString(entry.killTime);
			local deathTimeString = Pointificator.GetTimeDifferenceString(entry.deathTime);
			
			Pointificator._gui.statistics.history.scroll.entries[index].kills:SetText(entry.kills);
			Pointificator._gui.statistics.history.scroll.entries[index].deaths:SetText(entry.deaths);
			Pointificator._gui.statistics.history.scroll.entries[index].killedTime:SetText(killTimeString);
			Pointificator._gui.statistics.history.scroll.entries[index].deathTime:SetText(deathTimeString);
		end
	end
end