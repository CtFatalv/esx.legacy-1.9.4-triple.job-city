ESX = nil

ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('json:dataStructure')
AddEventHandler('json:dataStructure', function(data)
end)

RegisterServerEvent('qb-radialmenu:trunk:server:Door')
AddEventHandler('qb-radialmenu:trunk:server:Door', function(open, plate, door)
    TriggerClientEvent('qb-radialmenu:trunk:client:Door', -1, plate, door, open)
end)