#! /bin/bash


apt-get update && apt-get install vim
apt-get remove docker docker-engine docker.io containerd runc
apt-get update
apt-get install \
	ca-certificates \
	curl \
	gnupg \
	lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

swapoff -a

echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io
apt-get update && apt-get install -y apt-transport-https curl

apt install make
snap install go --classic
apt install gcc


wget https://github.com/kubeedge/kubeedge/releases/download/v1.9.1/keadm-v1.9.1-linux-amd64.tar.gz
tar -xvsf keadm-v1.9.1-linux-amd64.tar.gz
