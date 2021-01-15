#!/bin/bash

USER='martin'

## UPDATING PACKAGES ##
printf $'\e[32m UPDATING PACKAGES \e[0m\n'
sudo apt-get update -y && sudo apt-get upgrade -y

## DOCKER ## 
printf $'\e[32m DOCKER \e[0m\n'
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=arm64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
sudo apt-get install docker-compose -y
sudo docker run hello-world
