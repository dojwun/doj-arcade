# Edited Version of Rcore_Arcade for QBus

original: https://github.com/Xogy/rcore_arcade

edited preview: https://streamable.com/g438pg

Mlo in video: SunsetArcade

# Required
- https://github.com/dojwun/casinoUi
- casinoUi preview:

![General](https://i.imgur.com/t33DItt.png)

- https://github.com/dojwun/nh-context
- nh-context preview: 

![General](https://i.imgur.com/8hIjMQa.png)

- qb-core/shared.lua info
```
	["arcadegreen"]  = {
		["name"] = "arcadegreen",
		["label"] = "Green Arcade Card",
		["weight"] = 0, 		
		["type"] = "item", 		
		["image"] = "arcadegreen.png", 		
		["unique"] = true, 		
		["useable"] = false, 	
		["shouldClose"] = false,	   
		["combinable"] = nil,   
		["description"] = "Green Arcade Card"
	},
	["arcadeblue"]  = {
		["name"] = "arcadeblue",
		["label"] = "Blue Arcade Card",
		["weight"] = 0, 		
		["type"] = "item", 		
		["image"] = "arcadeblue.png", 		
		["unique"] = true, 		
		["useable"] = false, 	
		["shouldClose"] = false,	   
		["combinable"] = nil,   
		["description"] = "Blue Arcade Card"
	},
	["arcadegold"]  = {
		["name"] = "arcadegold",
		["label"] = "Gold Arcade Card",
		["weight"] = 0, 		
		["type"] = "item", 		
		["image"] = "arcadegold.png", 		
		["unique"] = true, 		
		["useable"] = false, 	
		["shouldClose"] = false,	   
		["combinable"] = nil,   
		["description"] = "Gold Arcade Card"
	},
 ``` 
- qb-inventory/html/js/app.js
```
	  else if (itemData.name == "arcadeblue") {
            $(".item-info-title").html('<p>'+itemData.label+'</p>')
            $(".item-info-description").html('<p><strong>Owner: </strong>'+itemData.info.owner+'</p><strong>Play Card Time:</strong> '+itemData.info.cardtime+' minutes</p>'); 
            $(".item-info-stats").html('<p>Weight: '+((itemData.weight * itemData.amount) / 1000).toFixed(1) +' | Amount: '+itemData.amount+ ' | Quality: '+itemData.info.quality.toFixed(0)+'%</p>') 
        } else if (itemData.name == "arcadegreen") {
            $(".item-info-title").html('<p>'+itemData.label+'</p>')
            $(".item-info-description").html('<p><strong>Owner: </strong>'+itemData.info.owner+'</p><strong>Play Card Time:</strong> '+itemData.info.cardtime+' minutes</p>'); 
            $(".item-info-stats").html('<p>Weight: '+((itemData.weight * itemData.amount) / 1000).toFixed(1) +' | Amount: '+itemData.amount+ ' | Quality: '+itemData.info.quality.toFixed(0)+'%</p>') 
        } else if (itemData.name == "arcadegold") {
            $(".item-info-title").html('<p>'+itemData.label+'</p>')
            $(".item-info-description").html('<p><strong>Owner: </strong>'+itemData.info.owner+'</p><strong>Play Card Time:</strong> '+itemData.info.cardtime+' minutes</p>'); 
            $(".item-info-stats").html('<p>Weight: '+((itemData.weight * itemData.amount) / 1000).toFixed(1) +' | Amount: '+itemData.amount+ ' | Quality: '+itemData.info.quality.toFixed(0)+'%</p>') 
        }
  ```
- qb-target info
```
-- Arcade
exports['qb-target']:AddCircleZone("arcadeTickets", vector3(-1190.781, -774.861, 16.331), 2.0, {
    name="arcadeTickets",
    heading=160,
    debugPoly=false,
    useZ=true,
    }, {
        options = {
            {
                event = "arcade:client:openTicketMenu",
                icon = "fab fa-speakap",
                label = "Speak with Arcade Employee",
            },
        },
    distance = 2.5 
})
exports['qb-target']:AddBoxZone("ArcadeGames", vector3(-1196.335, -772.748, 17.322), 1.8, 3.5, {
    name="ArcadeGames",
    heading=214.112,
    debugPoly=false,
    minZ=16.9,
    maxZ=17.922
    }, {
        options = {
            {
                event = "arcade:client:openArcadeGames",
                icon = "fas fa-gamepad",
                label = "Play Arcade Games", 
            },
        },
    distance = 1.0
})
exports['qb-target']:AddBoxZone("ArcadeGames2", vector3(-1194.997, -774.573, 17.322), 1.8, 3.5, {
    name="ArcadeGames2",
    heading=214.112,
    debugPoly=false,
    minZ=16.9,
    maxZ=17.922
    }, {
        options = {
            {
                event = "arcade:client:openArcadeGames",
                icon = "fas fa-gamepad",
                label = "Play Arcade Games", 
            },
        },
    distance = 1.0
})
```















# (original readme) rcore_arcade 
a simple resource for playing games with friends.<br>this resource is somewhat standalone, it can be run on any framework but dont expect the ticket feature work if you're running it on something other than ESX.

https://www.youtube.com/watch?v=0k2wwr-5FWI&feature=youtu.be&ab_channel=rcore

Dependencies

https://github.com/Xogy/MenuAPI
