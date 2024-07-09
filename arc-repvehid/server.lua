if Config.Standalone then 
    RegisterCommand('repairvehid', function(_src, args)
        args[1] = args[1] or _src
            
        local playerPed = GetPlayerPed(args[1]) -- get the playerped from the target 
        if not DoesEntityExist(playerPed) then return print('The given player id is not online') end 
            
        local vehicle = GetVehiclePedIsIn(playerPed, true) -- get the vehicle from the player 
        if not DoesEntityExist(vehicle) then return end 
            
        local netid = NetworkGetNetworkIdFromEntity(vehicle) 
        TriggerClientEvent('repveh:repair', -1, netid) 
        print('vehicle repaired') -- print to the console that the vehicle is repaired
    end)

    TriggerClientEvent('chat:addSuggestion', '/repairvehid', 'Repair previous or current vehicle from player id', {
        { name="playerid", help="Id from player if not given it uses the source" } 
    })
else
ESX = exports["es_extended"]:getSharedObject()
ESX.RegisterCommand({'repairvehid', 'rvi'}, 'admin', function(xPlayer, args, showError)
    local xTarget = ESX.GetPlayerFromId(args.targetid)
    if not xTarget then
        return xPlayer.showNotification("We can't find a player with that player id.")
    end
            
    local targetVehicle = GetVehiclePedIsIn(GetPlayerPed(args.targetid), true)
    if not DoesEntityExist(targetVehicle) then return xPlayer.showNotification("The player doesn't have a vehicle.") end 

    local netid = NetworkGetNetworkIdFromEntity(targetVehicle)
    TriggerClientEvent("repveh:repair", -1, netid)
    xTarget.showNotification("Your vehicle has been fixed !") 
end, false, {
    help = "repairvehicleid",
    arguments = {
        {
            name = 'targetid',
            help = "The id from the player from who you want to repair the last or current vehicle.",
            type = 'number'
        }
    }
})
end 
