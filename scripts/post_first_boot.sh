#!/bin/bash

set -e

USER='martin'

if [[ $1 == "" ]]; then
    printf $'\e[31mERROR:\e[0m You must supply either the IP or FQDN of the device on which you whish to install the packages.!\n'
    printf $'Example: ./post_config.sh 192.168.1.101\n'
    exit 1
fi

HOST=$1

if ! ping -c 1 $HOST &> /dev/null; then
    printf $'\e[31mERROR:\e[0m device at '"$HOST"$' doesn\'t seem to be up on the network!\n'
    exit 1
fi

printf $'Device at \e[33m'"$HOST"$'\e[0m found.\n'

printf $'\n\e[34mRunning post-install. \e[0m \n'
CMD="sudo dpkg --configure -a \
    && sudo apt update -y && sudo apt upgrade -y \
    && sudo apt-get update -y && sudo apt-get upgrade -y \
    && sudo apt install net-tools \
    && sudo apt install -y network-manager \
    && exit || exit;exec bash"
ssh $USER@$HOST -t "${CMD}"
printf $'\e[32mDone !\e[0m\n'

exit 0
