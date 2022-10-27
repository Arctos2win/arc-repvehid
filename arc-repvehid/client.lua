RegisterNetEvent("repveh:StartRepairing")
AddEventHandler("repveh:StartRepairing", function()
    local vehicle = GetPlayersLastVehicle()
    if not DoesEntityExist(vehicle) then TriggerEvent("esx:showNotification", "Een admin probeerde je voertuig te repairen maar er staat geen recent voertuig van je op de map !", "info", 4000) return end 
    ESX.TriggerServerCallback("repveh:CheckAllowed", function(data)
        if data == true then
            SetVehicleFixed(vehicle)
            SetVehicleDeformationFixed(vehicle)
            SetVehicleUndriveable(vehicle, false)
            SetVehicleEngineOn(vehicle, true, true)
            ClearPedTasksImmediately(PlayerPedId())
        else
            return
        end
    end, vehicle)
end)
