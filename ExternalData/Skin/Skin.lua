function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Skin/Skin.prefab",
		Config = "",
		Anchor = "Front",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end

local _textCoinPath = "Scene_Skin/TopBar/txt_Coin/txt_Value"
local _textGemPath = "Scene_Skin/TopBar/txt_Gem/txt_Value"
local _textEnergyPath = "Scene_Skin/TopBar/txt_Energy/txt_Value"

local _buttonBackPath = "Scene_Skin/TopBar/group_btn_Cancel/btn_Cancel"

local _popupContainer = "Popups"
local _robotContainer = "Scene_Skin/Inventory/ListItem/Content"
----luaView----
local _popupBuySubview = "Skin/SubViews/SkinPopupBuyConfirm"
local _popupCongratSubview = "Skin/SubViews/SkinPopupBuySuccess"
local _robotSubview = "Skin/SubViews/Robot"
--------
local _buyLoadingSuccessPath = "Popup/Loading"

function OnReady()
	SetupBackButton()
end

function CreateLuaView(lua, containerPath)
	local container = LuaGo.Find(containerPath)
	CreateSubView(lua, container.Transform)
end

function CreateRobot()
	CreateLuaView(_robotSubview, _robotContainer)
end

function CreatePopupBuyConfirm()
	CreateLuaView(_popupBuySubview, _popupContainer)
end

function CreatePopupBuySuccess()
	CreateLuaView(_popupCongratSubview, _popupContainer)
end

function SetText(value, textPath)
	local text = LuaGo.Find(textPath)
	text.SetText(value)
end

function SetCoin(value)
	SetText(value, _textCoinPath)
end

function SetGem(value)
	SetText(value, _textGemPath)
end

function SetEnergy(value)
	SetText(value, _textEnergyPath)
end

function SetCurrencies(coin, gem, energy)
	SetCoin(coin)
	SetGem(gem)
	SetEnergy(energy)
end

function SetupBackButton()
	local button = LuaGo.Find(_buttonBackPath)
	button.RegisterButtonPressedCallback(function ()
		Skin.LuaCall_BackToLobby()
	end)
end

function Hide()

end
