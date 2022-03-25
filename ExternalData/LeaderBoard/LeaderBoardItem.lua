function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/LeaderBoard/LeaderBoardItemPrefab.prefab",
		Config = "",
		Anchor = "Cam",
		AnchorPreset = "MiddleCenter",
		SizeDelta = "{x: 1028, y: 171}"
    }
end

local _txtIndex = "Item/txtNumber"
local _txtName = "Item/txtName"
local _pathAvatar = "Item/fram/mask/ImageAvata"
local _pathScore = "Item/txtScore"
local _pathImageItem = "Item"



function OnReady()


end

function Refresh()
	LeaderBoardItem.LuaCall_SetTransform(LuaGo)
    local obj = LuaGo
    obj.SetActive(LeaderBoardItem.Model.IsActive)
	local imageItem = LuaGo.Find(_pathImageItem)
	imageItem.SetSprite(LeaderBoardItem.Model.ImageItem)
	
	local txtIndex = LuaGo.Find(_txtIndex)
	txtIndex.SetText(LeaderBoardItem.Model.ItemEntity.Rank)

	local txtName = LuaGo.Find(_txtName)
	txtName.SetText(LeaderBoardItem.Model.ItemEntity.Name)

	local imgAvt = LuaGo.Find(_pathAvatar)
	imgAvt.SetSprite(LeaderBoardItem.Model.ItemEntity.Icon)

	local txtScore = LuaGo.Find(_pathScore)
	txtScore.SetText(LeaderBoardItem.Model.ItemEntity.Score)

end
function Hide()
end
