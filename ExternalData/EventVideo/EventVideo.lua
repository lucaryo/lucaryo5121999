function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/EventVideo/EventVideo.prefab",
		Config = "",
		Anchor = "Front",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end

--LuaSubviews--
local _classSubview = ""
--------

local _toggleClassTabPath = "Tabs/Toggle_Class"
local _toggleConcertTabPath = "Tabs/Toggle_Concert"

function OnReady()
	SetupToggleClass()
end

function SetupClassTab()
	CreateSubView()
end

function SetupConcertTab()
end

function SetupToggleClass()
	local toggle = LuaGo.Find(_toggleClassTabPath)
	toggle.OnEventToggleChange(function(isActive)
		if(isActive) then
			
		else
		end
	end)
end

function SetupToggleConcert()
end

function Hide()
end
