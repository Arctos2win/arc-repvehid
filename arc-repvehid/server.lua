if Config.Standalone then 
    RegisterCommand('repairvehid', function(_src, args)
        if args[1] == nil then
            args[1] = _src -- if the args return nil then we just do it for the source 
        end 

        local playerPed = GetPlayerPed(args[1]) -- get the playerped from the target 

        if DoesEntityExist(playerPed) then -- if the player is online 
            local vehicle = GetVehiclePedIsIn(playerPed, true) -- get the vehicle from the player 
            if vehicle ~= 0 and DoesEntityExist(vehicle) then -- if the vehicle exists
                local netid = NetworkGetNetworkIdFromEntity(vehicle) 
                TriggerclientEvent('repveh:repair', -1, netid) 
                print('vehicle repaired') -- print to the console that the vehicle is repaired
            end 
        else 
            print('The given player id is not online') -- print to the console that the player is not online
        end 
        TriggerEvent('chat:addSuggestion', '/repairvehid', 'Repair previous or current vehicle from player id', {
            { name="playerid", help="Id from player if not given it uses the source" } 
        })
    end)
else
ESX = exports["es_extended"]:getSharedObject()
Wait(1)
ESX.RegisterCommand({'repairvehid', 'rvi'}, 'admin',
                    function(xPlayer, args, showError)
    local xTarget = ESX.GetPlayerFromId(args.targetid)
    if xTarget == nil then
        xPlayer.showNotification("We can't find a player with that player id.")
        return
    end
    local targetPed = GetPlayerPed(args.targetid)
    local targetVehicle = GetVehiclePedIsIn(targetPed, true)
    if targetVehicle and DoesEntityExist(targetVehicle) then
        local netid = NetworkGetNetworkIdFromEntity(targetVehicle)
        TriggerClientEvent("repveh:repair", -1, netid)
        xTarget.showNotification("Your vehicle has been fixed !") 
    else 
        xPlayer.showNotification("The player doesn't have a vehicle.")
    end
end, false, {
    help = "repairvehicleid",
    arguments = {
        {
            name = 'targetid',
            help = "Speler id van wie je het laatste voertuig wilt repairen",
            type = 'number'
        }
    }
})
end 