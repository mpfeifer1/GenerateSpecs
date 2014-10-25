#!/bin/bash

rm /home/$USER/Documents/Specs_$HOSTNAME.txt

#Allows you to print to spec sheet easily
function print_line()
{
echo $1 $2 $3>> /home/$USER/Documents/Specs_$HOSTNAME.txt
}

#Print First Lines
print_line $HOSTNAME Specs
print_line $USERNAME
print_line

#Print OS
KERNEL=$(uname -or)
print_line "Linux Kernel =======>" $KERNEL

ARCH=$(uname -i)
print_line "Linux Architecture =>" $ARCH

print_line

#Print RAM
RAM=$(vmstat -s | head -n 1 |  awk -F' ' '{print $1}')
print_line "Total Ram ==========>" $RAM "Kb"

#Print Screen Resolution
SCREEN=$(xdpyinfo  | grep dimensions | awk -F' ' '{print $2}')
print_line "Screen Res =========>" $SCREEN

#Print HDD Size
HDD=$(lsblk | awk 'NR==2') #TODO
print_line "HDD Size ===========>" $HDD Gb

print_line

#Print CPU Info
CORES=$(cat /proc/cpuinfo | awk 'NR==13' | cut -d ":" -f 2)
print_line "CPU Cores ==========>" $CORES
MAKER=$(cat /proc/cpuinfo | awk 'NR==2' | cut -d ":" -f 2)
print_line "CPU Manufacturer ===>" $MAKER
CLOCK=$(cat /proc/cpuinfo | awk 'NR==5' | cut -d "@" -f 2)
print_line "CPU Clock ==========>" $CLOCK
