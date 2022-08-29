#!/bin/bash
sudo yum update -y
sudo yum install wget -y
wget https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_linux-x64_bin.tar.gz
tar xvf openjdk-17_linux-x64_bin.tar.gz
sudo mv jdk-17 /opt/
sudo tee /etc/profile.d/jdk.sh <<EOF
export JAVA_HOME=/opt/jdk-17
export PATH=\$PATH:\$JAVA_HOME/bin
EOF
source /etc/profile.d/jdk.sh
sudo yum install ruby -y
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo yum -y install net-tools.x86_64
sudo mv quote.service /etc/systemd/system/
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo yum install unzip -y
unzip awscliv2.zip
sudo ./aws/install
rm install
rm awscliv2.zip
rm -fr aws
rm openjdk-17_linux-x64_bin.tar.gz
