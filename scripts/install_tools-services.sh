#!/bin/bash
set -e

USER='martin'

while [[ $# -gt 0 ]]; do
    arg="$1"
    case $arg in
        -h|--host)
        HOST="$2"
        shift 
        shift 
        ;;
        -f|--folder)
        RPI_FOLDER="$2"
        shift 
        shift 
        ;;
        -u|--user)
        USER="$2"
        shift 
        shift 
        ;;
        -s|--services)
        MODE="services"
        shift 
        ;;
        -t|--tools)
        MODE="tools"
        shift 
        ;;
        *)  
        printf $'\e[31mERROR:\e[0m Unknown argument '"$1"'\n'
        exit 1
        ;;
    esac
done


if [[ $RPI_FOLDER == "" ]]; then
    printf $'\e[31mERROR:\e[0m You must supply the path to the folder containing the required configuration files of your device!\n'
    printf $'Example: ./install_services.sh -t -f RP4_1 -h 192.168.1.101\n'
    exit 1
fi

if [[ $HOST == "" ]]; then
    printf $'\e[31mERROR:\e[0m You must supply either the IP or FQDN of the device on which you whish to install the packages.!\n'
    printf $'Example: ./install_services.sh -t -f RP4_1 -h 192.168.1.101\n'
    exit 1
fi

if [[ $MODE == "" ]]; then
    printf $'\e[31mERROR:\e[0m You must supply a mode. Either -t to install the tools or -s for the services!\n'
    printf $'Example: ./install_services.sh -t -f RP4_1 -h 192.168.1.101\n'
    exit 1
fi

if ! ping -c 1 $HOST &> /dev/null; then
    printf $'\e[31mERROR:\e[0m device at '"$HOST"$' doesn\'t seem to be up on the network!\n'
    exit 1
fi
printf $'Device at \e[33m'"$HOST"$'\e[0m found.\n'

printf $'\e[34mInstalling '"$MODE"' \e[0m\n'

FOLDERS=$(ls $RPI_FOLDER/$MODE)
scp -qr $RPI_FOLDER/$MODE $USER@$HOST:/home/$USER/

for s in $FOLDERS; do
    printf $'\e[34mInstalling '$s' \e[0m\n'
    CMD="cd /home/$USER/$MODE/$s && sudo chmod +x install.sh && sudo ./install.sh && exit || exit;exec bash"
    ssh $USER@$HOST -t "${CMD}"
done

printf $'\e[32mDone !\e[0m\n'

exit 0
