
function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Quizziz/QuizzizView.prefab",
		Config = ""
    }
end

local _optionalPanelPath ="PopupGroup/OptionPanel"
local _loadingPanelPath ="PopupGroup/LoadingPanel"

local _openOptionPath = "head/closeBtn"
local _closeOptionPath = "PopupGroup/OptionPanel/OptionPopup/closeOptionBtn"
local _resetBtnPath = "PopupGroup/OptionPanel/OptionPopup/resetBtn"
local _quitBtnPath = "PopupGroup/OptionPanel/OptionPopup/quitBtn"

local _correctPanelPath = "foot/CorrectPanel"
local _wrongPanelPath = "foot/WrongPanel"

local _container = "QuestionContainer"

local _quizzizPagePath = "Quizziz/QuizzizPage"

function OnReady()
	SetupOptionBtn(_openOptionPath, true)
	SetupOptionBtn(_closeOptionPath, false)
	SetupOptionBtn(_optionalPanelPath, false)

	SetupButtonReset(_resetBtnPath)
	SetupButtonQuit(_quitBtnPath)

	Quizziz.LuaCall_CreatePages()
end

function SetupOptionBtn(btnPath, isActive)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		SetActiveOptionPanel(isActive)
    end)
end

function SetupButtonReset(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Quizziz.LuaCall_ResetQuestionOnClick()
		SetActiveOptionPanel(false)
    end)
end

function SetupButtonQuit(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Quizziz.LuaCall_StopPlayOnclick()
    end)
end

function LoadQuizzizPage()
	local content = LuaGo.Find(_container);
	CreateSubView(_quizzizPagePath, content.Transform)
end

function SetActiveOptionPanel(isActive)
	local obj = LuaGo.Find(_optionalPanelPath)
	obj.SetActive(isActive)
	Quizziz.LuaCall_PauseQuizziz(isActive)
end

function SetActiveCorrectAndWrongObject(isActive, isActive2)
	local obj = LuaGo.Find(_correctPanelPath)
	obj.SetActive(isActive)
	local obj2 = LuaGo.Find(_wrongPanelPath)
	obj2.SetActive(isActive2)
end

function SetActiveLoadingPanel(isActive)
	local obj = LuaGo.Find(_loadingPanelPath)
	obj.SetActive(isActive)
end

local _leftPath = "head/questionLeft/text"
local _correctPath = "head/questionCorrect/text"
local _wrongPath = "head/questionWrong/text"

local _finishOptionPath = "PopupGroup/OptionPanel/OptionPopup/pageFinish"
local _scorePath = "PopupGroup/OptionPanel/OptionPopup/sc"

function SetDataQuizziz(left ,correct ,wrong, point, total)
	local obj1 = LuaGo.Find(_leftPath)
	obj1.SetText(left)
	local obj2 = LuaGo.Find(_correctPath)
	obj2.SetText(correct)
	local obj3 = LuaGo.Find(_wrongPath)
	obj3.SetText(wrong)
	local obj4 = LuaGo.Find(_finishOptionPath)
	obj4.SetText(total)

	local obj6 = LuaGo.Find(_scorePath)
	obj6.SetText(point)
end

local _titleTextPath = "head/titleBg/text"

function SetTitle(title)
	local obj = LuaGo.Find(_titleTextPath)
	obj.SetText(title)
end

local _countDownPanel = "PopupGroup/CountDownPanel"
local _countDownObject = "PopupGroup/CountDownPanel/panel"

function SetActiveCountDown(isActive)
	local obj = LuaGo.Find(_countDownPanel)
	obj.SetActive(isActive)

	if (isActive) then
		local obj2 = LuaGo.Find(_countDownObject)
		obj2.AnimationPlay("123GO")
	end
end

local _namePath = "head/bg2/name"

function SetPlayerName(name)
	local obj = LuaGo.Find(_namePath)
	obj.SetText(name)
end

local _nextPanel = "PopupGroup/NextPanel"

function SetActiveNextPanel(isActive)
	local obj = LuaGo.Find(_nextPanel)
	obj.SetActive(isActive)
end

local _scorePathGroup = {
	"foot/Show/pointGroup/object1",
	"foot/Show/pointGroup/object2",
	"foot/Show/pointGroup/object3",
	"foot/Show/pointGroup/object4",
	"foot/Show/pointGroup/object5"
}

local _scoreTextPathGroup = {
	"foot/Show/pointGroup/object1/text",
	"foot/Show/pointGroup/object2/text",
	"foot/Show/pointGroup/object3/text",
	"foot/Show/pointGroup/object4/text",
	"foot/Show/pointGroup/object5/text"
}

local _scoreIconPathGroup = {
	"foot/Show/pointGroup/object1/icon",
	"foot/Show/pointGroup/object2/icon",
	"foot/Show/pointGroup/object3/icon",
	"foot/Show/pointGroup/object4/icon",
	"foot/Show/pointGroup/object5/icon"
}

local _currentScore

function SetActiveGroupScore(index, number)
	local obj = LuaGo.Find(_scorePathGroup[index])
	obj.SetActive(true)

	local obj2 = LuaGo.Find(_scoreTextPathGroup[index])
	obj2.SetText(number)
end

function SetMoveToScore(index)
	for i = 1, #_scoreTextPathGroup do
		local obj = LuaGo.Find(_scoreTextPathGroup[i])
		local text = obj.GetText()

		if text == index then
			_currentScore = LuaGo.Find(_scorePathGroup[i])

			local obj2 = LuaGo.Find(_scoreIconPathGroup[i])
			obj2.SetActive(true)

		else
			local obj3 = LuaGo.Find(_scoreIconPathGroup[i])
			obj3.SetActive(false)
		end		
	end
end

function SetColorScore(color)
	_currentScore.SetImgColor(color)	
end

function ResetScoreGroup(color)
	for i = 1, #_scorePathGroup do
		local obj = LuaGo.Find(_scorePathGroup[i])
		obj.SetImgColor(color)
		obj.SetActive(false)
	end
end

function Hide()
end
