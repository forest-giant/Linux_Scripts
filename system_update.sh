#! /bin/bash

LINE_NR=0

#Update local data && Upgrade && Remove unnecessary items
sudo apt-get update >/dev/null && sudo apt-get -y upgrade >/dev/null && sudo apt-get -y dist-upgrade >/dev/null && sudo apt-get autoremove >/dev/null

#Notify me

LINE_NR=$(grep '^$' /var/log/apt/term.log -n | tail -n 1 | cut -d ':' -f1)
notify-send "Upgrade finished, Captain:" "$(cat /var/log/apt/term.log | tail -n +$LINE_NR | grep 'Setting up' | cut -d ' ' -f3)"

