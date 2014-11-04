#Delete existing spec sheet, if any
rm -f /home/$USER/Documents/Specs_$HOSTNAME.txt

#Allows you to print to spec sheet easily
function print_line() {
echo $1 $2 $3>> /home/$USER/Documents/Specs_$HOSTNAME.txt
}

function first_word() {

}

function after_symbol() {

}

function line() {

}

#OS
KERNEL=$(uname -or)
ARCH=$(uname -i)

#RAM
RAM=$(($(vmstat -s | awk 'NR==1' | head -c 13) / 1000))

#Screen Resolution
SCREEN=$(xdpyinfo  | grep dimensions | awk -F' ' '{print $2}')

#HDD Size
HDD=$(lsblk | awk 'NR==2' | head -c 23 | tail -c 5)

#CPU Info
MAKER=$(cat /proc/cpuinfo | awk 'NR==2'  | cut -d ":" -f 2)
MODEL=$(cat /proc/cpuinfo | awk 'NR==5'  | cut -d ":" -f 2 | head -c 37 | tail -c 8) #fix in some way
CORES=$(lscpu | awk 'NR==4' | cut -d ":" -f 2)
CLOCK=$(lscpu | grep 'MHz'| cut -d ":" -f 2)


#Print Spec Sheet
print_line $HOSTNAME Specs
print_line $USERNAME
print_line
print_line "Linux Kernel =======>" $KERNEL
print_line "Linux Architecture =>" $ARCH
print_line
print_line "Total Ram ==========>" $RAM "Mb"
print_line "Screen Res =========>" $SCREEN
print_line "HDD Size ===========>" $HDD "Gb"
print_line
print_line "CPU Manufacturer ===>" $MAKER
print_line "CPU Model ==========>" $MODEL
print_line "CPU Cores ==========>" $CORES
print_line "CPU Clock ==========>" $CLOCK "MHz"
