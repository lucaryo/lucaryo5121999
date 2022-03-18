﻿function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/LearningPage/LearningQuestComic.prefab",
		Config = ""
    }
end

local _desImgPath = "DesGroup/desImg"
local _desTxtPath = "DesGroup/desTxt"
local _desGroupPath = "DesGroup"

function OnReady()
	Question.SubViewReady(LuaGo)
end

function SetActiveUI(isActive)
	if isActive then
		Question.LuaCall_SetActiveABGroup(false)
		Question.SetTitleQuestion("LEARN PAGE")
	end

	local obj = LuaGo.Find(_desGroupPath)
	obj.SetActive(isActive)
end

function Hide()
end
