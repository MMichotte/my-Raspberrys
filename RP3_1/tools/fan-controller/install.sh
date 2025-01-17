#!/bin/bash
# see : https://howchoo.com/g/ote2mjkzzta/control-raspberry-pi-fan-temperature-python
set -e

git clone https://github.com/Howchoo/pi-fan-controller.git
sudo apt install python3-pip
sudo pip3 install -r pi-fan-controller/requirements.txt

./pi-fan-controller/script/install