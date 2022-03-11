﻿function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/Answers/ComicText.prefab",
		Config = ""
    }
end

local _desImgInputField = "DesGroup/Input"

local _txtInputField = "DesGroup/Input/TextArea/InputField"
local _desImgBg = "DesGroup/GroupAnswer"
local _desTitleImage = "DesGroup/ImageDes"
local _desTxtPath = "DesGroup/ImageDes/des"
local _desGroupPath = "DesGroup"
local _text = nil;
local _btnNextAnswerPath = "DesGroup/GameObject/correct/correct/btn_Next"
local _desPathAnswer ={
	"DesGroup/GroupAnswer/txtGroup1/answer_1",
	"DesGroup/GroupAnswer/txtGroup1/answer_2",
	"DesGroup/GroupAnswer/txtGroup2/answer_3",
	"DesGroup/GroupAnswer/txtGroup2/answer_4"
}

local _txtAnswer = {}

function OnReady()
	Question.SubViewReady(LuaGo)
end

function SetDesText(path)
	--local obj = LuaGo.Find(_desTxtPath)	
	--obj.SetText(path, obj)
	_text = path;
	
end

function SetImgDes(path)
	--local obj = LuaGo.Find(_desImgPath)	
	--obj.SetSprite(path, obj)
end

function  SetAnswerData(index, text)
	_txtAnswer[index+1] = text;
end

function SetInputFieldLimit(charLimit)
	Question.LuaCall_SetSignalForKeyboardInputField(LuaGo.Find(_desImgInputField), charLimit)
end

function SetActiveUI(isActive)
	local obj = LuaGo.Find(_desGroupPath)
	obj.SetActive(isActive)

	if isActive then

		local co = coroutine.create(function ()

			--Wait(3)
			local objTitleDes = LuaGo.Find(_desTitleImage)
			objTitleDes.DoFadeImage(1.0,0.75,objTitleDes)

			local objText = LuaGo.Find(_desTxtPath)
			objText.SetText("")
			objText.SetTextDoTweenAnimation(_text,3.0,objText)

			Wait(3)
			local objBg = LuaGo.Find(_desImgBg)
			objBg.DoFadeImage(1.0, 0.75, objBg)
			for i = 1 , #_desPathAnswer do 
				Wait(0.5)
				local objText = LuaGo.Find(_desPathAnswer[i])
				local textAnswer = _txtAnswer[i]
				objText.SetTextDoTweenAnimation(textAnswer,0.25,objText)
			end
			Wait(0.25)
			local objImgInput = LuaGo.Find(_desImgInputField)
			objImgInput.DoFadeImage(1.0,0.76,objImgInput)
			local objTextInput = LuaGo.Find(_txtInputField)
			objTextInput.SetTextDoTweenAnimation("Text will appear here", 0.5,objTextInput)
			objTextInput.SetTextOpacity(0.2)
			Wait(0.25)
			--local btnCheck = LuaGo.Find(_checkBtnPath)
			--btnCheck.DoFadeImage(1.0,0.76,btnCheck)
			--btnCheck.RegisterButtonPressedCallback(function ()
				--Question.LuaCall_CheckFinishAction();
			--end)
			--local checkTxt = LuaGo.Find(_checkTxtPath)
			--checkTxt.SetTextDoTweenAnimation("Check", 0.5,checkTxt)
		end)
		coroutine.resume(co)
	end
	
end

function Hide()
end
