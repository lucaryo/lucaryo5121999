function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Island/GroupCell.prefab",
		Config = ""
    }
end

local CellPaths ={
    "Cell_1",
    "Cell_2",
    "Cell_3",
    "Cell_4",
    "Cell_5",
    "Cell_6",
    "Cell_7",
    "Cell_8",
    "Cell_9",
    "Cell_10"
}

local CellTextPaths ={
    "Cell_1/Text",
    "Cell_2/Text",
    "Cell_3/Text",
    "Cell_4/Text",
    "Cell_5/Text",
    "Cell_6/Text",
    "Cell_7/Text",
    "Cell_8/Text",
    "Cell_9/Text",
    "Cell_10/Text"
}

local CellCirclePaths ={
    "Cell_1/CircleImg",
    "Cell_2/CircleImg",
    "Cell_3/CircleImg",
    "Cell_4/CircleImg",
    "Cell_5/CircleImg",
    "Cell_6/CircleImg",
    "Cell_7/CircleImg",
    "Cell_8/CircleImg",
    "Cell_9/CircleImg",
    "Cell_10/CircleImg"
}

local CellLockIconPaths ={
    "Cell_1/LockIcon",
    "Cell_2/LockIcon",
    "Cell_3/LockIcon",
    "Cell_4/LockIcon",
    "Cell_5/LockIcon",
    "Cell_6/LockIcon",
    "Cell_7/LockIcon",
    "Cell_8/LockIcon",
    "Cell_9/LockIcon",
    "Cell_10/LockIcon"
}

local CellStarPaths ={
    "Cell_1/Star_",
    "Cell_2/Star_",
    "Cell_3/Star_",
    "Cell_4/Star_",
    "Cell_5/Star_",
    "Cell_6/Star_",
    "Cell_7/Star_",
    "Cell_8/Star_",
    "Cell_9/Star_",
    "Cell_10/Star_"
}

local CellIds ={}

local UnlockSprite = "Unlock_Cell"
local LockSprite = "Lock_Cell"

local UnlockStarSprite = "Unlock_Star"
local LockStarSprite = "Lock_Star"

function OnReady()

end

function SetUpCellId(startId, currentIndex, maxId)
    for i = 1, #CellPaths do
		CellIds[i] = startId + i - 1

        local text = LuaGo.Find(CellTextPaths[i])
        
        local lockIcon = LuaGo.Find(CellLockIconPaths[i])

        local btn = LuaGo.Find(CellPaths[i])

        btn.RegisterButtonPressedCallback(function ()
		    IsLand.LuaCall_JoinCellView(CellIds[i])
        end)

        local obj = LuaGo.Find(CellCirclePaths[i])

        local obj2 = LuaGo.Find(CellPaths[i])

        if CellIds[i] == currentIndex then
            obj.SetActive(true)

            IsLand.LuaCall_MoveToCell(btn)

            lockIcon.SetActive(false)
            text.SetActive(true)
            text.SetText(CellIds[i])
        else
            obj.SetActive(false)

            if CellIds[i] > currentIndex then
                obj2.SetSprite(LockSprite)

                lockIcon.SetActive(true)
                text.SetActive(false)
            else
                obj2.SetSprite(UnlockSprite)

                lockIcon.SetActive(false)
                text.SetActive(true)
                text.SetText(CellIds[i])
            end
        end

        if CellIds[i] > maxId then
            btn.SetActive(false)
        end
    end
end

function SetStarData(star, id)
    for i = 1, star do
        local starImg = LuaGo.Find(string.format("%s%s",CellStarPaths[id] ,i))
        starImg.SetSprite(UnlockStarSprite)
    end
end

function Hide()
end
