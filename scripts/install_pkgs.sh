#!/bin/bash
set -e

USER='martin'

if [[ $1 == "" ]]; then
    printf $'\e[31mERROR:\e[0m You must supply the path to the folder containing the required configuration files of your device!\n'
    printf $'Example: ./install_pkgs.sh RP4_1 192.168.1.101\n'
    exit 1
fi

if [[ $2 == "" ]]; then
    printf $'\e[31mERROR:\e[0m You must supply either the IP or FQDN of the device on which you whish to install the packages.!\n'
    printf $'Example: ./install_pkgs.sh RP4_1 192.168.1.101\n'
    exit 1
fi

RPI_FOLDER=$1
HOST=$2

if ! ping -c 1 $HOST &> /dev/null; then
    printf $'\e[31mERROR:\e[0m device at '"$HOST"$' doesn\'t seem to be up on the network!\n'
    exit 1
fi
printf $'Device at \e[33m'"$HOST"$'\e[0m found.\n'

printf $'\e[34mInstalling packages \e[0m\n'

PACKAGES=`cat $RPI_FOLDER/configs/packages.sh`
CMD="${PACKAGES} && exit || exit;exec bash"
ssh $USER@$HOST -t "${CMD}"
printf $'\e[32mDone !\e[0m\n'

exit 0
