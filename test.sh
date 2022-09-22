hostnamectl set-hostname test
apt-get update && apt-get upgrade -y
apt-get install openssh-server ca-certificates curl gnupg lsb-release -y
echo -e "PermitRootLogin yes" | tee -a /etc/ssh/sshd_config
systemctl restart ssh
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
curl -L https://github.com/docker/compose/releases/download/v2.0.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
