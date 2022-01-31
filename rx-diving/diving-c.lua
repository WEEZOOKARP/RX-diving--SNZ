local QBCore = exports['qb-core']:GetCoreObject()

local divingSite = {
    [1] = vector3(3178.4299316406,-356.15112304688,0.4938257932663)
}

local divingMaterialSpot = Config.divingspots

local materials = Config.Materials

local function createBlips()
    Citizen.CreateThread(function()
        for _, divingSites in ipairs(divingSite) do
            local blip = AddBlipForCoord(divingSites.x, divingSites.y, divingSites.z)
            SetBlipSprite(blip, 274)
            SetBlipDisplay(blip, 6)
            SetBlipScale(blip, 0.8)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Wrecked Ship")
            SetBlipAsShortRange(blip, true)
            EndTextCommandSetBlipName(blip)
        end
    end)
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    createBlips()
end)

local matspot = (divingMaterialSpot[math.random(#divingMaterialSpot)])
Citizen.CreateThread(function()
    while true do
        local e_key = 38
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local randomMaterial = (materials[math.random(#materials)])
        local chance = math.random(1,100)
        local wait = 1000
        
        for _, divingMaterialSpots in ipairs(divingMaterialSpot) do
            if #(playerCoords - divingMaterialSpots) < 100 and IsPedSwimmingUnderWater(playerPed) then
              wait = 0
              DrawText3Ds(matspot.x, matspot.y, matspot.z, "[E] Pick-Up materials")
              if IsControlJustReleased(1, e_key) and #(playerCoords - matspot) < 1.5 then
              randomMaterial = (materials[math.random(#materials)])
                if Config.Notification == "SNZ" then
                    TriggerEvent('SNZ_UI:AddNotification', 'You found', '1x '.. randomMaterial, 5000, 'fas fa-inbox')            
                elseif Config.Notification == "QBCore" then
                    QBCore.Functions.Notify('You Found x1 ' .. randomMaterial)        
                end
                    
            if randomMaterial ~= nil then
                TriggerServerEvent('qb-diving:server:giveItem', randomMaterial)
            else
            if Config.Notification == "SNZ" then
                TriggerEvent('SNZ_UI:AddNotification', 'You found', 'Nothing", 5000, 'fas fa-inbox')   
            elseif Config.Notification == "QBCore" then
                QBCore.Functions.Notify('You Found Nothing ')
            end
              Wait(1000)
              matspot = (divingMaterialSpot[math.random(#divingMaterialSpot)])
           end
         end
      end
      Wait(wait)
   end
end)



function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
end
