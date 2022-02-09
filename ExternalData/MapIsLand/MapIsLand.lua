function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/IsLand/MapIsLand.prefab",
		Config = "{\"planetPath\":\"Assets/PolygonSciFiSpace/Scenes/PlanetView_1.prefab\"}",
		Anchor = "CamScale",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end
local _isLandItem = "MapIsLand/SubViews/MapIsLandSubViews"
local _btnJoinIsLand = "Bg/body/btnJoinIsLand"
local _btnBackLobby = "Bg/body/btnBack"
local _goHorizontalSnap = "Horizontal Scroll Snap"

local _planetLocation = "Horizontal Scroll Snap/Content/planet";
--local _goHorizontalSnap_planet2 = "Horizontal Scroll Snap/Content/planet2";
--local _goHorizontalSnap_planet3 = "Horizontal Scroll Snap/Content/planet3";
--local _goHorizontalSnap_planet4 = "Horizontal Scroll Snap/Content/planet4";
--local _goHorizontalSnap_planet5 = "Horizontal Scroll Snap/Content/planet5";

local _planetTxtLevel = "Bg/PlanetView/Info/Level"
local _planetTxtName = "Bg/PlanetView/Info/Name"
local _goLock = "Bg/PlanetView/Lock"
local _goInfo = "Bg/PlanetView"
function OnReady()
	--SetupBtnPlanet()
	SetupButtonBackLobby(_btnBackLobby)
	SetupHorizontalSnap(_goHorizontalSnap)
end

function SetPlanetTxtLevel(level)
	local txtLevel = LuaGo.Find(_planetTxtLevel)
    txtLevel.SetText(level)
end

function SetPlanetTxtName(name)
	local txtName = LuaGo.Find(_planetTxtName)
    txtName.SetText(name)
end

function EnableLock()
    local goLock = LuaGo.Find(_goLock)
    goLock.SetActive(true)
end

function DisableLock()
    local goLock = LuaGo.Find(_goLock)
    goLock.SetActive(false)
end

function EnableInfo()
    local goInfo = LuaGo.Find(_goInfo)
    goInfo.SetActive(true)
end

function DisableInfo()
    local goInfo = LuaGo.Find(_goInfo)
    goInfo.SetActive(false)
end

function SetupHorizontalSnap(goPath)

	local go = LuaGo.Find(goPath)
    MapIsLand.LuaCall_AddSetupHorizontalSnap(go)
end

function SetupPlanetButtons(length)
    for i = 1, length do
        local _planetButtonLocation = string.format("%s%d", _planetLocation, i)
        local _planetButton = LuaGo.Find(_planetButtonLocation)
        MapIsLand.LuaCall_InitializePlanetData(i)
        _planetButton.RegisterButtonPressedCallback(function ()
            MapIsLand.LuaCall_JoinIsLandSubView(i)
        end)
    end
end

function SetupButtonJoinIsland(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		MapIsLand.LuaCall_JoinIsLand()
    end)
end
function SetupButtonBackLobby(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		MapIsLand.LuaCall_BackLobby()
    end)
end

function CreateSubViewIsLand(sum)
	_scrollContent = LuaGo.Find("Bg/body/Scroll/pannel")
	for i = 1, sum do
           CreateSubView(_isLandItem, _scrollContent.Transform)
    end
end

function Hide()
end
