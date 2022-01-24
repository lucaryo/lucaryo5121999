﻿


function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Login/Login.prefab",
		Config = ""
    }
end



local _buttonsLoginGuestPath = "Login/Bot/btnLoginGuest"

local _inputFieldNamePath = "Login/Body/ObjLogin/inputFileldUserName"
local _inputFieldPassPath = "Login/Body/ObjLogin/inputFileldPassWord"

local _txtVersion = "Login/Bot/txtInfoApp"
local _txtVersionBg = "Login/Bot/iconBg"
local _versionBtn = "Login/Bot/iconBtn"

local _buttonShowPassPath = "Login/Body/ObjLogin/inputFileldPassWord/btnShowPass"

local _isShowPass = false

local _isActiveInfo = false

function OnReady()
	
	SetupButtonLoginGuest(_buttonsLoginGuestPath)
	SelectInputField(_inputFieldNamePath)
	SelectInputField(_inputFieldPassPath)
	SetButtonShowPass(_buttonShowPassPath)

	SetActiveInfoObject(_isActiveInfo)
	SetButtonInfo()
end



function SetupButtonLoginGuest(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Login.LuaCall_CreateGuestPlayer()
		--SetText(_inputFieldNamePath)

    end)
end

function SelectInputField(inputField)
	Log(inputField)
	local obj = LuaGo.Find(inputField)
	obj.RegisterEventTriggerPointerClickCallback(function ()
		SetInputFieldImage("enter text_choose", inputField)
    end)

	obj.RegisterInputFieldEndEditCallback(function ()
		SetInputFieldImage("enter text", inputField)
    end)
end

function SetInputFieldImage(image, inputField)
	local obj = LuaGo.Find(inputField)
	obj.SetSprite(image,obj)
end

function GetText(btnPath)
	local textObj = LuaGo.Find(btnPath)
	local text = textObj.GetText()
	Login.LuaCall_LoginGuest_OnClicked(text)
end

function ShowPassClick()
	local obj = LuaGo.Find(_inputFieldPassPath)
	obj.SwitchInputFieldPassType(obj)
end

function SetButtonShowPass(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		ShowPassClick()
		btn.SetSprite("",icon_eye_1)
		SetSpriteButtonShowPass(btnPath)
    end)
end

function SetSpriteButtonShowPass(btnPath)
	local btn = LuaGo.Find(btnPath)
	if _isShowPass then
		btn.SetSprite("icon_eye_",btn)
		_isShowPass = false
	else		
		btn.SetSprite("icon_eye_1",btn)
		_isShowPass = true
	end
end

function SetActiveInfo()
	if _isActiveInfo then
		_isActiveInfo = false		
	else
		_isActiveInfo = true
	end

	SetActiveInfoObject(_isActiveInfo)
end
  
function SetAppVersion(version)
	local objVersion = LuaGo.Find(_txtVersion)
	objVersion.SetText(version,objVersion)
end

function SetActiveInfoObject(isActive)
	local obj1 = LuaGo.Find(_txtVersion)
	local obj2 = LuaGo.Find(_txtVersionBg)

	obj1.SetActive(isActive)
	obj2.SetActive(isActive)
end

function SetButtonInfo()
	local btn = LuaGo.Find(_versionBtn)
	btn.RegisterButtonPressedCallback(function ()
		SetActiveInfo()	
    end)
end

function Hide()
end
