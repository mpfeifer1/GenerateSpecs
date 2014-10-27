#!/bin/bash

#Delete existing spec sheet, if any
rm /home/$USER/Documents/Specs_$HOSTNAME.txt

#Allows you to print to spec sheet easily
function print_line()
{
echo $1 $2 $3>> /home/$USER/Documents/Specs_$HOSTNAME.txt
}

#OS
KERNEL=$(uname -or)
ARCH=$(uname -i)

#RAM
RAM=$(vmstat -s | head -n 1 |  awk -F' ' '{print $1}')

#Screen Resolution
SCREEN=$(xdpyinfo  | grep dimensions | awk -F' ' '{print $2}')

#HDD Size
HDD=$(lsblk | awk 'NR==2' | head -c 23 | tail -c 5)

#CPU Info
MAKER=$(cat /proc/cpuinfo | awk 'NR==2'  | cut -d ":" -f 2)
MODEL=$(cat /proc/cpuinfo | awk 'NR==5'  | cut -d ":" -f 2 | head -c 37 | tail -c 8)
CORES=$(cat /proc/cpuinfo | awk 'NR==13' | cut -d ":" -f 2)
CLOCK=$(cat /proc/cpuinfo | awk 'NR==5'  | cut -d "@" -f 2)


#Print Spec Sheet
print_line $HOSTNAME Specs
print_line $USERNAME
print_line
print_line "Linux Kernel =======>" $KERNEL
print_line "Linux Architecture =>" $ARCH
print_line
print_line "Total Ram ==========>" $RAM "Kb"
print_line "Screen Res =========>" $SCREEN
print_line "HDD Size ===========>" $HDD "Gb"
print_line
print_line "CPU Manufacturer ===>" $MAKER
print_line "CPU Model ==========>" $MODEL
print_line "CPU Cores ==========>" $CORES
print_line "CPU Clock ==========>" $CLOCK
