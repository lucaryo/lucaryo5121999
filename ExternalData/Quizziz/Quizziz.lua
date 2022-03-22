
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


function Hide()
end
