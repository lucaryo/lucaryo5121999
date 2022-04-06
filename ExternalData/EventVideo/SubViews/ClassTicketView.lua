function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/EventVideo/SubViews/ClassTicket.prefab",
		Config = ""
    }
end

local _buttonPath = "Button"
local _imageHeadPath = "Image_Head"

local _ticketTailPath = "Image_Tail"
local _textTimePath = "Image_Tail/Text_Time"
local _textAvailablePath = "Image_Tail/Text_Available"
local _imagePriceBackgroundPath = "Image_Tail/Image_PriceBg"
local _textPricePath = "Image_Tail/Image_PriceBg/Text_Price"

local _banners = {
	"banner_class_1",
	"banner_class_2",
	"banner_class_3",
	"banner_class_4",
	"banner_concert_1",
	"banner_concert_2"
}

function OnReady()
	Initialize()
end

function Initialize()
	SetupButton()
end

function SetupHeadImage(index)
	local image = LuaGo.Find(_imageHeadPath)
	image.SetSprite(_banners[index])
end

function SetupButton()
	local button = LuaGo.Find(_buttonPath)
	button.RegisterButtonPressedCallback(function ()
		EventVideo.LuaCall_ShowClassPopup(LuaGo)
	end)
end

function Hide()
end
