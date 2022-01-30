
--[[
      _____                                            _____                    _____                _____          
     |\    \                 ______                   /\    \                  /\    \              |\    \         
     |:\____\               |::|   |                 /::\____\                /::\    \             |:\____\        
     |::|   |               |::|   |                /:::/    /               /::::\    \            |::|   |        
     |::|   |               |::|   |               /:::/    /               /::::::\    \           |::|   |        
     |::|   |               |::|   |              /:::/    /               /:::/\:::\    \          |::|   |        
     |::|   |               |::|   |             /:::/    /               /:::/__\:::\    \         |::|   |        
     |::|   |               |::|   |            /:::/    /               /::::\   \:::\    \        |::|   |        
     |::|___|______         |::|   |           /:::/    /      _____    /::::::\   \:::\    \       |::|___|______  
     /::::::::\    \  ______|::|___|___ ____  /:::/____/      /\    \  /:::/\:::\   \:::\____\      /::::::::\    \ 
    /::::::::::\____\|:::::::::::::::::|    ||:::|    /      /::\____\/:::/  \:::\   \:::|    |    /::::::::::\____\
   /:::/~~~~/~~      |:::::::::::::::::|____||:::|____\     /:::/    /\::/    \:::\  /:::|____|   /:::/~~~~/~~      
  /:::/    /          ~~~~~~|::|~~~|~~~       \:::\    \   /:::/    /  \/_____/\:::\/:::/    /   /:::/    /         
 /:::/    /                 |::|   |           \:::\    \ /:::/    /            \::::::/    /   /:::/    /          
/:::/    /                  |::|   |            \:::\    /:::/    /              \::::/    /   /:::/    /           
\::/    /                   |::|   |             \:::\__/:::/    /                \::/____/    \::/    /            
 \/____/                    |::|   |              \::::::::/    /                  ~~           \/____/             
                            |::|   |               \::::::/    /                                                    
                            |::|   |                \::::/    /                                                     
                            |::|___|                 \::/____/                                                      
                             ~~                       ~~                                                                                                                                                                           
]]


local display = false
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("tabletopen",function()
    SetDisplay(true)
    TriggerEvent('animations:client:EmoteCommandStart', {"tablet2"})
end)

--very important cb 
RegisterNUICallback("close", function(data)
    SetDisplay(false)
end)

-----------------------------------------------------blackmarket--------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("DarkwebOrder", function(data, cb)
    SetDisplay(false)
    TriggerEvent("utk_fingerprint:Start", 1, 5, 2, function(outcome, reason)
        if outcome == true then -- reason will be nil if outcome is true
TriggerServerEvent("yxupy-darkweb:buy", data)
print("Succeed")
elseif outcome == false then
    print("Failed. Reason: "..reason)
end
end)       
end) 
--------------------------------------------------------------------------------------------------------------------------------

-- this cb is used as the main route to transfer data back 
-- and also where we hanld the data sent from js
RegisterNUICallback("main", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("error", function(data)
    chat(data.error, {255,0,0})
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)

function chat(str, color)
    TriggerEvent(
        'chat:addMessage',
        {
            color = color,
            multiline = true,
            args = {str}
        }
    )
end