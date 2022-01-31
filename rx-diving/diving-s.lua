local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('qb-diving:server:giveGlassItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem('glass', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["glass"], "add")
end)

RegisterNetEvent('qb-diving:server:giveRubberItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem('rubber', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["rubber"], "add")
end)

RegisterNetEvent('qb-diving:server:giveSteelItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem('steel', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["steel"], "add")
end)

RegisterNetEvent('qb-diving:server:giveAluminumItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem('aluminum', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["aluminum"], "add")
end)

RegisterNetEvent('qb-diving:server:giveMetalScrapItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem('metalscrap', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["metalscrap"], "add")
end)

RegisterNetEvent('qb-diving:server:giveGoldBarItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem('goldbar', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["goldbar"], "add")
end)

