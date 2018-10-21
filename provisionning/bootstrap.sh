#!/bin/bash

sudo yum install -y epel-release
sudo yum update
sudo yum install -y net-tools
#sudo yum groupinstall -y "Development Tools"
sudo yum install -y python-devel
sudo yum install -y ansible