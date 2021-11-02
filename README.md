# Edited Version of Rcore_Arcade for QBus

**[Source](https://github.com/Xogy/rcore_arcade)**

**[Edited preview](https://streamable.com/ylfw1i)**

**[SunsetArcade download](https://drive.google.com/drive/folders/1aRrFoLF-ih_gBuAuDfGahgL8dH0FaQXd?usp=sharing)**





# Required
**[casinoUi](https://github.com/dojwun/casinoUi)**

![General](https://i.imgur.com/t33DItt.png)


**[qb-menu](https://github.com/qbcore-framework/qb-menu)**

![General](https://i.imgur.com/8hIjMQa.png)

# Images 

![General](https://i.imgur.com/5bLve6O.png)
![General](https://i.imgur.com/815vDIQ.png)
![General](https://i.imgur.com/czXFSze.png)


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










# (original readme) rcore_arcade 
a simple resource for playing games with friends.<br>this resource is somewhat standalone, it can be run on any framework but dont expect the ticket feature work if you're running it on something other than ESX.

https://www.youtube.com/watch?v=0k2wwr-5FWI&feature=youtu.be&ab_channel=rcore

Dependencies

https://github.com/Xogy/MenuAPI
