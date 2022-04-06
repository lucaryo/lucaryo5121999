function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/EventVideo/SubViews/Popup_JoinConcert.prefab",
		Config = ""
    }
end

local _luaClassTicket = "EventVideo/SubViews/ClassTicketView"

local _subviewClassName = "LuaView_ClassTab"

local _contentPath = "ScrollView/Viewport/Content"

local _closePath = "Popup/Button_Close"

function OnReady()
	Initialize()
end

function Initialize()
	SetupClosePopup()
end

function SetupClosePopup()
	local button = LuaGo.Find(_closePath)
	button.RegisterButtonPressedCallback(function ()
		LuaGo.SetActive(false)
	end)
	LuaGo.RegisterButtonPressedCallback(function ()
		LuaGo.SetActive(false)
	end)
end

function Hide()
end
