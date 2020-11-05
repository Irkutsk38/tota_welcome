local mensaje = true

if mensaje == true then

    RegisterNetEvent('esx:onPlayerSpawn')
    AddEventHandler('esx:onPlayerSpawn', function(xPlayer)


    Citizen.CreateThread(function() 
        while mensaje == true do     
            Citizen.Wait(1)	
            local playercoords = GetEntityCoords(GetPlayerPed(-1))
			Drawing.draw3DText(playercoords.x, playercoords.y + 10, playercoords.z + 1.700, "Bienvenido a ~g~SERVER RP !", 6, 1.0, 0.8)
			Drawing.draw3DText(playercoords.x, playercoords.y + 10, playercoords.z, "Toda la información la tienes en nuestro discord: ~b~SERVER RP.gg ", 8, 0.4, 0.3)
			Drawing.draw3DText(playercoords.x, playercoords.y + 10, playercoords.z - 0.700, "~y~Buen rol !", 8, 0.4, 0.3)
        end
    end)

    Citizen.CreateThread(function()
        if mensaje == true then
          Citizen.Wait(10000)
          mensaje = false
        end
    end)


    Drawing = setmetatable({}, Drawing)
    Drawing.__index = Drawing

    function Drawing.draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
        local px,py,pz=table.unpack(GetGameplayCamCoords())
        local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

        local scale = (1/dist)*20
        local fov = (1/GetGameplayCamFov())*100
        local scale = scale*fov

        SetTextScale(scaleX*scale, scaleY*scale)
        SetTextFont(fontId)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 190)
        SetTextDropshadow(1, 1, 1, 0, 255)
        SetTextEdge(2, 0, 0, 0, 220)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(textInput)
        SetDrawOrigin(x,y,z+2, 0)
        DrawText(0.0, 0.0)
        ClearDrawOrigin()
    end
    end)
end
