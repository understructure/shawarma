#!/bin/bash

echo "Make sure you have your DOCKERURL environment variable set or this will not work!"

sudo -E sh -c 'echo "$DOCKERURL/rhel" > /etc/yum/vars/dockerurl'

sudo sh -c 'echo "7" > /etc/yum/vars/dockerosversion'

sudo yum install -y yum-utils \
    device-mapper-persistent-data \
    lvm2 \
    vim

sudo yum-config-manager --enable rhel-7-server-extras-rpms

# AWS-specific
sudo yum-config-manager --enable rhui-REGION-rhel-server-extras


sudo -E yum-config-manager \
    --add-repo \
    "$DOCKERURL/rhel/docker-ee.repo"

sudo yum -y install docker-ee

sudo systemctl enable docker

sudo systemctl start docker

sudo usermod -aG docker $USER
