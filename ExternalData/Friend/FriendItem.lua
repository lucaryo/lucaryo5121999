function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Friend/FriendItemPrefab.prefab",
		Config = "",
		Anchor = "Cam",
		AnchorPreset = "MiddleCenter",
		SizeDelta = "{x: 458, y: 616}"
    }
end

local _txtIndex = "Item/txtNumber"
local _txtName = "Item/ImageAvata/txtName"
local _pathAvatar = "Item/ImageAvata"

local _objFriend = "Item/ImageAvata/Friend"
local _objFriendInvite ="Item/ImageAvata/FriendInvite"
local _objAddFriend = "Item/ImageAvata/AddFriend"

local _txtOnline = "Item/ImageAvata/Friend/imgOnline/txtOnline"
local _imgOnline = "Item/ImageAvata/Friend/imgOnline"

local _btnAddFriend = "Item/ImageAvata/AddFriend/btnAdd"

local _txtTimeLineInvite = "Item/ImageAvata/FriendInvite/txtTimeInvite"
local _btnAccept = "Item/ImageAvata/FriendInvite/btnAccept"
local _btnDelete = "Item/ImageAvata/FriendInvite/btnDelete"

local _objSentFriend = "Item/ImageAvata/SentFriend"
local _btnCancelRequest = "Item/ImageAvata/SentFriend/btnCancelRequest"
local _btnExtend = "Item/ImageAvata/btnExtend"
local _btnUnfriendConfirm = "Item/ImageAvata/unfriendGroup/btnUnfriend"
local _extendGroup = "Item/ImageAvata/unfriendGroup"

function OnReady()
	SetupButtonAddFriend()
	SetupButtonAcceptInvite()
	SetupButtonDeleteInvite()
	SetupButtonAvatar()


	SetupButtonCancelRequest()
	SetupButtonUnFriend()
	GetImgAvatarPath(_pathAvatar)
	--GetExtendPosition()
end


function SetupButtonAddFriend()	
	local btn = LuaGo.Find(_btnAddFriend)
	btn.RegisterButtonPressedCallback(function ()
		FriendItem.LuaCall_AddFriend()
    end)
end

function SetupButtonAvatar()
	local button = LuaGo.Find(_pathAvatar)
	button.RegisterButtonPressedCallback(function ()
		FriendItem.LuaCall_LoadUserProfile(LuaGo.name)
	end)
end

function SetupButtonExtend()
	local button = LuaGo.Find(_btnExtend)
	button.RegisterButtonPressedCallback(function ()
		FriendItem.LuaCall_OnExtendEnable()
	end)
end

function SetupButtonUnFriend()
	local button = LuaGo.Find(_btnUnfriendConfirm)
	local objAvatar = LuaGo.Find(_pathAvatar)
	button.RegisterButtonPressedCallback(function ()
		FriendItem.LuaCall_OnExtendDisable(objAvatar)
		FriendItem.LuaCall_Unfriend()
	end)
end



function UnRegisterCallBackButtonExtend()
	local btn = LuaGo.Find(_btnExtend)
	btn.UnregisterButtonPressedCallback()
end
function SetupButtonAcceptInvite()
	local btn = LuaGo.Find(_btnAccept)
	btn.RegisterButtonPressedCallback(function ()
		FriendItem.LuaCall_AcceptInviteFriend()
    end)
end

function GetImgAvatarPath(imgPath)
	FriendItem.LuaCall_GetImgAvatarPath(imgPath)
end

function SetupButtonDeleteInvite()
	local btn = LuaGo.Find(_btnDelete)
	btn.RegisterButtonPressedCallback(function ()
		FriendItem.LuaCall_DeleteInviteFriend()
    end)
end
function SetupButtonCancelRequest()
	local btn = LuaGo.Find(_btnCancelRequest)
	btn.RegisterButtonPressedCallback (function  ()
		FriendItem.LuaCall_CancelRequestFriend()
	end)
end
function Refresh()
	UnRegisterCallBackButtonExtend()
	SetupButtonExtend()
	FriendItem.LuaCall_SetTransform(LuaGo)
	local txtIndex = LuaGo.Find(_txtIndex)
	txtIndex.SetText(FriendItem.Model.IndexItem)

	local txtName = LuaGo.Find(_txtName)
	txtName.SetText(FriendItem.Model.ItemEntity.Name)

	local imgAvt = LuaGo.Find(_pathAvatar)
	imgAvt.SetSpriteForImage(FriendItem.Model.ItemEntity.SpriteAvatar)

	local txtOnline = LuaGo.Find(_txtOnline)
	local imgOnline = LuaGo.Find(_imgOnline)
	if FriendItem.Model.ItemEntity.IsOnline 

		then
			txtOnline.SetText("Online")
			imgOnline.SetSprite("icon_online")
		else
			txtOnline.SetText("Offline")
			imgOnline.SetSprite("icon_offline")
		
	end
	local btnSetting = LuaGo.Find(_btnExtend)
	if (FriendItem.Model.IsFriend == true)
		then
			btnSetting.SetActive(true)
		else
			btnSetting.SetActive(false)	
	end

	local extenGroup = LuaGo.Find(_extendGroup)
	extenGroup.SetActive(FriendItem.Model.IsShowUnfriend)

	local txtTimeInvite = LuaGo.Find(_txtTimeLineInvite)
	if(FriendItem.Model.ItemEntity.Date_recieved_invitation != nil) then
		txtTimeInvite.SetTimeByString(FriendItem.Model.ItemEntity.date_recieved_invitation)
	end
	

end


function SetDataInViewFriend()
    local objFriend = LuaGo.Find(_objFriend)
	local objInvite = LuaGo.Find(_objFriendInvite)
	local objAddFriend = LuaGo.Find(_objAddFriend)

	objFriend.SetActive(true)
	objInvite.SetActive(false)
	objAddFriend.SetActive(false)
end
function SetDataInViewInvited()
    local objFriend = LuaGo.Find(_objFriend)
	local objInvite = LuaGo.Find(_objFriendInvite)
	local objAddFriend = LuaGo.Find(_objAddFriend)
	local objSendFriend = LuaGo.Find(_objSentFriend)

	objSendFriend.SetActive(true)
	objFriend.SetActive(false)
	objInvite.SetActive(false)
	objAddFriend.SetActive(false)

	local objAdd = LuaGo.Find(_btnAddFriend)
	objAdd.SetActive(false)
end

function SetDataInViewAddFriend()
    local objFriend = LuaGo.Find(_objFriend)
	local objInvite = LuaGo.Find(_objFriendInvite)
	local objAddFriend = LuaGo.Find(_objAddFriend)
	local objSendFriend = LuaGo.Find(_objSentFriend)

	objSendFriend.SetActive(false)
	objFriend.SetActive(false)
	objInvite.SetActive(false)
	objAddFriend.SetActive(true)

	local objAdd = LuaGo.Find(_btnAddFriend)
	objAdd.SetActive(true)
end
function SetDataInViewReceiveFriend()
	local objFriend = LuaGo.Find(_objFriend)
	local objInvite = LuaGo.Find(_objFriendInvite)
	local objAddFriend = LuaGo.Find(_objAddFriend)
	local objSendFriend = LuaGo.Find(_objSentFriend)

	objSendFriend.SetActive(false)
	objFriend.SetActive(false)
	objInvite.SetActive(true)
	objAddFriend.SetActive(false)
end

function Hide()
end
