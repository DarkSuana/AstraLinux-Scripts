hostnamectl set-hostname prod
apt-get update && apt-get upgrade -y
apt-get install iptables openssh-server ca-certificates curl gnupg lsb-release-y
echo -e "PermitRootLogin yes" | tee -a /etc/ssh/sshd_config
systemctl restart ssh
echo -e "post-up iptables -t nat -A POSTROUTING -o enp1s0 -j MASQUERADE" | tee -a /etc/network/interfaces
systemctl restart networking
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
