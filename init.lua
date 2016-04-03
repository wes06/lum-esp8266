-- init.lua --


-- Global Variables (Modify for your network)
ssid = "w16"
pass = "90000000"


-- Byline
print('\nAllAboutCircuits.com NodeMCU Example\n')

-- Configure Wireless Internet
wifi.setmode(wifi.STATION)
print('set mode=STATION (mode='..wifi.getmode()..')\n')
print('MAC Address: ',wifi.sta.getmac())
print('Chip ID: ',node.chipid())
print('Heap Size: ',node.heap(),'\n')

-- Configure WiFi
wifi.sta.config(ssid,pass)

dofile("main.lua")