#!/bin/sh 
apt-get update
apt-get upgrade
apt install apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add

echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" >> ~/kubernetes.list
sudo mv ~/kubernetes.list /etc/apt/sources.list.d

apt update
apt install kubelet
apt install kubeadm
apt install kubectl
apt-get install -y kubernetes-cri
apt-get install -y kubelet kubeadm kubectl kubernetes-cni
swapoff -a

cat <<EOF | tee /etc/docker/daemon.json
{ "exec-opts": ["native.cgroupdriver=systemd"],
}
EOF


