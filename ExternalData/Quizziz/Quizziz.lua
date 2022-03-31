
function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Quizziz/QuizzizView.prefab",
		Anchor = "Front",
		Config = ""
    }
end

local _playerNamePath = "head/PlayerAvatar/nameBg/nameTxt"
local _botNamePath = "head/BotAvatar/nameBg/nameTxt"

local _loadingPanelPath ="PopupGroup/LoadingPanel"

local _container = "QuestionContainer"

local _quizzizPagePath = "Quizziz/QuizzizPage"

local _nextPanel = "PopupGroup/NextPanel"

local _countDownPanel = "PopupGroup/CountDownPanel"
local _countDownObject = "PopupGroup/CountDownPanel/panel"

local _endPanelPath = "PopupGroup/EndPanel"
local _endPlayerName ="PopupGroup/EndPanel/head/PlayerAvatar/name"
local _endBotName = "PopupGroup/EndPanel/head/BotAvatar/name"
local _endTitlePath = "PopupGroup/EndPanel/head/Type"
local _endPointpath = "PopupGroup/EndPanel/head/Score"

local _quitBtnPath = "PopupGroup/EndPanel/head/BackBtn"
local _quickBtnPath = "PopupGroup/EndPanel/head/QuickBtn"

local _playerCrowPath = "PopupGroup/EndPanel/head/PlayerAvatar/crow"
local _botCrowPath = "PopupGroup/EndPanel/head/BotAvatar/crow"

local _winPanelPath = "PopupGroup/EndPanel/WinGroup"
local _losePanelPath = "PopupGroup/EndPanel/LoseGroup"
local _rawPanelPath = "PopupGroup/EndPanel/RawGroup"

local _playerHpPath = "head/BattleBg/PlayerRobo/healthBar/hpTxt"
local _botHpPath = "head/BattleBg/BotRobo/healthBar/hpTxt"


function OnReady()
	SetupButtonQuit(_quitBtnPath)
	SetUpButtonQuickPlay(_quickBtnPath)
	QuizitPvp.LuaCall_CreatePages()
end

function SetupButtonQuit(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		QuizitPvp.LuaCall_GoBack()
    end)
end

function LoadQuizzizPage()
	local content = LuaGo.Find(_container);
	CreateSubView(_quizzizPagePath, content.Transform)
end

function SetActiveLoadingPanel(isActive)
	local obj = LuaGo.Find(_loadingPanelPath)
	obj.SetActive(isActive)
end

function SetActiveEndPanel(type)
	local co = coroutine.create(function ()
		Wait(3)

		if(type == 3) then
			ShowWinPanel()
		elseif (type == 2) then
			ShowLosePanel()
		else
			ShowRawPanel()
		end

		local endPanel = LuaGo.Find(_endPanelPath)
		endPanel.SetActive(true)
    end)
	coroutine.resume(co)

end

function ShowWinPanel()
	local winPanel = LuaGo.Find(_winPanelPath)
	winPanel.SetActive(true)

	local crow = LuaGo.Find(_playerCrowPath)
	crow.SetActive(true)
end

function ShowLosePanel()
	local losePanel = LuaGo.Find(_losePanelPath)
	losePanel.SetActive(true)

	local crow = LuaGo.Find(_botCrowPath)
	crow.SetActive(true)
end

function ShowWinPanel()
	local winPanel = LuaGo.Find(_winPanelPath)
	winPanel.SetActive(true)

	local crow = LuaGo.Find(_playerCrowPath)
	crow.SetActive(true)
end

function ShowRawPanel()
	local rawPanel = LuaGo.Find(_rawPanelPath)
	rawPanel.SetActive(true)
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
	local obj = LuaGo.Find(_playerNamePath)
	obj.SetText(name)

	local obj2 = LuaGo.Find(_endPlayerName)
	obj2.SetText(name)
end

function SetBotName(name)
	local obj = LuaGo.Find(_botNamePath)
	obj.SetText(name)

	local obj2 = LuaGo.Find(_endBotName)
	obj2.SetText(name)
end

function SetActiveNextPanel(isActive)
	local obj = LuaGo.Find(_nextPanel)
	obj.SetActive(isActive)
end

function UpdateHp()
	local playerHpTxt = LuaGo.Find(_playerHpPath)
	playerHpTxt.SetText(QuizitPvp.Model.PlayerHp)

	local botHpTxt = LuaGo.Find(_botHpPath)
	botHpTxt.SetText(QuizitPvp.Model.BotHp)
end

function SetUpButtonQuickPlay(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		QuizitPvp.LuaCall_QuickPlay()
    end)
end

function Hide()
end
