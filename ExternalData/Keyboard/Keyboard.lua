

function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Keyboard/Keyboard.prefab",
		Config = "",
		Anchor = "Root",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end

local _inputFieldPath = "InputField"
local _keyboardBackgroundPath = "Background"
local _capslockImagePath = "Assets/GameData/Art/UI_SCI_/Keyboard/icon_capital.png"
local _capslockImageSelectPath = "Assets/GameData/Art/UI_SCI_/Keyboard/icon_capital_select.png"
local _deleteImagePath = "Assets/GameData/Art/UI_SCI_/Keyboard/icon_delete.png"
local _deleteImageSelectPath = "Assets/GameData/Art/UI_SCI_/Keyboard/icon_delete_select.png"

local _deleteIcon = "icon_delete"
local _deleteIcon_Selected = "icon_delete_select"

local _buttonIcon = "button_key"
local _buttonIcon_Selected = "button_key_select"

local _iconCapital = "icon_capital"
local _iconCapital_Selected = "icon_capital_select"

local _textNormalColor = "#6D82B3"
local _textColor_Selected = "#A6F1F3"

function OnReady()
	GetKeyboard()
end

function GetKeyboard()
	local go = LuaGo.Find(_keyboardBackgroundPath)
	Keyboard.LuaCall_GetBackgroundObject(go)
	Keyboard.LuaCall_SetupButtons()
end

function SetButtons(name, path)
	local button = LuaGo.Find(path)
	if name == "capital" then
		local buttonImage = LuaGo.Find(string.format("%s/Image", path))
		button.RegisterButtonPressedCallback(function ()
			Keyboard.LuaCall_SetCapsLockSprite( _iconCapital, _iconCapital_Selected, buttonImage)
		end)
	elseif name == "delete" then
		local buttonImage = LuaGo.Find(string.format("%s/Image", path))
		button.RegisterButtonPressedCallback(function ()
			ChangeSpriteOnClick(_deleteIcon, _deleteIcon_Selected, buttonImage)
			Keyboard.LuaCall_Input(name)
			end)
	elseif name == "check" or name == "space" then
		local buttonText = LuaGo.Find(string.format("%s/Text (TMP)", path))
		button.RegisterButtonPressedCallback(function ()
			ChangeColorOnClick(normalColor, selectedColor, buttonText)
			Keyboard.LuaCall_Input(name)
		end)
	else
		button.RegisterButtonPressedCallback(function ()
			ChangeSpriteOnClick(_buttonIcon, _buttonIcon_Selected, button)
			Keyboard.LuaCall_Input(name)
		end)
	end
end

function ChangeSpriteOnClick(normalSprite, selectedSprite, gameObject)
	local changeOnPointerDown = coroutine.create(function ()
		gameObject.SetSprite(selectedSprite)
		Wait(0.1)
		gameObject.SetSprite(normalSprite)
	end)
	coroutine.resume(changeOnPointerDown)
end

function ChangeColorOnClick(normalColor, selectedColor, gameObject)
	local changeOnPointerDown = coroutine.create(function ()
		gameObject.SetTextHexColor(_textColor_Selected)
		Wait(0.1)
		gameObject.SetTextHexColor(_textNormalColor)
	end)
	coroutine.resume(changeOnPointerDown)
end

function SetSprite(button, imageName)
	button.SetSprite(imageName)
end

function Hide()
end
