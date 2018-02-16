#!/bin/bash

# This script installs Docker CE on Ubuntu.
# Tested on AWS on a t2.medium 2018-02-03.


sudo apt-get update

sudo apt-get install -y    \
    apt-transport-https     \
    ca-certificates     \
    curl     \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install -y docker-ce

sudo adduser ubuntu docker

echo "You'll need to log off and back on to be able to run 'sudo docker hello-world', but you should be able to do that now!"

echo "installing pip"

apt install -y python-pip

pip install --upgrade pip

echo "alias python=python3
" >> /home/ubuntu/.bashrc

pip install jupyter
