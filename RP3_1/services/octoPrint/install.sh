#!/bin/bash

python3 -m pip install --upgrade pip
pip3 install virtualenv
 
virtualenv OctoPrint 
OctoPrint/bin/pip install OctoPrint

# TODO set as daemon etc
./OctoPrint/bin/octoprint serve