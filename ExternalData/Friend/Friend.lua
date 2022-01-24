


function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Friend/Friend.prefab",
		Config = "",
		Anchor = "Cam",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end

local _btnBackLobbyPath = "btnBack"


function OnReady()
	SetupButtonBackLobby(_btnBackLobbyPath)
end
function SetupButtonBackLobby(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		Friend.LuaCall_BackLobby()
    end)
end

function Hide()
end
