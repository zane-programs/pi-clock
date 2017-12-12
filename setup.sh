#!/bin/bash

curl -sLS http://apt.adafruit.com/add-pin/;

# NODE: thanks to http://weworkweplay.com/play/raspberry-pi-nodejs/
wget http://node-arm.herokuapp.com/node_latest_armhf.deb;
dpkg -i node_latest_armhf.deb;

# CHROMIUM: thanks to https://www.raspberrypi.org/forums/viewtopic.php?t=121195
wget -qO - http://bintray.com/user/downloadSubjectPublicKey?username=bintray | sudo apt-key add -;
echo "deb http://dl.bintray.com/kusti8/chromium-rpi jessie main" | sudo tee -a /etc/apt/sources.list;

# update before installing stuff
apt-get update;
apt-get upgrade;

# install all needed packages
apt-get install node raspberrypi-bootloader adafruit-pitft-helper raspberrypi-kernel chromium-browser php5-cgi -y;

# install node packages
npm install express express-php;
