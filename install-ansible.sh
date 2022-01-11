#!/bin/bash

sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository -y --update ppa:ansible/ansible
sudo apt install ansible
