function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/Answers/FillInTextBoxGroup.prefab",
		Config = ""
    }
end

local _desGroupPath = "DesGroup"
local _inputFieldPath ="DesGroup/InputField"
local _keyBoardPath = "DesGroup/keyBoard"
local _checkBtnPath = "DesGroup/CheckBtn"
local _checkTxtPath = "DesGroup/CheckBtn/CheckTxt"

function OnReady()
	Question.SubViewReady(LuaGo)
end

function AddText(text)
	local obj = LuaGo.Find(_inputFieldPath)
	obj.AddText(text)
end

function ClearText()
	local obj = LuaGo.Find(_inputFieldPath)
	obj.ClearText()
end

function SetActiveUI(isActive)
	local obj = LuaGo.Find(_desGroupPath)
	obj.SetActive(isActive)

	if isActive then
		local co = coroutine.create(function ()
			local btnCheck = LuaGo.Find(_checkBtnPath)
			btnCheck.DoFadeImage(1.0,0.76,btnCheck)
			btnCheck.RegisterButtonPressedCallback(function ()
				Question.LuaCall_CheckFinishAction();
			end)
			local checkTxt = LuaGo.Find(_checkTxtPath)
			checkTxt.SetTextDoTweenAnimation("Check", 0.5,checkTxt)
			end)
		coroutine.resume(co)
	end
end

function Hide()
end
