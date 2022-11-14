#!/bin/bash
# Use only ifupdown, not NetworkManager
# Use only hardned core!
# Use FQDN to your hostname (like dc1.test.local)
# Change in /etc/hosts 127.0.1.1 on your FQDN name with short name
# Add in /etc/resolve.conf domain, search and your ip like nameserver 
echo -e "Enter domain>> "
read $DOMAIN
echo -e "Enter ip>> "
read $IP
echo -e "Enter your hostname"
read $HOST
echo -e "Enter password>> "
read $PASSWD
astra-modeswitch set 2
apt-get install ca-certificates apt-transport-https -y
echo -e "deb http://download.astralinux.ru/astra/frozen/1.7_x86-64/1.7.1/repository-base 1.7_x86-64 main non-free contrib" | sudo tee -a /etc/apt/sources.list
echo -e "deb http://download.astralinux.ru/astra/frozen/1.7_x86-64/1.7.1/repository-extended 1.7_x86-64 main contrib non-free" | sudo tee -a /etc/apt/sources.list
apt-get update && sudo apt-get upgrade -y
apt-get install vim curl wget -y
echo -e "deb https://download.astralinux.ru/aldpro/stable/repository-main/ 1.1.2 main" | sudo tee -a /etc/apt/sources.list.d/aldpro.list
echo -e "deb https://download.astralinux.ru/aldpro/stable/repository-extended/ generic main" | sudo tee -a /etc/apt/sources.list.d/aldpro.list
touch /etc/apt/preferences.d/aldpro
echo -e "Package: *" | sudo tee -a /etc/apt/preferences.d/aldpro
echo -e "Pin: release n=generic" | sudo tee -a /etc/apt/preferences.d/aldpro
echo -e "Pin-Priority: 900" | sudo tee -a /etc/apt/preferences.d/aldpro
sudo apt-get update && sudo apt-get upgrade -y
DEBIAN_FRONTEND=noninteractive apt-get install -q -y aldpro-mp
/opt/rbta/aldpro/mp/bin/aldpro-server-install.sh -d $DOMAIN -n $HOST -p $PASSWD --ip $IP --no-reboot
