#!/usr/bin/env python3

import os
import subprocess

# config
path = "~/.config/i3/scripts"
rofiOption = ""

# get list of players
players = subprocess.run(['playerctl', '-l'], capture_output=True, text=True).stdout.split("\n")
players.pop(len(players)-1)

# create class
class playersData:
    def __init__(self, display, command):
        self.display = display
        self.command = command

# create list and input players info into class of it's own
list = []
for i, player in enumerate(players):
    info = subprocess.run(['playerctl', '-p', player, 'metadata', '--format', "({{ artist }} - {{ title }})"], capture_output=True, text=True).stdout[:-1]
    statusGet = subprocess.run(['playerctl', '-p', player, 'status'], capture_output=True, text=True).stdout[:-1]
    selected = '✅ ' if i == 0 else ''
    if statusGet == 'Playing':
        status = ""
    else:
        status = ""
    list.append( playersData(selected +  status + " " + player.split(".")[0] + " " + info, player.strip()) )

# preparing menu
menuArray = []
for obj in list:
    menuArray.append(obj.display)
c = '"'+"\n".join(menuArray)+'"'

# displaying menu
choice = os.popen('echo ' + c + ' | rofi -dmenu -i -p "Select Players" ' + rofiOption).read()[:-1]

for i, obj in enumerate(list):
    if obj.display == choice:
        for j in range(i):
            os.system("playerctld shift")
