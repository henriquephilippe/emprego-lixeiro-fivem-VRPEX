------- CREDITOS  DO  Henryque#2629
---- ESSE SCRIPT FOI DESENVOLVIDO PELO HENRIQUE DA RYCK-STORE, ESSE SCRIPT É OPENSOURCE(DE GRAÇA), ENTÃO A VENDA DO MESMO É TOTALMENTE PROIBIDA


------- CREDITOS  DO  Henryque#2629
---- ESSE SCRIPT FOI DESENVOLVIDO PELO HENRIQUE DA RYCK-STORE, ESSE SCRIPT É OPENSOURCE(DE GRAÇA), ENTÃO A VENDA DO MESMO É TOTALMENTE PROIBIDA

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
eMP = Tunnel.getInterface("emp_lx")


rota = {      --------------------------CORDENADAS DAS LIXEIRAS
    vector3(-87.25,-1330.1,29.3),
    vector3(-87.45,-1298.62,29.31),
    vector3(-87.38,-1287.69,29.3),
    vector3(-43.77,-1299.88,29.09),
    vector3(-43.88,-1285.55,29.1),
	vector3(-171.68, -1459.66, 31.69),
	vector3(-167.22, -1413.76, 30.99),
	vector3(-165.54, -1419.9, 31.18),
	vector3(-153.73, -1414.44, 30.87),
	vector3(-153.28, -1342.54, 30.03),
	vector3(-150.63, -1342.62, 29.98),
	vector3(-129.76, -1340.75, 29.7),
	vector3(-129.72, -1337.56, 29.83),
	vector3(-77.27, -1383.61, 29.32),
	vector3(-50.54, -1350.7, 29.33),
	vector3(-38.26, -1352.11, 29.32),
	vector3(-28.39, -1352.19, 29.32),
	vector3(-17.61, -1391.18, 29.37),
	vector3(1.02, -1386.48, 29.3),
	vector3(1.92, -1351.45, 29.33),
	vector3(-149.17, -1294.25, 31.25),
	vector3(-169.04, -1294.81, 31.21),
	vector3(-176.3, -1291.13, 31.3),
	vector3(-175.75, -1285.43, 31.3)
	
	
} 
------- CREDITOS  DO  Henryque#2629
---- ESSE SCRIPT FOI DESENVOLVIDO PELO HENRIQUE DA RYCK-STORE, ESSE SCRIPT É OPENSOURCE(DE GRAÇA), ENTÃO A VENDA DO MESMO É TOTALMENTE PROIBIDA

servico = false

-- INICIAR SERVIÇO
CreateThread(function()
    while true do 
        local sleep = 1000
        ped = PlayerPedId()
        coordped = GetEntityCoords(ped)
        if not servico then       
            local coordblip = vector3(-322.24,-1545.79,31.02)
            local distancia = #(coordped - coordblip)
            if distancia < 5 then
                sleep = 5
                txt("APERTE ~g~[E]~s~ PARA ENTRAR EM SERVIÇO",coordblip.x,coordblip.y,coordblip.z,0,0.3,0.3,255,255,255,255) ---- TEXTO NO BLIP DE SERVICO
                DrawMarker(1, coordblip.x, coordblip.y, coordblip.z-0.95, 0, 2, 2, 0, 0, 0, 0.9, 0.9, 0.9, 104, 255, 255, 255, false, false, 2, 1)  -----CONFIG DO BLIPMAKER DO SERVICO
                if distancia < 1 then  ----- DISTANCIA PRA APERTAR PRA ENTRAR NO SERVICO
                    if IsControlJustPressed(0, 38) then ------- BOTÃO PRA APERTAR PRA ENTRAR EM SERVICO
                    lixeira = math.random(#rota)
                    servico = true
                    TriggerEvent('Notify', 'sucesso', 'Você entrou em serviço.',5000)  ----MENSAGEM NA HORA QUE ENTRAR EM SERVICO
                    car() 
                    blipmap(rota[lixeira].x , rota[lixeira].y , rota[lixeira].z)
                    trabalho()
                    end
                end
            end
        end
        Wait(sleep)
    end
end)
------- CREDITOS  DO  Henryque#2629
---- ESSE SCRIPT FOI DESENVOLVIDO PELO HENRIQUE DA RYCK-STORE, ESSE SCRIPT É OPENSOURCE(DE GRAÇA), ENTÃO A VENDA DO MESMO É TOTALMENTE PROIBIDA



-- TRABALHANDO
function trabalho()
CreateThread(function()
    while servico do 
        local sleep = 1000
            local coordlixo = vector3(rota[lixeira].x , rota[lixeira].y , rota[lixeira].z)
            local distancia = #(coordped - coordlixo)
            if distancia < 10 then
                sleep = 5
                if IsVehicleModel(GetVehiclePedIsIn(ped, true), -1255698084) then -----CONFIG/ SÓ APARACER O BLIP SE ESTIVER NO VEICULO DO LIXEIRO
                    DrawMarker(1, coordlixo.x , coordlixo.y , coordlixo.z-0.95, 0, 2, 2, 0, 0, 0, 0.9, 0.9, 0.9, 104, 255, 255, 255, false, false, 2, 1) ---CONFIG DO BLIOPMAKER DA LIXEIRA
                    if distancia < 2 then
                        if IsControlJustPressed(0,38) then        
                            lixeira = math.random(#rota)
                            vRP._playAnim(false, {{"amb@prop_human_parking_meter@female@idle_a", "idle_a_female"}}, true) --- CONFIG ANIMÃÇÕES
                            TriggerEvent("progress",5000,"coletando") ---MENSAGEM DO PROGRESSBAR
                            TriggerEvent('cancelando',true)
                            FreezeEntityPosition(ped, true)
                            SetTimeout(5000, function()
                                ClearPedTasks(ped)
                                FreezeEntityPosition(ped,false)
                                eMP.payment()
                                TriggerEvent('cancelando',false)
                                RemoveBlip(bliplixo)
                                blipmap(rota[lixeira].x , rota[lixeira].y , rota[lixeira].z )
                            end)
                        end
                    end
                end
            end       
    Wait(sleep)
    end
end)

------- CREDITOS  DO  Henryque#2629
---- ESSE SCRIPT FOI DESENVOLVIDO PELO HENRIQUE DA RYCK-STORE, ESSE SCRIPT É OPENSOURCE(DE GRAÇA), ENTÃO A VENDA DO MESMO É TOTALMENTE PROIBIDA



    CreateThread(function()
        while servico do
            Wait(5)
            if IsControlJustPressed(0, 168) then
                servico = false
                TriggerEvent('Notify', 'sucesso', 'Você saiu do serviço.',5000) ---MENSAGEM NA HORA QUE SAIR DO SERVIÇO
                RemoveBlip(bliplixo)
                DeleteEntity(veiculo )
            end
        end


    end)
end

-- CRIANDO BLIP
function blipmap(x , y , z)
    bliplixo = AddBlipForCoord(x,y,z)
    SetBlipSprite(bliplixo,143)
    SetBlipColour(bliplixo, 24)
    SetBlipScale(bliplixo, 0.5)
    SetBlipRoute(bliplixo, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Lixeira")
    EndTextCommandSetBlipName(bliplixo)
end

-- FUNÇÕES LIXEIROS
function txt(texto, x, y, z, font, s1, s2, r, g, b, a)
    local screen,x_,y_ =  GetScreenCoordFromWorldCoord(x,y,z)
    if screen then
        SetTextFont(font)  
        SetTextScale(s1, s2)
        SetTextColour(r, g, b, a)
        SetTextCentre(1)
        SetTextEntry("STRING")
        AddTextComponentString(texto)
        DrawText(x_,y_)
    end
end

-- CRIANDO CAMINHÃO
function car()
    local hash = GetHashKey("trash2") ------TRASH2 VC SUBSTITUI PELO NOME DO VEICULO QUE VC QUER COLOCAR NO LUGAR, N SE ESQUEÇA DE ALTERAR  A HASH(-1255698084) NA LINHA 67 PELA HASH DO VEICULO NOVO QUE VAI MUDAR
    while not HasModelLoaded(hash) do Wait(10) RequestModel(hash) end
     veiculo = CreateVehicle(hash,-319.57, -1519.48, 27.27, 181.,4, true, true)
    SetVehicleNumberPlateText(veiculo, vRP.getRegistrationNumber())
end

------- CREDITOS  DO  Henryque#2629
---- ESSE SCRIPT FOI DESENVOLVIDO PELO HENRIQUE DA RYCK-STORE, ESSE SCRIPT É OPENSOURCE(DE GRAÇA), ENTÃO A VENDA DO MESMO É TOTALMENTE PROIBIDA
