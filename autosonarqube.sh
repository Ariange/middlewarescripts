#!/bin/bash

#author: Arielle Paana
#Description: Automatic installation and configuration of sonarqube into centos 7

echo "Ready to install sonarqube"
echo -e "\n step1: system update \n"
sleep 2

    sudo yum update -y
    if [ $? -ne 0 ]
    then
        echo "system update failed"
        exit 2
    fi

echo -e "\n step2: java-11-openjdk-devel installation \n"
sleep 2
    sudo yum install java-11-openjdk-devel -y
    if [ $? -ne 0 ]
    then
        echo "java-devel installation failed"
        exit 3
    fi

    sudo yun install java-11-openjdk -y
    if [ $? -ne 0 ]
    then
        echo "java installation failed"
        exit 4
    fi
echo -e "\n step3: installation of lastest versions of sonarqube"
sleep 2
    cd /opt
    sudo yum install wget -y
    sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
    sudo yum install unzip
    sudo unzip /opt/sonarqube-9.3.0.51899.zip
    sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
    cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
echo -e "\n step4: starting sonarqube \n"
sleep 2
    ./sonar.sh
    echo -e "\n done. use this address to connect \n"
    hostname -I | awk -F" " '{print $2}'
    echo "${ip}:9000"
    
    