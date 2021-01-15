#!/bin/bash
set -e

if [[ $1 == "" ]]; then
    printf $'\e[31mERROR:\e[0m You must supply the path to the folder containing the required configuration files of your device!\n'
    exit 1
fi

RPI_FOLDER=$1
BOOT_SD='/Volumes/system-boot/'

printf $'\e[34mStarting SD-card configuration of : \e[33m'"$RPI_FOLDER"$'\e[0m.\n'

if [ ! -d "$BOOT_SD" ]; then
    printf $'\e[31mERROR:\e[0m Couldn\'t find \e[31m'"$BOOT_SD"$'\e[0m Check that the burnt SD-card is mounted and retry!\n'
    exit 1
fi

printf $'...Configuring boot drive...\n'
chmod 777 $RPI_FOLDER/configs/system-boot/*
cp $RPI_FOLDER/configs/system-boot/* $BOOT_SD
#touch $BOOT_SD/ssh
diskutil eject $BOOT_SD
printf $'\e[32mBoot drive configured\e[0m, insert SD-card in your raspberry and let it boot.\n'

exit 0
