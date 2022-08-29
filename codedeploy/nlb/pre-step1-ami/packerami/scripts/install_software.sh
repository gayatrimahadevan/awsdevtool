#!/bin/bash
sudo apt-get update -y
sudo apt install openjdk-17-jre-headless -y
sudo apt-get install ruby -y
sudo apt-get install wget -y
cd /home/ubuntu
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo apt-get install net-tools
sudo mv quote.service /etc/systemd/system/
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt-get install unzip
unzip awscliv2.zip
sudo ./aws/install
rm install
rm awscliv2.zip
rm -fr aws
