#!/bin/bash

USER='martin'

## UPDATING PACKAGES ##
printf $'\e[32m UPDATING PACKAGES \e[0m\n'
sudo apt-get update -y && sudo apt-get upgrade -y

## OCTOPRINT ## 
printf $'\e[32m OCTOPRINT \e[0m\n'

sudo apt-get install -y \
    python3-pip \
    python3-dev \
    python3-setuptools \
    python3-venv