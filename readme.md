                                                Hello!

So i was bored again... And i just made this simple dark web script thingy...
the ui is from https://github.com/yxupy/yxupy-darktablet


Future Plans: Setting up a pickup point so the weapon dosen't magically appear in your inventory :D...

Features: 30 Minute cooldown after a purchase. (You can change that in index.js/line(75))
          It takes money from bank not cash.
          Has a minigame like: https://github.com/yxupy/yxupy-darktablet


Dependencies :

utkFingerprint : https://github.com/utkuali/Finger-Print-Hacking-Game


qb-core/shared/items.lua - 
```
['darktablet'] 			 	     = {['name'] = 'darktablet', 			  		['label'] = 'Dark Tablet', 			    ['weight'] = 100, 	    ['type'] = 'item', 		['image'] = 'darktablet.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'looks dangerous'},

```

```
Place the darktablet.png in qb-inventory/html/images
```
.

script preview : https://streamable.com/dw3v51

.

Hope you enjoy it i guess?
