local variant = Tracker.ActiveVariantUID

--LOADED SCRIPTS
ScriptHost:LoadScript("scripts/logic.lua")

--LOAD ITEMS
Tracker:AddItems("items/items.json")

--LOAD OPTIONS
Tracker:AddItems("options/options.json")

-- Open Maps, Then Layouts, Then Locations
if (string.find(Tracker.ActiveVariantUID, "items_only")) then
    Tracker:AddLayouts("layouts/items_only.json")
	Tracker:AddLayouts("layouts/broadcast_vertical.json")
    Tracker:AddLayouts("layouts/settings.json")
elseif (string.find(Tracker.ActiveVariantUID, "map_tracker")) then
	Tracker:AddMaps("maps/maps.json")
	Tracker:AddLayouts("layouts/tracker_standard.json")
	Tracker:AddLayouts("layouts/broadcast_vertical.json")
	Tracker:AddLocations("locations/Act1.json")
	Tracker:AddLocations("locations/Act2.json")
	Tracker:AddLocations("locations/Act3.json")
	Tracker:AddLayouts("layouts/settings.json") 
end

ScriptHost:LoadScript("scripts/autotracking.lua") 