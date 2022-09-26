#!/bin/bash
#This script install ALDPro. Version 1.0.0
#Use only hardnerd core, not generic!!! 
echo "Enter domain: "
read $DOMAIN
echo "Enter name of DC: "
read $DC
echo "Enter password: "
read $PASS
echo "Enter local ip of your DC: "
read $IP
sudo astra-modeswitch set 2
sudo apt-get install ca-certificates apt-transport-https vim curl-y
sudo echo -e "nameserver 127.0.0.1" | sudo tee -a /etc/resolv.conf
sudo echo -e "deb http://download.astralinux.ru/astra/stable/1.7_x86-64/1.7.1/repository-base 1.7_x86-64 main non-free contrib" | sudo tee -a /etc/apt/sources.list
sudo echo -e "deb http://download.astralinux.ru/astra/stable/1.7_x86-64/1.7.1/repository-extended 1.7_x86-64 main contrib non-free" | sudo tee -a /etc/apt/sources.list
sudo apt-get update && sudo apt-get upgrade -y
echo -e "deb https://download.astralinux.ru/aldpro/stable/repository-main/ 1.0.0 main" | sudo tee -a /etc/apt/sources.list
echo -e "deb https://download.astralinux.ru/aldpro/stable/repository-extended/ generic main" | sudo tee -a /etc/apt/sources.list
sudo touch /etc/apt/preferences.d/aldpro
sudo echo -e "Package: *" | sudo tee -a /etc/apt/preferences.d/aldpro
sudo echo -e "Pin: release n=generic" | sudo tee -a /etc/apt/preferences.d/aldpro
sudo echo -e "Pin-Priority: 900" | sudo tee -a /etc/apt/preferences.d/aldpro
sudo apt-get update && sudo apt-get upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install -q -y aldpro-mp
sudo apt-get install --fix-missing
sudo DEBIAN_FRONTEND=noninteractive apt-get install -q -y aldpro-mp
sudo /opt/rbta/aldpro/mp/bin/aldpro-server-install.sh -d $DOMAIN -n $DC -p $PASS --ip $IP --no-reboot 
