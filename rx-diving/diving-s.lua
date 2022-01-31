local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('qb-diving:server:giveItem', function(randomMaterial)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = randomMaterial

    Player.Functions.AddItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)
