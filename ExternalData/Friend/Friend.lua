


function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Friend/Friend.prefab",
		Config = "",
		Anchor = "Root",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end
local _pathFriendTab ="Bg/body/ToggleGroup/FriendToggle"
local _pathFriendInviteTab ="Bg/body/ToggleGroup/PendingInviteToggle"
local _pathAddFriendTab = "Bg/body/ToggleGroup/AddFriendToggle"
local _pathScrollFriendTab ="Bg/body/objScrollFriend"
local _pathScrollFriendInviteTab= "Bg/body/objScrollPendingInvite"
local _pathObjAddFriend ="Bg/body/objScrollAddFriend"
local _txtTextTabFriend = "Bg/body/ToggleGroup/FriendToggle/Label"
local _txtTextTabInvite ="Bg/body/ToggleGroup/PendingInviteToggle/Label"
local _txtTextTabAdd = "Bg/body/ToggleGroup/AddFriendToggle/Label"

local _btnBackLobbyPath = "Bg/header/imgButton/btnBack"


function OnReady()
	SetupButtonBackLobby(_btnBackLobbyPath)
	SetupToggFriendTab()
	SetupToggInviteFriendTab()
	SetupToggAddFriendTab()
end
function SetupButtonBackLobby(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		Friend.LuaCall_BackLobby()
    end)
end
function SetupToggFriendTab()
	local objToggle = LuaGo.Find(_pathFriendTab)
	local _pathScrollFriend = LuaGo.Find(_pathScrollFriendTab)
	local objText = LuaGo.Find(_txtTextTabFriend)
	objToggle.OnEventToggleChange(function (boolValue) 
		_pathScrollFriend.SetActive(boolValue)
		if(boolValue)
			then
				objText.SetTextHexColor("#FFFFFF")
			else
				objText.SetTextHexColor("#8C8A8A")
		end
		
	end)
end
function SetupToggInviteFriendTab()
	local objToggle = LuaGo.Find(_pathFriendInviteTab)
	local _pathScrollInviteFriend = LuaGo.Find(_pathScrollFriendInviteTab)
	local objText = LuaGo.Find(_txtTextTabInvite)
	objToggle.OnEventToggleChange(function (boolValue) 
		_pathScrollInviteFriend.SetActive(boolValue)
		if(boolValue)
			then
				objText.SetTextHexColor("#FFFFFF")
			else
				objText.SetTextHexColor("#8C8A8A")
		end
		
	end)
end
function SetupToggAddFriendTab()
	local objToggle = LuaGo.Find(_pathAddFriendTab)
	local _pathAddFriend = LuaGo.Find(_pathObjAddFriend)
	local objText = LuaGo.Find(_txtTextTabAdd)
	objToggle.OnEventToggleChange(function (boolValue) 
		_pathAddFriend.SetActive(boolValue)
		if(boolValue)
			then
				objText.SetTextHexColor("#FFFFFF")
			else
				objText.SetTextHexColor("#8C8A8A")
		end
		
	end)
end

function Hide()
end
