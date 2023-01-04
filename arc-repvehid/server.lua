ESX.RegisterCommand({'repairvehid', 'rvi'}, 'admin',
                    function(xPlayer, args, showError)
                        local xTarget = ESX.GetPlayerFromId(args.targetid) 
                        if xTarget == nil then xPlayer.showNotification("De speler die je hebt opgegeven is niet gevonden.") return end
                        local targetPed = GetPlayerPed(args.targetid) 
                        local targetVehicle = GetVehiclePedIsIn(targetPed, true) 
                        local netid = NetworkGetNetworkIdFromEntity(targetVehicle)  
                        SetNetworkIdExistsOnAllMachines(netid, true)  
                        TriggerClientEvent("repveh:repair", -1, netid)        
                    end, false, { help = "repairvehicleid", 
    arguments = {
        {
            name = 'targetid',
            help = "Speler id van wie je het laatste voertuig wilt repairen",
            type = 'number'
        }
    }
}) 




