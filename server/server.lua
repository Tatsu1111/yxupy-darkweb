local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("darktablet", function(source)
   TriggerClientEvent('tabletopen',source)
end)

RegisterServerEvent("yxupy-darkweb:buy")
AddEventHandler("yxupy-darkweb:buy", function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local player = QBCore.Functions.GetPlayer(src)
    local bank = player.PlayerData.money['bank']
    local paymentAmount = tonumber("15000")
        if bank >= 15000 then   
        Player.Functions.AddItem("weapon_pistol", "1")
        Player.Functions.RemoveMoney("bank", "15000")
    TriggerClientEvent('QBCore:Notify', src, 'Purchase Went Successfully', 'success')
    else
    TriggerClientEvent('QBCore:Notify', src, 'Not enough money', 'error')
    end
end)          

