function GetConfig ()
	return {
        Bundle = "Assets/Prefabs/ComicInteractive/DragAndDropPage.prefab",
		Config = ""
    }
end

local _imgPath = "DesGroup/Page/comicImg"
local _img = nil

function OnReady()
    Question.SubViewReady(LuaGo)
    _img = LuaGo.Find(_imgPath)
end

function SetImage(imgName)
    _img.SetSprite(imgName)
end

function SetImagePos(x, y, z)
    --_img.SetLocalPosition(x, y, z)
end

function SetImageRot(x, y, z, w)
    --_img.SetLocalRotation(x, y, z, w)
end

function SetImageScale(x, y, z)
    --_img.SetLocalScale(x, y, z)
end

function Hide()
end
