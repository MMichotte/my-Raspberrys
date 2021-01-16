#!/bin/bash

COMMAND=$1
ARG=$2

# turn the light on
if [ $1 == Lon ];
then
    gpio export 18 out #light
    gpio -g write 18 0
fi

# turn the light off
if [ $1 == Loff ];
then
    gpio export 18 out #light
    gpio -g write 18 1
fi

# turn the printer on
if [ $1 == Pon ];
then
    gpio export 23 out #printer
    gpio -g write 23 0
    #sleep 10
    #sh /home/martin/services/OctoPrint/api/connect.sh
fi

# set NOSHUT variable 
if [ $1 == Ns ];
then
    if [ $2 == 0 ];
    then
        echo 0 > /home/martin/services/OctoPrint/scripts/noShut.var
    elif [ $2 == 1 ];
    then
        echo 1 > /home/martin/services/OctoPrint/scripts/noShut.var
    fi
fi

# turn the printer off if no shut is set to 0
if [ $1 == Poff ];
then
    NOSHUT=`cat noShut.var`
    if [[ $NOSHUT == 0 ]] || [[ $2 == 'f' ]];
    then
        gpio export 23 out #printer
        gpio -g write 23 1
    else
        sh /home/martin/services/OctoPrint/api/setTemp.sh
    fi
fi
