#!/bin/bash
echo "Enter domain: "
read $DOMAIN
echo "Enter name of DC: "
read $DC
echo "Enter local ip of your DC: "
read $IP
sudo apt-get install ca-certificates apt-transport-https debian-archive-keyring -y
sudo echo -e "deb http://download.astralinux.ru/astra/stable/1.7_x86-64/1.7.1/repository-base 1.7_x86-64 main non-free contrib" | sudo tee -a /etc/apt/sources.list
sudo echo -e "deb http://download.astralinux.ru/astra/stable/1.7_x86-64/1.7.1/repository-extended 1.7_x86-64 main contrib non-free" | sudo tee -a /etc/apt/sources.list
sudo apt-get update && sudo apt-get upgrade -y
sudo apt install astra-freeipa-server curl wget vim -y
sudo astra-freeipa-server -d $DOMAIN -n $DC ip $IP -o
