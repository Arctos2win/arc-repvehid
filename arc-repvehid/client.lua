RegisterNetEvent("repveh:repair")
AddEventHandler("repveh:repair", function(netid)
    local vehicle = NetworkGetEntityFromNetworkId(netid)
    if vehicle ~= 0 then
        SetNetworkIdExistsOnAllMachines(netid, true)
        SetVehicleFixed(vehicle)
        SetVehicleDeformationFixed(vehicle)
        SetVehicleUndriveable(vehicle, false)
        SetVehicleEngineOn(vehicle, true, true)
    end
end)