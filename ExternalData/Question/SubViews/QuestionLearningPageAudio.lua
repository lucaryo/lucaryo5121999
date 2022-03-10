function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/LearningPage/LearningQuest Audio.prefab",
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
		Question.SetTitleQuestion("LEARN PAGE")
	then
	local obj = LuaGo.Find(_desGroupPath)
	obj.SetActive(isActive)
end

function Hide()
end
