#!/bin/bash
#This script updates the aldpro server from 1.0.0 to version 1.1.0
sudo apt-get update && sudo apt-get upgrade -y
sudo rm -Rf /etc/apt/sources.list.d/aldpro.list
sudo echo -e "deb https://download.astralinux.ru/aldpro/stable/repository-main/ 1.1.0 main " | sudo tee -a /etc/apt/sources.list.d/aldpro.list
sudo echo -e "deb https://download.astralinux.ru/aldpro/stable/repository-extended/ generic main" | sudo tee -a /etc/apt/sources.list.d/aldpro.list
sudo apt-get update && sudo apt-get dist-upgrade -y
sudo systemctl enable dirsrv-watcher.timer
sudo systemctl enable dirsrv-watcher.service
sudo systemctl start dirsrv-watcher.timer
sudo systemctl syaty dirsrv-watcher.service
sudo reboot 
