
function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/QuestionView.prefab",
		Config = ""
    }
end

local _nextBtnPath = "foot/nextBtn"
local _backBtnPath = "foot/backBtn"

local _panelCorrectPath = "PopupGroup/CorrectPanel"

local _panelCorrectWordPath = "PopupGroup/CorrectPanel/OptionPopup/wordTxt"
local _panelCorrectMeanPath = "PopupGroup/CorrectPanel/OptionPopup/meanTxt"

local _panelWrongPath = "PopupGroup/WrongPanel"

local _panelWrongWordPath = "PopupGroup/WrongPanel/OptionPopup/wordTxt"
local _panelWrongMeanPath = "PopupGroup/WrongPanel/OptionPopup/meanTxt"

local _panelWrongPath2 = "PopupGroup/WrongPanel2"

local _panelWrongWordPath2 = "PopupGroup/WrongPanel2/OptionPopup/wordTxt"
local _panelWrongMeanPath2 = "PopupGroup/WrongPanel2/OptionPopup/meanTxt"

local _btnAudioPath ="soundBtn"
local _btnInfoPath ="head/InfoBtn"
local _btnNextTransitionPath ="PopupGroup/TransitionScreenPanel/btnNextTransition"
local _btnNextEndScreenPath ="PopupGroup/EndScreenPanel/imgBg/btnNextEndScreen"
local _btnExitEndScreenPath = "PopupGroup/EndScreenPanel/imgBg/btnExitEndScreen"
local _optionalPanelPath ="PopupGroup/OptionPanel"
local _loadingPanelPath ="PopupGroup/LoadingPanel"
local _transitionPanelPath ="PopupGroup/TransitionScreenPanel"
local _endScreenPanelPath ="PopupGroup/EndScreenPanel"
local _txtTopicNameTransitionPath = "PopupGroup/TransitionScreenPanel/imgBg/txtKeyTransition"
local _txtTopicNameEndScreenPath = "PopupGroup/EndScreenPanel/imgBg/IGKeyTransition/txtKeyTransition"

local _openOptionPath = "head/closeBtn"
local _closeOptionPath = "PopupGroup/OptionPanel/OptionPopup/closeOptionBtn"
local _resetBtnPath = "PopupGroup/OptionPanel/OptionPopup/resetBtn"
local _quitBtnPath = "PopupGroup/OptionPanel/OptionPopup/quitBtn"

local _correctPanelPath = "foot/CorrectPanel"
local _wrongPanelPath = "foot/WrongPanel"

local _questionContainer = "QuestionContainer"

local _mainPagePath = {
	"Question/SubViews/QuestionMainPage",
	"Question/SubViews/QuestionMainPage2",
	"Question/SubViews/QuestionMainPage3",
	"Question/SubViews/QuestionMainPage4",
	"Question/SubViews/QuestionMainPageComicWithInputText"
}

local _learningPagePath = {
	"Question/SubViews/QuestionLearningPage",
	"Question/SubViews/QuestionLearningPageAudio",
	"Question/SubViews/QuestionLearningPageComic",
	"Question/SubViews/QuestionLearningPageAudioTextSync",
	"Question/SubViews/QuestionLearningPageSpeedRecognition"
}

local _dragItemPath = "Question/SubViews/DragItem"

local _questions = {
	"Question/SubViews/QuestionAnswerMultipleChoice",
	"Question/SubViews/QuestionAnswerTrueFalse",	
	"Question/SubViews/QuestionAnswerPicture",
	"Question/SubViews/QuestionAnswerFillInText",
	"Question/SubViews/QuestionAnswerDragAndDrop",
	"Question/SubViews/QuestionAnswerComicMCQ",
	"Question/SubViews/QuestionAnswerComicText",
	"Question/SubViews/QuestionAnswerSpeedRecognition",
	"",
	"Question/SubViews/QuizitPage",
	"Question/SubViews/QuestionAnswerMultipleChoicePicture"
}

local _tutorialPath = "PopupGroup/TutorialContainer"

local _popupBalloonPath = "PopupGroup/ResetInputFieldPanel"
local _popupBalloonObjPath = "PopupGroup/ResetInputFieldPanel/ResetPopup"

local _tutorialButtonGroupPath = "PopupGroup/TutorialContainer/QuestionPageTutorial/ButtonGroup/"

local _tutorialButtonPaths ={
	"InfoBtn",
	"closeBtn",
	"tapInfo",
	"tapClose",
	"soundBtn",
	"tapAudio",
	"nextBtn",
	"tapNext"
}
local _imgPointPath ={
	"PopupGroup/EndScreenPanel/imgBg/imgBg2/bg_bar/point1",
	"PopupGroup/EndScreenPanel/imgBg/imgBg2/bg_bar/point2",
	"PopupGroup/EndScreenPanel/imgBg/imgBg2/bg_bar/point3"
}
local _imgEnergyPath={
		"PopupGroup/EndScreenPanel/imgBg/imgBg2/bg_bar/energy1",
		"PopupGroup/EndScreenPanel/imgBg/imgBg2/bg_bar/energy2",
		"PopupGroup/EndScreenPanel/imgBg/imgBg2/bg_bar/energy3"

}
local _txtTexScore ="PopupGroup/EndScreenPanel/imgBg/imgBg2/bg_bar/fillbar/txtScore"
local _txtImgFillScore = "PopupGroup/EndScreenPanel/imgBg/imgBg2/bg_bar/fillbar"
local _txtGemFinal = "PopupGroup/EndScreenPanel/imgBg/objCurrency/Gem/txtGem"
local _txtGoldFinal = "PopupGroup/EndScreenPanel/imgBg/objCurrency/Gold/txtGold"


local _tutorialCloseBtnPath = "PopupGroup/TutorialContainer/QuestionPageTutorial/TutorialCloseBtn"

local _commingSoonBtnPath = "PopupGroup/CommingSoonPanel"

local _commingSoonCloseBtnPath = "PopupGroup/CommingSoonPanel/CommingSoonPopup/quitBtn"

local _pauseBtnPath = "head/QuizitHead/pauseBtn"
local _continuedBtnPath = "PopupGroup/PausePanel/Popup/continuedBtn"
local _resetQuizitPath = "PopupGroup/PausePanel/Popup/resetBtn"
local _quitQuizitPath = "PopupGroup/PausePanel/Popup/quitBtn"

local _pausePanelPath = "PopupGroup/PausePanel"

local _endQuizitResetBtnPath = "PopupGroup/EndPanelQuizit/ButtonGroup/ResetBtn"
local _endQuizitQuitBtnPath = "PopupGroup/EndPanelQuizit/ButtonGroup/QuitBtn"

function OnReady()

	SetupButtonNext(_nextBtnPath)
	SetupButtonNext(_panelCorrectPath)
	SetupButtonNext(_panelWrongPath)

	SetupButtonBack(_backBtnPath)

	SetupOptionBtn(_openOptionPath, true)
	SetupOptionBtn(_closeOptionPath, false)
	SetupOptionBtn(_optionalPanelPath, false)

	SetupButtonReset(_resetBtnPath)
	SetupButtonReset(_resetQuizitPath)
	SetupButtonReset(_endQuizitResetBtnPath)

	SetupButtonQuit(_quitBtnPath)
	SetupButtonQuit(_quitQuizitPath)
	SetupButtonQuit(_commingSoonCloseBtnPath);
	SetupButtonQuit(_endQuizitQuitBtnPath);

	SetupButtonNextTransition(_btnNextTransitionPath)
	SetupButtonNextEndScreen(_btnNextEndScreenPath)
	SetupButtonExitEndScreen(_btnExitEndScreenPath)

	SetupBtnInfo()
	SetupTutorialButtons()

	SetupPauseBtn(_pauseBtnPath, true)
	SetupPauseBtn(_pausePanelPath, false)
	SetupPauseBtn(_continuedBtnPath, false)


	Question.LuaCall_CreatePages()

	SetActiveFalseWrongPanel2()
end

function SetupButtonNext(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Question.LuaCall_NextBtnOnClick()
    end)
end

function SetupButtonBack(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Question.LuaCall_BackBtnOnClick()
    end)
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
		Question.LuaCall_ResetQuestionOnClick()
		SetActiveOptionPanel(false)
		SetActivePausePanel(false)
		SetActiveEndQuizitPanel(false);
    end)
end

function SetupButtonQuit(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Question.LuaCall_StopPlayOnclick()
    end)
end
function SetupButtonNextTransition(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Question.LuaCall_NextTransition();
    end)
end
function SetupButtonNextEndScreen(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Question.LuaCall_NextEndScreen();
    end)
end
function SetupButtonExitEndScreen(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Question.LuaCall_ExitEndScreen();
    end)
end

function LoadQuestionMainPage(type)
	local content = LuaGo.Find(_questionContainer);
	CreateSubView(_mainPagePath[type], content.Transform)
end

function LoadQuestionLearningPage(type)
Log(_learningPagePath[type])
	local content = LuaGo.Find(_questionContainer);
	CreateSubView(_learningPagePath[type], content.Transform)
end

function LoadAnswerObject(type)
	local content = LuaGo.Find(_questionContainer);
	if(_questions[type] != null) then
		CreateSubView(_questions[type], content.Transform)
	end
end

function SetActiveOptionPanel(isActive)
	local obj = LuaGo.Find(_optionalPanelPath)
	obj.SetActive(isActive)
end

function SetActiveCorrectAndWrongObject(isActive, isActive2)
	local obj = LuaGo.Find(_correctPanelPath)
	obj.SetActive(isActive)
	local obj2 = LuaGo.Find(_wrongPanelPath)
	obj2.SetActive(isActive2)
end

function SetActiveAudioBtn(isActive)
	local obj = LuaGo.Find(_btnAudioPath)
	obj.SetActive(isActive)
end

function SetActiveLoadingPanel(isActive)
	local obj = LuaGo.Find(_loadingPanelPath)
	obj.SetActive(isActive)
end

function SetActiveBtnNext(isActive)
	local obj = LuaGo.Find(_nextBtnPath)
	obj.SetActive(isActive)
end

function SetActiveBtnBack(isActive)
	local obj = LuaGo.Find(_backBtnPath)
	obj.SetActive(isActive)
end

function SetupBtnPlayAudio()
	local obj = LuaGo.Find(_btnAudioPath)
	obj.RegisterButtonPressedCallback(function ()
		Question.LuaCall_PlayAudio()
    end)
end

function SetupBtnInfo()
	local obj = LuaGo.Find(_btnInfoPath)
	obj.RegisterButtonPressedCallback(function ()
		local tutor = LuaGo.Find(_tutorialPath)
		tutor.SetActive(true)
    end)
end

function SetActivePopupBalloon(isActive)
	local panel = LuaGo.Find(_popupBalloonPath)
	panel.SetActive(isActive)
	if isActive == true then
		local obj = LuaGo.Find(_popupBalloonObjPath)
		obj.AnimationPlay("PopupBalloon")
	end
end

function ActivePopupBallon()
	local PopupBalloonCo = coroutine.create(function ()
		SetActivePopupBalloon(true)
		Wait(1.25)
		SetActivePopupBalloon(false)
	end)

	coroutine.resume(PopupBalloonCo)
end



function SetupTutorialButtons()
	local obj = LuaGo.Find(_tutorialCloseBtnPath)
	obj.RegisterButtonPressedCallback(function ()
			local tutor = LuaGo.Find(_tutorialPath)
			tutor.SetActive(false)
	end)
	--for i = 1, #_tutorialButtonPaths do

		--local obj = LuaGo.Find(string.format("%s%s",_tutorialButtonGroupPath,_tutorialButtonPaths[i]))
		--obj.RegisterButtonPressedCallback(function ()
			--local tutor = LuaGo.Find(_tutorialPath)
			--tutor.SetActive(false)
		--end)

	--end
end

function SetActiveTransitionPanel(isActive)
	local obj = LuaGo.Find(_transitionPanelPath)
	obj.SetActive(isActive)
end
function SetActiveEndScreenPanel(isActive)
	local obj = LuaGo.Find(_endScreenPanelPath)
	obj.SetActive(isActive)
end

function SetDataTransitionScreen(text)
	local obj = LuaGo.Find(_txtTopicNameTransitionPath)
	obj.SetText(text);
end
function SetDataEndScreen(keyTopic, score, fillAmount,timeDuration, numPoint, imgPathPoint,opacity,gold, gem)

	local textScore = LuaGo.Find(_txtTexScore);
	textScore.SetText(score)

	local imgFill = LuaGo.Find(_txtImgFillScore)
	imgFill.DoFill(fillAmount,timeDuration)

	local objGem = LuaGo.Find(_txtGemFinal)
	objGem.SetText(gem)

	local objGold = LuaGo.Find(_txtGoldFinal)
	objGold.SetText(gold)

	local obj = LuaGo.Find(_txtTopicNameEndScreenPath)
	obj.SetText(keyTopic);

	local co = coroutine.create(function ()
		for i = 1 , numPoint do 
			Wait(0.5)
			local objImgPoint = LuaGo.Find(_imgPointPath[i])
			objImgPoint.SetSprite(imgPathPoint)

			local objEnergyPath = LuaGo.Find(_imgEnergyPath[i])
			objEnergyPath.SetImageOpacity(opacity)
		end
    end)
	coroutine.resume(co)

	

end

function LoadDragItem()
	local content = LuaGo.Find(_questionContainer);
	CreateSubView(_dragItemPath, content.Transform)
end

function OpenCommingSoonPopup()
	local obj = LuaGo.Find(_commingSoonBtnPath)
	obj.SetActive(true)
end

function SetCorrectPanelData(meanTxt)
	--local word = LuaGo.Find(_panelCorrectWordPath)
	--word.SetText(wordTxt)
	local mean = LuaGo.Find(_panelCorrectMeanPath)
	mean.SetText(meanTxt)
	SetActiveCorrectAndWrongPanel(true, false)
end

function SetWrongPanelData( meanTxt)
	--local word = LuaGo.Find(_panelWrongWordPath)
	--word.SetText(wordTxt)
	local mean = LuaGo.Find(_panelWrongMeanPath)
	mean.SetText(meanTxt)
	SetActiveCorrectAndWrongPanel(false, true)
end

function SetActiveCorrectAndWrongPanel(isActive, isActive2)
	local obj = LuaGo.Find(_panelCorrectPath)
	obj.SetActive(isActive)
	local obj2 = LuaGo.Find(_panelWrongPath)
	obj2.SetActive(isActive2)
end

function SetActiveWrongPanel2(isActive)
	local obj2 = LuaGo.Find(_panelWrongPath2)
	obj2.SetActive(isActive)
end

function SetActiveFalseWrongPanel2()
	local obj = LuaGo.Find(_panelWrongPath2)
	obj.RegisterButtonPressedCallback(function ()
		SetActiveWrongPanel2(false)
	end)
end

function SetWrongPanelData2( meanTxt)
	--local word = LuaGo.Find(_panelWrongWordPath2)
	--word.SetText(wordTxt)
	local mean = LuaGo.Find(_panelWrongMeanPath2)
	mean.SetText(meanTxt)
end

local _quiztHeadPath = "head/QuizitHead"
local _quizitFootPath = "foot/QuizitFoot"
local _leftPath = "head/QuizitHead/questionLeft/text"
local _correctPath = "head/QuizitHead/questionCorrect/text"
local _wrongPath = "head/QuizitHead/questionWrong/text"
local _titleTextPath = "head/QuizitHead/titleBg/text"
local _namePath = "head/QuizitHead/bg2/name"

local _finishOptionPath = "PopupGroup/PausePanel/Popup/pageFinish"
local _scorePath = "PopupGroup/PausePanel/Popup/sc"
local _countDownPanel = "PopupGroup/CountDownPanel"
local _countDownObject = "PopupGroup/CountDownPanel/panel"
local _nextPanel = "PopupGroup/NextPanel"
local _endQuizitPanel ="PopupGroup/EndPanelQuizit"
local _endQuizitTitlePath = "PopupGroup/EndPanelQuizit/TileBg/TileTxt"

local _scorePathGroup = {
	"foot/QuizitFoot/pointGroup/object1",
	"foot/QuizitFoot/pointGroup/object2",
	"foot/QuizitFoot/pointGroup/object3",
	"foot/QuizitFoot/pointGroup/object4",
	"foot/QuizitFoot/pointGroup/object5"
}

local _scoreTextPathGroup = {
	"foot/QuizitFoot/pointGroup/object1/text",
	"foot/QuizitFoot/pointGroup/object2/text",
	"foot/QuizitFoot/pointGroup/object3/text",
	"foot/QuizitFoot/pointGroup/object4/text",
	"foot/QuizitFoot/pointGroup/object5/text"
}

local _scoreIconPathGroup = {
	"foot/QuizitFoot/pointGroup/object1/icon",
	"foot/QuizitFoot/pointGroup/object2/icon",
	"foot/QuizitFoot/pointGroup/object3/icon",
	"foot/QuizitFoot/pointGroup/object4/icon",
	"foot/QuizitFoot/pointGroup/object5/icon"
}

function SetActiveQuizitUI(isActive)
	local _quizitHead = LuaGo.Find(_quiztHeadPath)
	_quizitHead.SetActive(isActive)
	local _quizitFoot = LuaGo.Find(_quizitFootPath)
	_quizitFoot.SetActive(isActive)

	local _soundBtn = LuaGo.Find(_btnAudioPath)
	_soundBtn.SetActive(not isActive)
	local _closeBtn = LuaGo.Find(_openOptionPath)
	_closeBtn.SetActive(not isActive)
	local _infoBtn = LuaGo.Find(_btnInfoPath)
	_infoBtn.SetActive(not isActive)
end

function SetupPauseBtn(btnPath, isActive)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		SetActiveOptionPanel(isActive)
    end)
end

function SetActivePausePanel(isActive)
	local obj = LuaGo.Find(_optionalPanelPath)
	obj.SetActive(isActive)
	Question.LuaCall_PauseQuizit(isActive)
end

function SetDataQuizit(left ,correct ,wrong, point, total)
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

function SetTitle(title)
	local obj = LuaGo.Find(_titleTextPath)
	obj.SetText(title)
	local obj2 = LuaGo.Find(_endQuizitTitlePath)
	obj2.SetText(title)
end

function SetActiveCountDown(isActive)
	local obj = LuaGo.Find(_countDownPanel)
	obj.SetActive(isActive)

	if (isActive) then
		local obj2 = LuaGo.Find(_countDownObject)
		obj2.AnimationPlay("123GO")
	end
end

function SetPlayerName(name)
	local obj = LuaGo.Find(_namePath)
	obj.SetText(name)
end

function SetActiveNextPanel(isActive)
	local obj = LuaGo.Find(_nextPanel)
	obj.SetActive(isActive)
end

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

function SetActivePausePanel(isActive)
	local obj = LuaGo.Find(_pausePanelPath)
	obj.SetActive(isActive)
	Question.LuaCall_PauseQuizit(isActive)
end

function SetupPauseBtn(btnPath, isActive)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		SetActivePausePanel(isActive)
    end)
end

function ActiveEndQuizitPanel()
	SetActiveEndQuizitPanel(true)
end

function SetActiveEndQuizitPanel(active)
	local obj = LuaGo.Find(_endQuizitPanel)
	obj.SetActive(active);
end

function Hide()
end
