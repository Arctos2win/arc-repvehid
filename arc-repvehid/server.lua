local sessions = {}

ESX.RegisterCommand({'repairvehid', 'rvi'}, 'admin',
                    function(xPlayer, args, showError)
                        local xTarget = ESX.GetPlayerFromId(args.targetid) 
                        if xTarget == nil then xPlayer.showNotification("De speler die je hebt opgegeven is niet gevonden.") return end
                        sessions[args.targetid] = {
                            allowed = true
                        }
                        TriggerClientEvent("repveh:StartRepairing", args.targetid) 
                    end, false, { help = "repairvehicleid", 
    arguments = {
        {
            name = 'targetid',
            help = "Speler id van wie je het laatste voertuig wilt repairen",
            type = 'number'
        }
    }
}) 

ESX.RegisterServerCallback("repveh:CheckAllowed", function(source, cb, targetid)
    if sessions[source].allowed == true then 
        TriggerClientEvent("esx:showNotification", source, "Je voertuig is gerepaired !", "info", 2500) 
        cb(true)
        sessions[source] = nil 
    else 
        cb(false)
    end
end)




