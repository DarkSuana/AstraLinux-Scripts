sudo apt-get install debian-archive-keyring
sudo apt-get install gpg
echo -e "deb [trusted=yes] https://mirror.yandex.ru/debian/ buster main contrib non-free" | sudo tee -a /etc/apt/sources.list
gpg --keyserver keyserver.ubuntu.com --recv-key 648ACFD622F3D138
gpg -a --export 648ACFD622F3D138 | sudo apt-key add -
gpg --keyserver keyserver.ubuntu.com --recv-key 0E98404D386FA1D9
gpg -a --export 0E98404D386FA1D9 | sudo apt-key add -
gpg --keyserver keyserver.ubuntu.com --recv-key DCC9EFBF77E11517
gpg -a --export DCC9EFBF77E11517 | sudo apt-key add -
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install snapd -y
