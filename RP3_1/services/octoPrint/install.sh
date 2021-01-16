#!/bin/bash

sudo apt-get install wiringpi -y
sudo chown root.martin /dev/mem
sudo chmod g+rw /dev/mem

python3 -m venv venv
source venv/bin/activate
pip install pip --upgrade pip
pip install octoprint

sudo cp ./configs/octoprint.service /etc/systemd/system/octoprint.service

sudo systemctl enable octoprint.service
sudo service octoprint start

sudo cp ./configs/config.yaml ~/.octoprint/config.yaml #DID NOT WORK - do it manually for now
sudo service octoprint restart