------- CREDITOS  DO  Henryque#2629
---- ESSE SCRIPT FOI DESENVOLVIDO PELO HENRIQUE DA RYCK-STORE, ESSE SCRIPT É OPENSOURCE(DE GRAÇA), ENTÃO A VENDA DO MESMO É TOTALMENTE PROIBIDA



local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
eMP = {}
Tunnel.bindInterface("emp_lx",eMP)

------- CREDITOS  DO  Henryque#2629
---- ESSE SCRIPT FOI DESENVOLVIDO PELO HENRIQUE DA RYCK-STORE, ESSE SCRIPT É OPENSOURCE(DE GRAÇA), ENTÃO A VENDA DO MESMO É TOTALMENTE PROIBIDA

function eMP.payment()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then 
            vRP.giveMoney(user_id,100)---alterar o valor 100 para o novo valor de recompensa por lixeira.
            TriggerClientEvent('Notify', source,'sucesso', 'Voce ganhou R$100',5000) --- se alterar o valor da recompensa alterar o valor da notificação tambem.
    end
end



------- CREDITOS  DO  Henryque#2629
---- ESSE SCRIPT FOI DESENVOLVIDO PELO HENRIQUE DA RYCK-STORE, ESSE SCRIPT É OPENSOURCE(DE GRAÇA), ENTÃO A VENDA DO MESMO É TOTALMENTE PROIBIDA