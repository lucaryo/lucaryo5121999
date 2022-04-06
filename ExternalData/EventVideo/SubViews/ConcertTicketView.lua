function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/EventVideo/SubViews/ConcertTicket.prefab",
		Config = ""
    }
end

local _imageHeadPath = "Image_Head"
local _buttonPath = "Button"
local _imageTailPath = "Image_Tail"
local _textTimePath = "Image_Tail/Text_Time"
local _textAvailablePath = "Image_Tail/Text_Available"
local _imagePriceBgPath = "Image_Tail/Image_PriceBg"
local _imageCoinPath = "Image_Tail/Image_PriceBg/Image_Coin"
local _imageGamePath = "Image_Tail/Image_PriceBg/Image_Gem"
local _textCoinPath = "Image_Tail/Image_PriceBg/Image_Coin/Text_Price"
local _textGemPath = "Image_Tail/Image_PriceBg/Image_Gem/Text_Price"

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

function SetupGemPrice(value)
	local gem = LuaGo.Find(_textGemPath)
	gem.SetText(value)
end
function SetupCoinPrice(value)
	local coin = LuaGo.Find(_textCoinPath)
	coin.SetText(value)
end

function SetupButton()
	local button = LuaGo.Find(_buttonPath)
	button.RegisterButtonPressedCallback(function ()
		EventVideo.LuaCall_ShowConcertPopup(LuaGo)
	end)
end

function Hide()
end
