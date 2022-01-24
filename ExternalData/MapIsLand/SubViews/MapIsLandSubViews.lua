function GetConfig ()
	return {
        Bundle = "Assets/Scripts/Modules/Island/Component/IsLandItemPrefab.prefab",
		Config = "",
		AnchorPreset = "MiddleCenter",
		SizeDelta = "{x: 600, y: 600}"
    }
end

local pathPrefab = "Assets/Scripts/Modules/Island/Component/Cell/CellView.prefab"
local _cellSubViews = "MapIsLand/SubViews/MapIsLandSubViews"
local _index= nil

function OnReady()
	_index = LuaGo.GetSiblingIndex() +1;
	SetupButtonJoinIsland();
end

function SetupButtonJoinIsland()	
	local btn = LuaGo.Find("item/btnJoinIsLand")
	MapIsLand.LuaCall_SetIndex(_index,LuaGo)
	btn.RegisterButtonPressedCallback(function ()
		MapIsLand.LuaCall_JoinIsLandSubView(_index)
    end)
end

function CreateCellSubView(transform)
    CreateSubView(_cellSubViews, transform)
end

function Hide()
end
