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
        SetNetworkIdExistsOnAllMachines(netid, true)
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
<<<<<<< HEAD
})
=======
}) 

>>>>>>> 5172dac2694e63c4663e66395eb0966d8e85ca5c