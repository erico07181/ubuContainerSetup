On your master node, clone this repo
Run the shell command "ubuntu-master-setup.sh" with sudo
On your worker nodes, clone the repo and run the "ubuntu-worker-setup.sh" with sudo

Once this has been done, your master and worker nodes should be setup to start a cluster

On the master node:
       Create a kubernetes cluster using: "sudo kubeadm init"
       Once created, the output should give you three commands you should run
       Once those are ran, you need to apply a CNI network provider, this guide uses calico which should be in your cloned 
       repo folder. Apply this CNI network provider with: "kubectl apply -f calico.yaml"
       Once this is created, we will create the cloudcore part of KubeEdge
            Change into your keadm directory: "cd keadm-v1.9.1-linux-amd64/keadm"
            Create the Cloudcore with "sudo ./keadm init --kube-config=$HOME/.kube/config --advertise-address=*master node 
            ip*
            This should output you with a join command, make sure to keep this available.
            

