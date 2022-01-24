function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Quizziz/QuizzizPage.prefab",
		Config = ""
    }
end

local _desTxtPath = "DesGroup/desTxt"

local _desPath = "DesGroup"

local _buttonPaths = {
	"DesGroup/AnswerGroup/DesGroup/answerBtnA",
	"DesGroup/AnswerGroup/DesGroup/answerBtnB",
	"DesGroup/AnswerGroup/DesGroup/answerBtnC",
	"DesGroup/AnswerGroup/DesGroup/answerBtnD"
}

local _buttonTextPaths = {
	"DesGroup/AnswerGroup/DesGroup/answerBtnA/Text",
	"DesGroup/AnswerGroup/DesGroup/answerBtnB/Text",
	"DesGroup/AnswerGroup/DesGroup/answerBtnC/Text",
	"DesGroup/AnswerGroup/DesGroup/answerBtnD/Text"
}

function OnReady()
	Quizziz.SubViewReady(LuaGo)
end

function SetDesText(path)
	local obj = LuaGo.Find(_desTxtPath)
	obj.SetText(path)
end

function ClearAllButtonClick()
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.UnregisterButtonPressedCallback()
	end
end

function ClearButtonClick(btnId)
		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.UnregisterButtonPressedCallback()
end

local _correctBtnId

local _turn = 3

function SetupBtnOnclick(btnId, isCorrect)
		if isCorrect then
			_correctBtnId = btnId;
		end

		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.RegisterButtonPressedCallback(function ()
			ChooseAnswer(isCorrect, btnId)
		end)	
end

function ChooseAnswer(isCorrect, btnId)
	if (isCorrect) then
		CorrectAnswerMultipleChoice()
		ClearAllButtonClick()
		Quizziz.LuaCall_SetEndQuizziz()
		Quizziz.LuaCall_IsCorrectAnswer(_turn)
	else
		_turn = _turn - 1
		if(_turn == 0) then
			WrongAnswerMultipleChoiceAll()
			CorrectAnswerMultipleChoice()
			ClearAllButtonClick()
			Quizziz.LuaCall_SetEndQuizziz()
			Quizziz.LuaCall_IsCorrectAnswer(0)
		else
			WrongAnswerMultipleChoice(btnId)
			ClearButtonClick(btnId)
		end
	end

	Quizziz.LuaCall_ColorCurrentScore(_turn)
end

function ShowWhenTimeOut()
	WrongAnswerMultipleChoiceAll()
	CorrectAnswerMultipleChoice()
	ClearAllButtonClick()
	Quizziz.LuaCall_IsCorrectAnswer(0)
	Quizziz.LuaCall_ColorCurrentScore(0)
end

local _correctBtnPath ="button_green_long"
local _wrongBtnPath ="button_red_long"
local _normalBtnPath ="button_blue_long"

function CorrectAnswerMultipleChoice()
		local obj = LuaGo.Find(_buttonPaths[_correctBtnId])
		obj.SetSprite(_correctBtnPath)
		Quizziz.LuaCall_PlaySFXAnswerCorrect()

end

function WrongAnswerMultipleChoice(btnId)
		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.SetSprite(_wrongBtnPath)
		Quizziz.LuaCall_PlaySFXAnswerWrong()

end

function WrongAnswerMultipleChoiceAll()
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.SetSprite(_wrongBtnPath)
	end
end

function ResetButtonsColor()
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.SetSprite(_normalBtnPath)
	end
end
       
function SetupTextForMultipleChoiceButton(btnId, value)
	local obj = LuaGo.Find(_buttonTextPaths[btnId])
	obj.SetText(value)
end

function SetActiveUI(isActive)
	local obj = LuaGo.Find(_desPath)
	obj.SetActive(isActive)
	if isActive then
		local co = coroutine.create(function ()
			Wait(3)
			for i = 1 , #_buttonPaths do 

				Wait(0.25)

				local objImage = LuaGo.Find(_buttonPaths[i])
				objImage.DoFadeImage(1.0, 0.75, objImage)
				objImage.SetButtonEnabled(true)
				local objText = LuaGo.Find(_buttonTextPaths[i])
				objText.DoFadeText(1.0, 0.75, objText)
				
			end
    	end)
		coroutine.resume(co)
	end

end

function ResetData()
	_turn = 3
end

local _timeObjectPath = "DesGroup/clockIcon"

function SetActiveTime(isActive)
	local obj = LuaGo.Find(_timeObjectPath)
	obj.SetActive(isActive)
end

function Hide()
end
