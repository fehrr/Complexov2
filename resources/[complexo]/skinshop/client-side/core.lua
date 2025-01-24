-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("skinshop",cRP)
vSERVER = Tunnel.getInterface("skinshop")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local cam = -1
local skinData = {}
local animation = false
local previousSkinData = {}
local creatingCharacter = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- SKINDATA
-----------------------------------------------------------------------------------------------------------------------------------------
local skinData = {
	["pants"] = { item = 0, texture = 0 },
	["arms"] = { item = 0, texture = 0 },
	["tshirt"] = { item = 1, texture = 0 },
	["torso"] = { item = 0, texture = 0 },
	["vest"] = { item = 0, texture = 0 },
	["shoes"] = { item = 0, texture = 0 },
	["mask"] = { item = 0, texture = 0 },
	["backpack"] = { item = 0, texture = 0 },
	["hat"] = { item = -1, texture = 0 },
	["glass"] = { item = 0, texture = 0 },
	["ear"] = { item = -1, texture = 0 },
	["watch"] = { item = -1, texture = 0 },
	["bracelet"] = { item = -1, texture = 0 },
	["accessory"] = { item = 0, texture = 0 },
	["decals"] = { item = 0, texture = 0 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SKINSHOP:APPLY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:apply")
AddEventHandler("skinshop:apply",function(status)
	if status["pants"] ~= nil then
		skinData = status
	end

	resetClothing(skinData)
	vSERVER.updateClothes(skinData)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("updateRoupas")
AddEventHandler("updateRoupas",function(custom)
	skinData = custom
	resetClothing(custom)
	vSERVER.updateClothes(custom)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATETATTOO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:updateTattoo")
AddEventHandler("skinshop:updateTattoo",function()
	resetClothing(skinData)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SKINSHOPS
-----------------------------------------------------------------------------------------------------------------------------------------
local Skinshops = {
	{ -1124.28,-1442.92,5.22 },
	{ 75.38,-1393.0,29.37 },
	{ 75.34,-1392.93,29.37 },
	{ -709.96,-152.72,37.41 },
	{ -163.47,-302.94,39.73 },
	{ -822.52,-1073.64,11.32 },
	{ -1193.18,-768.03,17.32 },
	{ -1450.24,-237.46,49.81 },
	{ 4.92,6512.47,31.88 },
	{ 1693.92,4822.95,42.06 },
	{ 125.9,-223.49,54.56 },
	{ 614.33,2762.5,42.09 },
	{ 1196.72,2710.22,38.22 },
	{ -3170.37,1044.18,20.86 },
	{ -1101.53,2710.54,19.11 },
	{ 425.6,-806.18,29.49 },
	{ 1210.61,-1474.0,34.85 }, -- Bombeiros
	{ -1181.86,-900.55,13.99 }, -- BurgerShot
	{ 461.46,-998.05,31.19 }, -- Departamento LSPD
	{ 387.29,799.17,187.45 }, -- Departamento Ranger
	{ 1841.13,3679.86,34.19 }, -- Departamento Sheriff
	{ -437.49,6009.62,36.99 }, -- Departamento Sheriff
	{ 361.77,-1593.19,25.9 }, -- Departamento State
	{ -586.89,-1049.92,22.34 }, -- Uwu Café
	{ -824.49,-1239.46,7.33 }, -- Hospital Sul
	{ -826.53,-1237.49,7.33 }, -- Hospital Sul 2
	{ -256.56,6327.32,32.42 }, -- Hospital Norte
	{ 909.14,-2056.76,34.88 }, -- Mecânica Sul
	{ 550.21,-182.36,54.49 }, -- Mecânica Sul
	{ 810.31,-760.23,31.26 } -- Pizza This
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHOVERFY
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local innerTable = {}
	for k,v in pairs(Skinshops) do
		table.insert(innerTable,{ v[1],v[2],v[3],2,"E","Loja de Roupas","Pressione para abrir" })
	end

	TriggerEvent("hoverfy:Insert",innerTable)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	SetNuiFocus(false,false)

	while true do
		local timeDistance = 999
		if LocalPlayer["state"]["Route"] < 900000 then
			local ped = PlayerPedId()
			if not IsPedInAnyVehicle(ped) and not creatingCharacter then
				local coords = GetEntityCoords(ped)

				for k,v in pairs(Skinshops) do
					local distance = #(coords - vec3(v[1],v[2],v[3]))
					if distance <= 2 then
						timeDistance = 1

						if IsControlJustPressed(0,38) and vSERVER.checkShares() then
							openMenu({
								{ menu = "character", label = "Roupas", selected = true },
								{ menu = "accessoires", label = "Utilidades", selected = false }
							})
						end
					end
				end
			end
		end

		Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SKINSHOP:OPENSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:openShop")
AddEventHandler("skinshop:openShop",function()
	TriggerEvent("dynamic:closeSystem")

	if not creatingCharacter and vSERVER.checkShares() then
		openMenu({
			{ menu = "character", label = "Roupas", selected = true },
			{ menu = "accessoires", label = "Utilidades", selected = false }
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESETOUTFIT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("resetOutfit",function()
	resetClothing(json.decode(previousSkinData))
	skinData = json.decode(previousSkinData)
	previousSkinData = {}
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATERIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("rotateRight",function()
	local ped = PlayerPedId()
	local heading = GetEntityHeading(ped)
	SetEntityHeading(ped,heading + 30)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATELEFT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("rotateLeft",function()
	local ped = PlayerPedId()
	local heading = GetEntityHeading(ped)
	SetEntityHeading(ped,heading - 30)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOTHINGCATEGORYS
-----------------------------------------------------------------------------------------------------------------------------------------
local clothingCategorys = {
	["arms"] = { type = "variation", id = 3 },
	["backpack"] = { type = "variation", id = 5 },
	["tshirt"] = { type = "variation", id = 8 },
	["torso"] = { type = "variation", id = 11 },
	["pants"] = { type = "variation", id = 4 },
	["vest"] = { type = "variation", id = 9 },
	["shoes"] = { type = "variation", id = 6 },
	["mask"] = { type = "variation", id = 1 },
	["hat"] = { type = "prop", id = 0 },
	["glass"] = { type = "prop", id = 1 },
	["ear"] = { type = "prop", id = 2 },
	["watch"] = { type = "prop", id = 6 },
	["bracelet"] = { type = "prop", id = 7 },
	["accessory"] = { type = "variation", id = 7 },
	["decals"] = { type = "variation", id = 10 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETMAXVALUES
-----------------------------------------------------------------------------------------------------------------------------------------
function GetMaxValues()
	maxModelValues = {
		["backpack"] = { type = "character", item = 0, texture = 0 },
		["arms"] = { type = "character", item = 0, texture = 0 },
		["tshirt"] = { type = "character", item = 0, texture = 0 },
		["torso"] = { type = "character", item = 0, texture = 0 },
		["pants"] = { type = "character", item = 0, texture = 0 },
		["shoes"] = { type = "character", item = 0, texture = 0 },
		["vest"] = { type = "character", item = 0, texture = 0 },
		["accessory"] = { type = "character", item = 0, texture = 0 },
		["decals"] = { type = "character", item = 0, texture = 0 },
		["mask"] = { type = "accessoires", item = 0, texture = 0 },
		["hat"] = { type = "accessoires", item = 0, texture = 0 },
		["glass"] = { type = "accessoires", item = 0, texture = 0 },
		["ear"] = { type = "accessoires", item = 0, texture = 0 },
		["watch"] = { type = "accessoires", item = 0, texture = 0 },
		["bracelet"] = { type = "accessoires", item = 0, texture = 0 }
	}

	local ped = PlayerPedId()
	for k,v in pairs(clothingCategorys) do
		if v["type"] == "variation" then
			maxModelValues[k]["item"] = GetNumberOfPedDrawableVariations(ped,v["id"]) - 1
			maxModelValues[k]["texture"] = GetNumberOfPedTextureVariations(ped,v["id"],GetPedDrawableVariation(ped,v["id"])) - 1

			if maxModelValues[k]["texture"] <= 0 then
				maxModelValues[k]["texture"] = 0
			end
		end

		if v["type"] == "prop" then
			maxModelValues[k]["item"] = GetNumberOfPedPropDrawableVariations(ped,v["id"]) - 1
			maxModelValues[k]["texture"] = GetNumberOfPedPropTextureVariations(ped,v["id"],GetPedPropIndex(ped,v["id"])) - 1

			if maxModelValues[k]["texture"] <= 0 then
				maxModelValues[k]["texture"] = 0
			end
		end
	end

	SendNUIMessage({ action = "updateMax", maxValues = maxModelValues })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENMENU
-----------------------------------------------------------------------------------------------------------------------------------------
function openMenu(allowedMenus)
	creatingCharacter = true
	previousSkinData = json.encode(skinData)

	GetMaxValues()

	SendNUIMessage({ action = "open", menus = allowedMenus, currentClothing = skinData })

	SetNuiFocus(true,true)
	SetCursorLocation(0.9,0.25)

	enableCam()
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENABLECAM
-----------------------------------------------------------------------------------------------------------------------------------------
function enableCam()
	local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0,2.0,0)
	RenderScriptCams(false,false,0,1,0)
	DestroyCam(cam,false)

	if not DoesCamExist(cam) then
		cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",true)
		SetCamActive(cam,true)
		RenderScriptCams(true,false,0,true,true)
		SetCamCoord(cam,coords["x"],coords["y"],coords["z"] + 0.5)
		SetCamRot(cam,0.0,0.0,GetEntityHeading(PlayerPedId()) + 180)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATECAM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("rotateCam",function(data)
	local ped = PlayerPedId()
	local rotType = data["type"]
	local coords = GetOffsetFromEntityInWorldCoords(ped,0,2.0,0)

	if rotType == "left" then
		SetEntityHeading(ped,GetEntityHeading(ped) - 10)
		SetCamCoord(cam,coords["x"],coords["y"],coords["z"] + 0.5)
		SetCamRot(cam,0.0,0.0,GetEntityHeading(ped) + 180)
	else
		SetEntityHeading(ped,GetEntityHeading(ped) + 10)
		SetCamCoord(cam,coords["x"],coords["y"],coords["z"] + 0.5)
		SetCamRot(cam,0.0,0.0,GetEntityHeading(ped) + 180)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETUPCAM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("setupCam",function(data)
	local value = data["value"]

	if value == 1 then
		local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0,0.75,0)
		SetCamCoord(cam,coords["x"],coords["y"],coords["z"] + 0.6)
	elseif value == 2 then
		local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0,1.0,0)
		SetCamCoord(cam,coords["x"],coords["y"],coords["z"] + 0.2)
	elseif value == 3 then
		local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0,1.0,0)
		SetCamCoord(cam,coords["x"],coords["y"],coords["z"] - 0.5)
	else
		local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0,2.0,0)
		SetCamCoord(cam,coords["x"],coords["y"],coords["z"] + 0.5)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSEMENU
-----------------------------------------------------------------------------------------------------------------------------------------
function closeMenu()
	SendNUIMessage({ action = "close" })
	RenderScriptCams(false,true,250,1,0)
	DestroyCam(cam,false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESETCLOTHING
-----------------------------------------------------------------------------------------------------------------------------------------
function resetClothing(data)
	local ped = PlayerPedId()

	if data["backpack"] == nil then
		data["backpack"] = {}
		data["backpack"]["item"] = 0
		data["backpack"]["texture"] = 0
	end

	SetPedComponentVariation(ped,4,data["pants"]["item"],data["pants"]["texture"],1)
	SetPedComponentVariation(ped,3,data["arms"]["item"],data["arms"]["texture"],1)
	SetPedComponentVariation(ped,5,data["backpack"]["item"],data["backpack"]["texture"],1)
	SetPedComponentVariation(ped,8,data["tshirt"]["item"],data["tshirt"]["texture"],1)
	SetPedComponentVariation(ped,9,data["vest"]["item"],data["vest"]["texture"],1)
	SetPedComponentVariation(ped,11,data["torso"]["item"],data["torso"]["texture"],1)
	SetPedComponentVariation(ped,6,data["shoes"]["item"],data["shoes"]["texture"],1)
	SetPedComponentVariation(ped,1,data["mask"]["item"],data["mask"]["texture"],1)
	SetPedComponentVariation(ped,10,data["decals"]["item"],data["decals"]["texture"],1)
	SetPedComponentVariation(ped,7,data["accessory"]["item"],data["accessory"]["texture"],1)

	if data["hat"]["item"] ~= -1 and data["hat"]["item"] ~= 0 then
		SetPedPropIndex(ped,0,data["hat"]["item"],data["hat"]["texture"],1)
	else
		ClearPedProp(ped,0)
	end

	if data["glass"]["item"] ~= -1 and data["glass"]["item"] ~= 0 then
		SetPedPropIndex(ped,1,data["glass"]["item"],data["glass"]["texture"],1)
	else
		ClearPedProp(ped,1)
	end

	if data["ear"]["item"] ~= -1 and data["ear"]["item"] ~= 0 then
		SetPedPropIndex(ped,2,data["ear"]["item"],data["ear"]["texture"],1)
	else
		ClearPedProp(ped,2)
	end

	if data["watch"]["item"] ~= -1 and data["watch"]["item"] ~= 0 then
		SetPedPropIndex(ped,6,data["watch"]["item"],data["watch"]["texture"],1)
	else
		ClearPedProp(ped,6)
	end

	if data["bracelet"]["item"] ~= -1 and data["bracelet"]["item"] ~= 0 then
		SetPedPropIndex(ped,7,data["bracelet"]["item"],data["bracelet"]["texture"],1)
	else
		ClearPedProp(ped,7)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function()
	RenderScriptCams(false,true,250,1,0)
	creatingCharacter = false
	SetNuiFocus(false,false)
	DestroyCam(cam,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESKIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSkin",function(data)
	ChangeVariation(data)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESKINONINPUT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSkinOnInput",function(data)
	ChangeVariation(data)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHANGEVARIATION
-----------------------------------------------------------------------------------------------------------------------------------------
function ChangeVariation(data)
	local ped = PlayerPedId()
	local types = data["type"]
	local item = data["articleNumber"]
	local category = data["clothingType"]

	if category == "pants" then
		if types == "item" then
			SetPedComponentVariation(ped,4,item,0,1)
			skinData["pants"]["item"] = item
		elseif types == "texture" then
			SetPedComponentVariation(ped,4,GetPedDrawableVariation(ped,4),item,1)
			skinData["pants"]["texture"] = item
		end
	elseif category == "arms" then
		if types == "item" then
			SetPedComponentVariation(ped,3,item,0,1)
			skinData["arms"]["item"] = item
		elseif types == "texture" then
			SetPedComponentVariation(ped,3,GetPedDrawableVariation(ped,3),item,1)
			skinData["arms"]["texture"] = item
		end
	elseif category == "tshirt" then
		if types == "item" then
			SetPedComponentVariation(ped,8,item,0,1)
			skinData["tshirt"]["item"] = item
		elseif types == "texture" then
			SetPedComponentVariation(ped,8,GetPedDrawableVariation(ped,8),item,1)
			skinData["tshirt"]["texture"] = item
		end
	elseif category == "vest" then
		if types == "item" then
			SetPedComponentVariation(ped,9,item,0,1)
			skinData["vest"]["item"] = item
		elseif types == "texture" then
			SetPedComponentVariation(ped,9,skinData["vest"]["item"],item,1)
			skinData["vest"]["texture"] = item
		end
	elseif category == "decals" then
		if types == "item" then
			SetPedComponentVariation(ped,10,item,0,1)
			skinData["decals"]["item"] = item
		elseif types == "texture" then
			SetPedComponentVariation(ped,10,skinData["decals"]["item"],item,1)
			skinData["decals"]["texture"] = item
		end
	elseif category == "accessory" then
		if types == "item" then
			SetPedComponentVariation(ped,7,item,0,1)
			skinData["accessory"]["item"] = item
		elseif types == "texture" then
			SetPedComponentVariation(ped,7,skinData["accessory"]["item"],item,1)
			skinData["accessory"]["texture"] = item
		end
	elseif category == "torso" then
		if types == "item" then
			SetPedComponentVariation(ped,11,item,0,1)
			skinData["torso"]["item"] = item
		elseif types == "texture" then
			SetPedComponentVariation(ped,11,GetPedDrawableVariation(ped,11),item,1)
			skinData["torso"]["texture"] = item
		end
	elseif category == "shoes" then
		if types == "item" then
			SetPedComponentVariation(ped,6,item,0,1)
			skinData["shoes"]["item"] = item
		elseif types == "texture" then
			SetPedComponentVariation(ped,6,GetPedDrawableVariation(ped,6),item,1)
			skinData["shoes"]["texture"] = item
		end
	elseif category == "mask" then
		if types == "item" then
			SetPedComponentVariation(ped,1,item,0,1)
			skinData["mask"]["item"] = item
		elseif types == "texture" then
			SetPedComponentVariation(ped,1,GetPedDrawableVariation(ped,1),item,1)
			skinData["mask"]["texture"] = item
		end
	elseif category == "hat" then
		if types == "item" then
			if item ~= -1 then
				SetPedPropIndex(ped,0,item,skinData["hat"]["texture"],1)
			else
				ClearPedProp(ped,0)
			end

			skinData["hat"]["item"] = item
		elseif types == "texture" then
			SetPedPropIndex(ped,0,skinData["hat"]["item"],item,1)
			skinData["hat"]["texture"] = item
		end
	elseif category == "glass" then
		if types == "item" then
			if item ~= -1 then
				SetPedPropIndex(ped,1,item,skinData["glass"]["texture"],1)
				skinData["glass"]["item"] = item
			else
				ClearPedProp(ped,1)
			end
		elseif types == "texture" then
			SetPedPropIndex(ped,1,skinData["glass"]["item"],item,1)
			skinData["glass"]["texture"] = item
		end
	elseif category == "ear" then
		if types == "item" then
			if item ~= -1 then
				SetPedPropIndex(ped,2,item,skinData["ear"]["texture"],1)
			else
				ClearPedProp(ped,2)
			end

			skinData["ear"]["item"] = item
		elseif types == "texture" then
			SetPedPropIndex(ped,2,skinData["ear"]["item"],item,1)
			skinData["ear"]["texture"] = item
		end
	elseif category == "watch" then
		if types == "item" then
			if item ~= -1 then
				SetPedPropIndex(ped,6,item,skinData["watch"]["texture"],1)
			else
				ClearPedProp(ped,6)
			end

			skinData["watch"]["item"] = item
		elseif types == "texture" then
			SetPedPropIndex(ped,6,skinData["watch"]["item"],item,1)
			skinData["watch"]["texture"] = item
		end
	elseif category == "bracelet" then
		if types == "item" then
			if item ~= -1 then
				SetPedPropIndex(ped,7,item,skinData["bracelet"]["texture"],1)
			else
				ClearPedProp(ped,7)
			end

			skinData["bracelet"]["item"] = item
		elseif types == "texture" then
			SetPedPropIndex(ped,7,skinData["bracelet"]["item"],item,1)
			skinData["bracelet"]["texture"] = item
		end
	end

	GetMaxValues()
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVECLOTHING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("saveClothing",function()
	vSERVER.updateClothes(skinData)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETMASK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setMask")
AddEventHandler("skinshop:setMask",function()
	if not animation and not LocalPlayer["state"]["Buttons"] then
		animation = true
		vRP.playAnim(true,{"missfbi4","takeoff_mask"},true)
		Wait(1000)

		local ped = PlayerPedId()

		if GetPedDrawableVariation(ped,1) == skinData["mask"]["item"] then
			SetPedComponentVariation(ped,1,0,0,1)
		else
			SetPedComponentVariation(ped,1,skinData["mask"]["item"],skinData["mask"]["texture"],1)
		end

		vRP.removeObjects()
		animation = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETHAT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setHat")
AddEventHandler("skinshop:setHat",function()
	if not animation and not LocalPlayer["state"]["Buttons"] then
		animation = true
		vRP.playAnim(true,{"mp_masks@standard_car@ds@","put_on_mask"},true)
		Wait(1000)

		local ped = PlayerPedId()

		if GetPedPropIndex(ped,0) == skinData["hat"]["item"] then
			ClearPedProp(ped,0)
		else
			SetPedPropIndex(ped,0,skinData["hat"]["item"],skinData["hat"]["texture"],1)
		end

		vRP.removeObjects()
		animation = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETGLASSES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setGlasses")
AddEventHandler("skinshop:setGlasses",function()
	if not animation and not LocalPlayer["state"]["Buttons"] then
		animation = true
		vRP.playAnim(true,{"clothingspecs","take_off"},true)
		Wait(1000)

		local ped = PlayerPedId()

		if GetPedPropIndex(ped,1) == skinData["glass"]["item"] then
			ClearPedProp(ped,1)
		else
			SetPedPropIndex(ped,1,skinData["glass"]["item"],skinData["glass"]["texture"],1)
		end

		vRP.removeObjects()
		animation = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKSHOES
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkShoes()
	local Number = 34
	local Ped = PlayerPedId()
	if GetEntityModel(Ped) == GetHashKey("mp_f_freemode_01") then
		Number = 35
	end
	
	if skinData["shoes"]["item"] >= 0 then
		if skinData["shoes"]["item"] ~= Number then
			skinData["shoes"]["item"] = Number
			skinData["shoes"]["texture"] = 0
			SetPedComponentVariation(Ped,6,skinData["shoes"]["item"],skinData["shoes"]["texture"],1)

			return true
		end
	else
		return false
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETSHIRT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setShirt")
AddEventHandler("skinshop:setShirt",function()
	if not animation then
		animation = true
		vRP.playAnim(true,{"clothingtie","try_tie_negative_a"},true)
		Citizen.Wait(1000)

		local ped = PlayerPedId()

		if GetPedDrawableVariation(ped,8) == skinData["tshirt"]["item"] then
			SetPedComponentVariation(ped,8,15,0,1)
			SetPedComponentVariation(ped,3,15,0,1)
		else
			SetPedComponentVariation(ped,8,skinData["tshirt"]["item"],skinData["tshirt"]["texture"],1)
		end

		vRP.removeObjects()
		animation = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETJACKET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setJacket")
AddEventHandler("skinshop:setJacket",function()
	if not animation then
		animation = true
		vRP.playAnim(true,{"clothingtie","try_tie_negative_a"},true)
		Citizen.Wait(1000)

		local ped = PlayerPedId()

		if GetPedDrawableVariation(ped,11) == skinData["torso"]["item"] then
			SetPedComponentVariation(ped,11,15,0,1)
			SetPedComponentVariation(ped,3,15,0,1)
		else
			SetPedComponentVariation(ped,11,skinData["torso"]["item"],skinData["torso"]["texture"],1)
		end

		vRP.removeObjects()
		animation = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETARMS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setArms")
AddEventHandler("skinshop:setArms",function()
	if not animation then
		animation = true
		vRP.playAnim(true,{"clothingtie","try_tie_negative_a"},true)
		Citizen.Wait(1000)

		local ped = PlayerPedId()

		if GetPedDrawableVariation(ped,3) == skinData["arms"]["item"] then
			SetPedComponentVariation(ped,3,15,0,1)
		else
			SetPedComponentVariation(ped,3,skinData["arms"]["item"],skinData["arms"]["texture"],1)
		end

		vRP.removeObjects()
		animation = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOGGLEBACKPACK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:toggleBackpack")
AddEventHandler("skinshop:toggleBackpack",function(Infos)
	local splitName = splitString(Infos,"-")
	local Modelo = parseInt(splitName[1])
	local Textura = parseInt(splitName[2])

	if skinData["backpack"]["item"] == Modelo then
		skinData["backpack"]["item"] = 0
		skinData["backpack"]["texture"] = 0
	else
		skinData["backpack"]["texture"] = Textura
		skinData["backpack"]["item"] = Modelo
	end

	SetPedComponentVariation(PlayerPedId(),5,skinData["backpack"]["item"],skinData["backpack"]["texture"],1)

	vSERVER.updateClothes(skinData)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETCUSTOMIZATION
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.getCustomization()
	return skinData
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SKINSHOP:DEFIBRILLATOR
-----------------------------------------------------------------------------------------------------------------------------------------
local Defibrillator = false
RegisterNetEvent("skinshop:Defibrillator")
AddEventHandler("skinshop:Defibrillator",function()
	if Defibrillator then
		Defibrillator = false
		SetPedComponentVariation(PlayerPedId(),5,0,0,1)
	else
		Defibrillator = true
		SetPedComponentVariation(PlayerPedId(),5,100,0,1)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEFIBRILLATOR
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.Defibrillator()
	return Defibrillator
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEBACKPACK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:removeBackpack")
AddEventHandler("skinshop:removeBackpack",function(numBack)
	if skinData["backpack"]["item"] == parseInt(numBack) then
		skinData["backpack"]["item"] = 0
		skinData["backpack"]["texture"] = 0
		SetPedComponentVariation(PlayerPedId(),5,0,0,1)

		vSERVER.updateClothes(skinData)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKBACKPACK
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkBackpack()
	if skinData["backpack"]["item"] >= 100 then
		return skinData["backpack"]["item"]
	end

	return false
end