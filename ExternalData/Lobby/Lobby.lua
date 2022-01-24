

function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Lobby/Lobby.prefab",
		Config = "",
		Anchor = "Cam",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end

local _buttonsIsLandPath = "Bg/footer/groupBtnLeft/islandBtn"
local _buttonGenderPath = "Bg/body/groupBtnLeft/genderBtn"
local _buttonIslandPath = "Bg/footer/groupBtn/islandBtn"
local _buttonPVPPath = "Bg/footer/groupBtn/pvpBtn"

local _buttonSkinPath = "Bg/body/groupBtnRight/skinBtn"

function OnReady()
	SetupButtonGender(_buttonGenderPath)
	SetupButtonIsland(_buttonIslandPath)

	SetupButtonSkin(_buttonSkinPath)


	SetupButtonPVP(_buttonPVPPath)
end

function SetupButton(animName, btnPath, index)
	local btn = LuaGo.Find(btnPath)		
	btn.RegisterButtonPressedCallback(function ()
		_animator.AnimationSetTrigger(animName)
		Lobby.Scroller.AddLobbyBody(_playerMainBodyPath, _playerHeadPartPath, _playerBackPartPath, _playerHandLPartPath, _playerHandRPartPath)
    end)
end

function SetupButtonGender(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Lobby.ChangeGender()
    end)
end

function SetupButtonIsland(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		Lobby.LuaCall_LoadMapIsland()
    end)
end

function SetupButtonSkin(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		Lobby.LuaCall_LoadInventory()
	end)
end


function SetupButtonPVP(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		Lobby.LuaCall_QuestionTest()
    end)
end

function Hide()
end
