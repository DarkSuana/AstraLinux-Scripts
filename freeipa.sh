#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install rng-tools -y
sudo echo -e "HRNGDEVICE=/dev/urandom">> /etc/default/rng-tools-debian
sudo apt-get install freeipa-*
