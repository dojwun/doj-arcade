
local QBCore = exports['qb-core']:GetCoreObject()

local gotTicket = false
local minutes = 0
local seconds = 0


--===================================== THREADS

--count time
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if gotTicket then
            if hasPlayerRunOutOfTime() then
                QBCore.Functions.Notify("Your Play Card has expired.")
                gotTicket = false
                SendNUIMessage({
                    type = "off",
                    game = "",
                })
                SetNuiFocus(false, false)
            end
            countTime()
            displayTime()
            if gotTicket == false then
                exports['casinoUi']:HideCasinoUi('hide')
            end
        end
    end
end)

--=====================================  FUNCTIONS

function hasPlayerRunOutOfTime()
    return (minutes == 0 and seconds <= 1)
end

function countTime()
    seconds = seconds - 1
    if seconds == 0 then
        seconds = 59
        minutes = minutes - 1
    end

    if minutes == -1 then
        minutes = 0
        seconds = 0
    end
end

function displayTime()
    exports['casinoUi']:DrawCasinoUi('show', "Arcade Card Time</br> "..minutes..":"..seconds)
end

function doesPlayerHaveTicket()
    return gotTicket
end


--=====================================  EVENTS
RegisterNetEvent("arcade:client:openTicketMenu")
AddEventHandler("arcade:client:openTicketMenu", function()
    if gotTicket == false then
        playerBuyTicketMenu()
    else
        returnTicketMenu()
    end
end)

RegisterNetEvent("arcade:client:openArcadeGames")
AddEventHandler("arcade:client:openArcadeGames", function()
    openComputerMenu()
end)

RegisterNetEvent("rcore_arcade:clientticketResult")
AddEventHandler("rcore_arcade:clientticketResult", function(ticket)
    -- Will set time player can be in arcade from Config
    seconds = 1
    minutes = Config.ticketPrice[ticket].time
    -- Tell the script that player has Ticket and can enter.
    gotTicket = true
    QBCore.Functions.Notify("Play Time: "..Config.ticketPrice[ticket].time.." minutes", "primary")
end)

RegisterNetEvent('rcore_arcade:client:buyTicket')
AddEventHandler('rcore_arcade:client:buyTicket', function(args)
    local args = tonumber(args)
    if args == 1 then 
        TriggerServerEvent("rcore_arcade:server:buyTicket", 'arcadeblue')
    elseif args == 2 then 
        TriggerServerEvent("rcore_arcade:server:buyTicket", 'arcadegreen')
    else
        TriggerServerEvent("rcore_arcade:server:buyTicket", 'arcadegold')
    end
end)

RegisterNetEvent('rcore_arcade:client:returnTicket')
AddEventHandler('rcore_arcade:client:returnTicket', function()
    minutes = 0
    seconds = 0 
    gotTicket = false
    QBCore.Functions.Notify("Play card is no longer valid", "primary")
    exports['casinoUi']:HideCasinoUi('hide') 
end)

RegisterNUICallback('exit', function()
    SendNUIMessage({
        type = "off",
        game = "",
    })
    SetNuiFocus(false, false)
end)


RegisterNetEvent('rcore_arcade:client:playArcade')
AddEventHandler('rcore_arcade:client:playArcade', function(args)
    local args = tonumber(args)
    if args == 1 then 
        SendNUIMessage({
            type = "on",
            game = 'http://xogos.robinko.eu/PACMAN/',
            gpu = Config.GPUList[2],
            cpu =  Config.CPUList[1],
            SetNuiFocus(true, true)
        })
        elseif args == 2  then
            SendNUIMessage({
                type = "on",
                game = 'http://xogos.robinko.eu/TETRIS/',
                gpu = Config.GPUList[2],
                cpu =  Config.CPUList[1],
                SetNuiFocus(true, true)
            })
        elseif args == 3 then
            SendNUIMessage({
                type = "on",
                game = 'http://xogos.robinko.eu/PONG/',
                gpu = Config.GPUList[2],
                cpu =  Config.CPUList[1],
                SetNuiFocus(true, true)
            })
        elseif args == 4 then
            SendNUIMessage({
                type = "on",
                game = 'http://lama.robinko.eu/fullscreen.html',
                gpu = Config.GPUList[2],
                cpu =  Config.CPUList[1],
                SetNuiFocus(true, true)
            })
        elseif args == 5 then
            SendNUIMessage({
                type = "on",
                game = 'http://uno.robinko.eu/fullscreen.html',
                gpu = Config.GPUList[2],
                cpu =  Config.CPUList[1],
                SetNuiFocus(true, true)
            })
        elseif args == 6 then
            SendNUIMessage({
                type = "on",
                game = 'http://ants.robinko.eu/fullscreen.html',
                gpu = Config.GPUList[2], 
                cpu =  Config.CPUList[1],
                SetNuiFocus(true, true)
            })
        elseif args == 7 then
            SendNUIMessage({
                type = "on",
                game = 'http://xogos.robinko.eu/FlappyParrot/',
                gpu = Config.GPUList[2],
                cpu =  Config.CPUList[1],
                SetNuiFocus(true, true)
            })
        elseif args == 8 then
            SendNUIMessage({
                type = "on",
                game = 'http://zoopaloola.robinko.eu/Embed/fullscreen.html',
                gpu = Config.GPUList[2],
                cpu =  Config.CPUList[1],
                SetNuiFocus(true, true)
            })
        elseif args == 9 then  
            SendNUIMessage({
                type = "on",
                game = 'https://gulper.io',
                gpu = Config.GPUList[2],
                cpu =  Config.CPUList[1],
                SetNuiFocus(true, true)
            })
        else  
            SendNUIMessage({
                type = "on",
                game = 'https://www.google.com/logos/fnbx/solitaire/standalone.html',
                gpu = Config.GPUList[2],
                cpu =  Config.CPUList[1],
                SetNuiFocus(true, true)
            })
    end
end) 


--===================================== Context Menu


function playerBuyTicketMenu()
    exports['qb-menu']:openMenu({
        {
            header = "Arcade Employee",
            isMenuHeader = true,
        },
        {
            header = "Blue Play Card $5",
            txt = "Purchase",
			params = {
                event = "rcore_arcade:client:buyTicket",
                args = '1'
            }
        },
        {
            header = "Green Play Card $15",
            txt = "Purchase",
			params = {
                event = "rcore_arcade:client:buyTicket",
                args = '2'
            }
        },
        {
            header = "Gold Play Card $25",
            txt = "Purchase",
			params = {
                event = "rcore_arcade:client:buyTicket",
                args = '3'
            }
        },
        {
            header = "Cancel",
			txt = "",
			params = {
                event = ""
            }
        },
    })
end

function returnTicketMenu()
    exports['qb-menu']:openMenu({
        {
            header = "Arcade Employee",
            isMenuHeader = true,
        },
        {
            header = "Stop Using Arcade",
			txt = "End Play Card",
			params = {
                event = "rcore_arcade:client:returnTicket",
            }
        },
        {
            header = "Cancel",
			txt = "",
			params = {
                event = ""
            }
        },
    })
end


function openComputerMenu()
    if not gotTicket then
        QBCore.Functions.Notify("You do have a valid Play Card", "error")
        return
    end
    exports['qb-menu']:openMenu({
        {
            header = "Arcade Game Selection",
            isMenuHeader = true,
        },
        {
            header = "Play Pacman",
			txt = "",
			params = {
                event = "rcore_arcade:client:playArcade",
                args = '1'
            }
        },
        {
            header = "Play Tetris",
			txt = "",
			params = {
                event = "rcore_arcade:client:playArcade",
                args = '2'
            }
        },
        {
            header = "Play PingPong",
			txt = "",
			params = {
                event = "rcore_arcade:client:playArcade",
                args = '3'
            }
        },
        {
            header = "Play Slide a Lama",
			txt = "",
			params = {
                event = "rcore_arcade:client:playArcade",
                args = '4'
            }
        },
        {
            header = "Play Uno",
			txt = "",
			params = {
                event = "rcore_arcade:client:playArcade",
                args = '5'
            }
        },
        {
            header = "Play Ants",
			txt = "",
			params = {
                event = "rcore_arcade:client:playArcade",
                args = '6'
            }
        },
        {
            header = "Play FlappyParrot",
			txt = "",
			params = {
                event = "rcore_arcade:client:playArcade",
                args = '7'
            }
        },
        {
            header = "Play Zoopaloola",
			txt = "",
			params = {
                event = "rcore_arcade:client:playArcade",
                args = '8'
            }
        },
        {
            header = "Play Gulper.io (NEW)",
			txt = "",
			params = {
                event = "rcore_arcade:client:playArcade",
                args = '9'
            }
        },
        {
            header = "Play Solitaire (NEW)",
			txt = "",
			params = {
                event = "rcore_arcade:client:playArcade",
                args = '10'
            }
        },
        {
            header = "Cancel",
			txt = "",
			params = {
                event = ""
            }
        },
    })
end

--=================================== Peds
local arcade= {
  {-1190.781, -774.861, 16.331 ,"Arcade",35.514,0x72551375,"cs_lifeinvad_01"},
  {621.378, 2761.059, 41.088   ,"Arcade",87.515,0x72551375,"cs_lifeinvad_01"},
  {-3176.004, 1048.563, 19.863 ,"Arcade",236.963,0x72551375,"cs_lifeinvad_01"},
  {119.777, -219.1, 53.558     ,"Arcade",235.767,0x72551375,"cs_lifeinvad_01"},

}
Citizen.CreateThread(function()
    for _,v in pairs(arcade) do
        RequestModel(GetHashKey(v[7]))
        while not HasModelLoaded(GetHashKey(v[7])) do
            Wait(1)
        end
        ArcadePed =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
        SetEntityHeading(ArcadePed, v[5])
        FreezeEntityPosition(ArcadePed, true)
        SetEntityInvincible(ArcadePed, true)
        SetBlockingOfNonTemporaryEvents(ArcadePed, true)
        TaskStartScenarioInPlace(ArcadePed, "WORLD_HUMAN_STAND_MOBILE_UPRIGHT", 0, true) 
    end
end)

--======================================== qb-target
exports['qb-target']:AddTargetModel(`cs_lifeinvad_01`, {
    options = {
        {
            event = "arcade:client:openTicketMenu",
            icon = "fab fa-speakap",
            label = "Speak with Arcade Employee",
        },
    },
distance = 2.5 
})

local ArcadeGames = {
    `ch_prop_arcade_degenatron_01a`,
    `ch_prop_arcade_monkey_01a`,
    `ch_prop_arcade_penetrator_01a`,
    -395173800,

}
exports['qb-target']:AddTargetModel(ArcadeGames, {
    options = {
        { 
            event = "arcade:client:openArcadeGames",
            icon = "fas fa-gamepad",
            label = "Play Arcade Games",
        },
    },
    distance = 3.0 
})
