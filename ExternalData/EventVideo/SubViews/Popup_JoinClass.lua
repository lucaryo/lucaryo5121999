function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/EventVideo/SubViews/Popup_JoinClass.prefab",
		Config = ""
    }
end

local _closePath = "Popup/Button_Close"
local _buttonJoinPath = "Popup/Button_Join"

local _imageTicketPath = "Popup/Image_Ticket"

local _textJoinPath = "Popup/Button_Join/Text"

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
	button.RegisterButtonPressedCallback(function ()
		EventVideo.LuaCall_JoinClass()
		LuaGo.SetActive(false)
	end)
end

function SetupTicketImage(index)
	local image = LuaGo.Find(_imageTicketPath)
	image.SetSprite(_banners[index])
end

function CheckTicketAvailable(isAvailable)
	local button = LuaGo.Find(_buttonJoinPath)
	local text = LuaGo.Find(_textJoinPath)
	if isAvailable then
		button.SetSprite(_spriteButtonEnable)
		text.SetTextHexColor(_enableColor)
		SetupJoinButton()
	else
		button.SetSprite(_spriteButtonDisable)
		text.SetTextHexColor(_disableColor)
	end
end

function Hide()
end
