
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("rcore_arcade:server:buyTicket")
AddEventHandler("rcore_arcade:server:buyTicket", function(ticket)
    local src = source
    local data = Config.ticketPrice[ticket]
    local Player = QBCore.Functions.GetPlayer(source)
    local moneyPlayer = tonumber(Player.PlayerData.money.bank)
    if moneyPlayer > data.price then
        Player.Functions.RemoveMoney("bank", tonumber(data.price), "arcade-ticket")
        if Player.Functions.GetItemByName(ticket) then
            TriggerClientEvent('QBCore:Notify', source, ticket.." has been renewed!", "success")
            TriggerClientEvent("rcore_arcade:clientticketResult", source, ticket)
        else
            local info = {
                owner = Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname,
                cardtime = Config.ticketPrice[ticket].time
            }
            Player.Functions.AddItem(ticket, 1, false, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ticket], "add", 1) 
            TriggerClientEvent("rcore_arcade:clientticketResult", source, ticket)
            TriggerClientEvent('QBCore:Notify', source, "You Bought a "..ticket.." Play Card", "success")
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "You dont have enough money!", "error")
    end
end)
