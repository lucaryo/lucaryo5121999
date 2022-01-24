function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Shop/ShopItemPrefab.prefab",
		Config = "",
		Anchor = "Cam",
		AnchorPreset = "MiddleCenter",
		SizeDelta = "{x: 458, y: 616}"
    }
end

local pathImg ="Item/imgBGVoucher/imgVoucher"
local pathTxtStock ="Item/imgTotalItem/txtTitleTotal"
local pathFillImage = "Item/objLock/imgBar/fillBar"
local pathStar ="Item/imgBGStar/txtStar"
local pathDayExp ="Item/imgEndDay/txtEndDay"
local pathGold="Item/bot/imgBGCoin/txtCoin"
local pathGem ="Item/bot/imgBGGem/txtGem"
local pathTxtAmountLeft ="Item/imgLeft/txtAmountLeft"
local pathImgActive ="Item/imgActive"
local pathTxtTotal = "Item/objLock/imgText/txtTotal"
local pathImgLock = "Item/objLock/imgIconLock"

function OnReady()
	SetupButtonBuyPopupVoucher();
	ShopItem.LuaCall_SetTransform(LuaGo)


end

function SetupButtonBuyPopupVoucher()	
	local btn = LuaGo.Find("Item")
	btn.RegisterButtonPressedCallback(function ()
		ShopItem.LuaCall_BuyConfirm(LuaGo.name)
    end)
	

end

function Refresh()
	local objItem = LuaGo.Find("Item")
		objItem.SetSprite(ShopItem.Model.ImagePathVoucher)
		
	local objImgItem = LuaGo.Find(pathImg)
		objImgItem.SetSprite(ShopItem.Model.ItemEntity.ImagePath)
	
	
	local objGold = LuaGo.Find(pathGold)
		objGold.SetText(ShopItem.Model.ItemEntity.Gold,objGold)

	local objGem = LuaGo.Find(pathGem)
		objGem.SetText(ShopItem.Model.ItemEntity.Gem,objGem)

	local objQuantity = LuaGo.Find(pathTxtAmountLeft)
		objQuantity.SetText(ShopItem.Model.ItemEntity.Total,objQuantity)
end
function SetDataInView(isActive,fillImage,iconLock,total)
	local objFill = LuaGo.Find(pathFillImage)
		objFill.DoFill(fillImage,1)
	local objImgActive = LuaGo.Find(pathImgActive)
		objImgActive.SetActive(isActive)
	local objLock = LuaGo.Find(pathImgLock);
		objLock.SetSprite(iconLock);
	local objTotal = LuaGo.Find(pathTxtTotal)
		objTotal.SetText(total,objTotal)
	

end
function Hide()
end
