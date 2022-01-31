local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('qb-diving:server:giveItem', function(randomMaterial)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem(randomMaterial, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomMaterial], "add")
end)
