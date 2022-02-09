


function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/MainMenu/MainMenu.prefab",
		Config = "",
		Anchor = "Root",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end


local _buttonIslandPath = "MainMenu/Bg/footer/groupBtn/islandBtn"
local _buttonPVPPath = "MainMenu/Bg/footer/groupBtn/pvpBtn"
local _buttonFriendPath = "MainMenu/Bg/footer/groupBtn/friendBtn"
local _buttonVoucherPath = "MainMenu/Bg/footer/groupBtn/voucherBtn"
local _buttonShopPath = "MainMenu/Bg/footer/groupBtn/shopBtn"

local _bottomButtonPaths = {
	"MainMenu/Bg/footer/groupBtn/islandBtn",
	"MainMenu/Bg/footer/groupBtn/pvpBtn",
	"MainMenu/Bg/footer/groupBtn/friendBtn",
	"MainMenu/Bg/footer/groupBtn/voucherBtn",
	"MainMenu/Bg/footer/groupBtn/shopBtn"
}

local _txtCoinPath ="MainMenu/Bg/header/currencyGroup/gold/goldTxt"
local _txtGemPath ="MainMenu/Bg/header/currencyGroup/gem/gemTxt"
local _txtNamePath ="MainMenu/Bg/header/playerNameGroup/playerNameTxt"
local _txtLevelPath = "MainMenu/Bg/header/avatarFrame/ImgLevel/txtLevel"
local _txtStarPath = "MainMenu/Bg/header/currencyGroup/Energy/EnergyTxt"
local _pathHeader ="MainMenu/Bg/header"
local _pathFooter = "MainMenu/Bg/footer"

local _scrollContent = nil
local _animator = nil

local _unSelectColor = nil
local _selectColor = nil

function OnReady()

	SetupButtonIsland(_buttonIslandPath)
	SetupButtonPVP(_buttonPVPPath)
	SetupButtonFriend(_buttonFriendPath)
	SetupButtonShop(_buttonShopPath)
	SetupButtonVoucher(_buttonVoucherPath)

	local objHeader = LuaGo.Find(_pathHeader)
	objHeader.SetActive(true);


end

function SetupButton(animName, btnPath, index)
	local btn = LuaGo.Find(btnPath)		
	btn.RegisterButtonPressedCallback(function ()
		_animator.AnimationSetTrigger(animName)
		Lobby.Scroller.AddLobbyBody(_playerMainBodyPath, _playerHeadPartPath, _playerBackPartPath, _playerHandLPartPath, _playerHandRPartPath)
    end)
end



function SetupButtonIsland(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		MainMenu.LuaCall_LoadMapIsLand()
		SetSelectColorButton(btnPath)
    end)
end

function SetupButtonPVP(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		MainMenu.LuaCall_JoinPVP()
		SetSelectColorButton(btnPath)
    end)
end
function SetupButtonFriend(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		MainMenu.LuaCall_LoadFriend()
		SetSelectColorButton(btnPath)
    end)
end
function SetupButtonVoucher(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		MainMenu.LuaCall_LoadVoucher()
		SetSelectColorButton(btnPath)
    end)
end

function SetupButtonShop(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		MainMenu.LuaCall_LoadShop()
		SetSelectColorButton(btnPath)
    end)
end

function SetCurency(coin,gem,name, star, level)

	local objCoin = LuaGo.Find(_txtCoinPath)
	objCoin.SetText(coin,objCoin)

	local objGem = LuaGo.Find(_txtGemPath)
	objGem.SetText(gem,objGem)

	local objName = LuaGo.Find(_txtNamePath)
	objName.SetText(name,objName)

	local objStar = LuaGo.Find(_txtStarPath)
	objStar.SetText(star,objStar)

	local objLevel = LuaGo.Find(_txtLevelPath)
	objLevel.SetText(level,objLevel)

end
function SetUiShop(isActive)
	local objHeader = LuaGo.Find(_pathHeader)
	objHeader.SetActive(isActive);
	
end
function SetUIMenu(isActive)
	local objBot = LuaGo.Find(_pathFooter)
	objBot.SetActive(isActive);
end

function SetColorButton(select, unselect)
	_unSelectColor = unselect
	_selectColor = select
end

function SetUnSelectColorForButtons()
	for i = 1, #_bottomButtonPaths do

		local button = LuaGo.Find(_bottomButtonPaths[i])
		button.SetSprite("button_not_selected",button)

		local Txt = LuaGo.Find(string.format("%s%s",_bottomButtonPaths[i] ,"/footIcon/Txt"))
		Txt.SetTextColor(_unSelectColor)

		local icon = LuaGo.Find(string.format("%s%s",_bottomButtonPaths[i] ,"/Icon"))
		icon.SetSprite(string.gsub(string.format("%s%s",_bottomButtonPaths[i] ,"/_1"),"/",""), icon)
	end
end

function SetSelectColorButton(buttonPath)
		SetUnSelectColorForButtons()

		local button = LuaGo.Find(buttonPath)
		button.SetSprite("button_choose",button)

		local Txt = LuaGo.Find(string.format("%s%s",buttonPath ,"/footIcon/Txt"))
		Txt.SetTextColor(_selectColor)

		local icon = LuaGo.Find(string.format("%s%s",buttonPath ,"/Icon"))
		Log(string.gsub(string.format("%s%s",buttonPath ,"/_2"),"/",""))
		icon.SetSprite(string.gsub(string.format("%s%s",buttonPath ,"/_2"),"/",""), icon)
end

function Hide()
end
