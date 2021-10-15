
RegisterNetEvent("rcore_arcade:server:buyTicket")
AddEventHandler("rcore_arcade:server:buyTicket", function(ticket)
        local src = source
        local data = Config.ticketPrice[ticket]
        local Player = QBCore.Functions.GetPlayer(source)
        local moneyPlayer = tonumber(Player.PlayerData.money.bank)

        if moneyPlayer > data.price then
            Player.Functions.RemoveMoney("bank", tonumber(data.price), "arcade-ticket")

            TriggerClientEvent("rcore_arcade:clientticketResult", source, ticket)

            local info = {
                owner = Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname,
                cardtime = Config.ticketPrice[ticket].time
            }
            Player.Functions.AddItem(ticket, 1, false, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ticket], "add", 1)
        else
            TriggerClientEvent('QBCore:Notify', source, "You dont have enough money!", "error")

        end

end)
