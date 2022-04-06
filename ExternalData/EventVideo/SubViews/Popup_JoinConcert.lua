function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/EventVideo/SubViews/Popup_JoinConcert.prefab",
		Config = ""
    }
end

local _closePath = "Popup/Button_Close"
local _buttonJoinPath = "Popup/Button_Join"

local _textJoinPath = "Popup/Button_Join/Text"
local _textCoinPath = "Popup/Image_Coin/Text_Price"
local _textGemPath = "Popup/Image_Gem/Text_Price"

local _imageCoinPath = "Popup/Image_Coin"
local _imageGemPath = "Popup/Image_Gem"
local _imageTicketPath = "Popup/Image_Ticket"

--Hex Colors--
local _enableColor = "#96EEFD"
local _disableColor = "#478BA9"
----
--Sprites--
local _spriteButtonEnable = "popup_button_choose"
local _spriteButtonDisable = "popup_button_not selected"
local _banners = {
	"banner_class_1",
	"banner_class_2",
	"banner_class_3",
	"banner_class_4",
	"banner_concert_1",
	"banner_concert_2"
}
--------

function OnReady()
	Initialize()
end

function Initialize()
	SetupClosePopup()
end

function SetupClosePopup()
	local button = LuaGo.Find(_closePath)
	button.RegisterButtonPressedCallback(function ()
		LuaGo.SetActive(false)
	end)
	LuaGo.RegisterButtonPressedCallback(function ()
		LuaGo.SetActive(false)
	end)
end

function SetupJoinButton()
	local button = LuaGo.Find(_buttonJoinPath)
	EventVideo.LuaCall_ResetButton(button)
	button.RegisterButtonPressedCallback(function ()
		EventVideo.LuaCall_JoinConcert()
		LuaGo.SetActive(false)
	end)
end

function SetupBuyButton(id)
	local button = LuaGo.Find(_buttonJoinPath)
	EventVideo.LuaCall_ResetButton(button)
	button.RegisterButtonPressedCallback(function ()
		EventVideo.LuaCall_BuyConcert(id)
	end)
end

function SetupTicketImage(index)
	local image = LuaGo.Find(_imageTicketPath)
	image.SetSprite(_banners[index])
end

function SetCoinText(value)
	local coin = LuaGo.Find(_textCoinPath)
	coin.SetText(value)
end

function SetGemText(value)
	local gem = LuaGo.Find(_textGemPath)
	gem.SetText(value)
end

function SetupBoughtPopup()
	local coin = LuaGo.Find(_imageCoinPath)
	coin.SetActive(false)
	local gem = LuaGo.Find(_imageGemPath)
	gem.SetActive(false)
	local text = LuaGo.Find(_textJoinPath)
	text.SetText("Join")
end

function SetupBuyPopup(id)
	local coin = LuaGo.Find(_imageCoinPath)
	coin.SetActive(true)
	local gem = LuaGo.Find(_imageGemPath)
	gem.SetActive(true)
	local text = LuaGo.Find(_textJoinPath)
	text.SetText("Buy")
	local button = LuaGo.Find(_buttonJoinPath)
	button.SetSprite(_spriteButtonEnable)
	text.SetTextHexColor(_enableColor)
	SetupBuyButton(id)
end

function SetupAvailablePopup(isAvailable)
	local button = LuaGo.Find(_buttonJoinPath)
	local text = LuaGo.Find(_textJoinPath)
	EventVideo.LuaCall_ResetButton(button)
	SetupBoughtPopup()
	if isAvailable then
		button.SetSprite(_spriteButtonEnable)
		text.SetTextHexColor(_enableColor)
		SetupJoinButton()
	else
		button.SetSprite(_spriteButtonDisable)
		text.SetTextHexColor(_disableColor)
	end
end

function SetupTicketPopup(isBought, id)
	if isBought then
		SetupBoughtPopup()
		SetupJoinButton()
	else
		SetupBuyPopup(id)
	end
end

function Hide()
end
