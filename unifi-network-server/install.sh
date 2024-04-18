#!/bin/bash

## Script by Daniel Burger
## https://planlos.xyz
## Release: 18.04.2024

## Unifi Network Application 8.1.113

## global Setup 
apt update
apt upgrade -y
apt install openjdk-17-jre-headless curl binutils -y
apt update
apt upgrade -y
apt autoremove -y




# download and install multiarch-support for Debian 12 (Bookwork)
if [ ! -f multiarch-support_2.28-10_amd64.deb ]
then
    wget http://snapshot.debian.org/archive/debian/20190501T215844Z/pool/main/g/glibc/multiarch-support_2.28-10_amd64.deb &&  sudo dpkg -i multiarch-support*.deb
else
    sudo dpkg -i multiarch-support*.deb
fi

# download and install libssl-support for Debian 12 (Bookwork)
if [ ! -f libssl1.0.0_1.0.2l-1~bpo8+1_amd64.deb ]
then
    wget http://snapshot.debian.org/archive/debian/20170705T160707Z/pool/main/o/openssl/libssl1.0.0_1.0.2l-1%7Ebpo8%2B1_amd64.deb && sudo dpkg -i libssl1.0.0*.deb
else
    sudo dpkg -i libssl1.0.0*.deb
fi


# download and install MongoDB 3.6.10 with all needed tools
if [ ! -f mongodb-org-mongos_3.6.23_amd64.deb ]
then
    wget https://repo.mongodb.org/apt/debian/dists/jessie/mongodb-org/3.6/main/binary-amd64/mongodb-org-mongos_3.6.23_amd64.deb && sudo dpkg -i mongodb-org-mongos_3.6.23_amd64.deb
else
    sudo dpkg -i mongodb-org-mongos_3.6.23_amd64.deb
fi

if [ ! -f mongodb-org-server_3.6.23_amd64.deb ]
then
    wget https://repo.mongodb.org/apt/debian/dists/jessie/mongodb-org/3.6/main/binary-amd64/mongodb-org-server_3.6.23_amd64.deb && sudo dpkg -i mongodb-org-server_3.6.23_amd64.deb
else
    sudo dpkg -i mongodb-org-server_3.6.23_amd64.deb
fi

if [ ! -f mongodb-org-shell_3.6.23_amd64.deb ]
then
    wget https://repo.mongodb.org/apt/debian/dists/jessie/mongodb-org/3.6/main/binary-amd64/mongodb-org-shell_3.6.23_amd64.deb && sudo dpkg -i mongodb-org-shell_3.6.23_amd64.deb
else
    sudo dpkg -i mongodb-org-shell_3.6.23_amd64.deb
fi

if [ ! -f mongodb-org-tools_3.6.23_amd64.deb]
then
    wget https://repo.mongodb.org/apt/debian/dists/jessie/mongodb-org/3.6/main/binary-amd64/mongodb-org-tools_3.6.23_amd64.deb && sudo dpkg -i mongodb-org-tools_3.6.23_amd64.deb
else
    sudo dpkg -i mongodb-org-tools_3.6.23_amd64.deb
fi

if [ ! -f mongodb-org_3.6.23_amd64.deb ]
then
    wget https://repo.mongodb.org/apt/debian/dists/jessie/mongodb-org/3.6/main/binary-amd64/mongodb-org_3.6.23_amd64.deb && sudo dpkg -i mongodb-org_3.6.23_amd64.deb
else
    sudo dpkg -i mongodb-org_3.6.23_amd64.deb
fi
# end of setup for MongoDB 3.6.10


# download and install UniFi Network Server / Application ###
if [ ! -f unifi_sysvinit_all.deb ]
then
    wget https://dl.ui.com/unifi/8.1.113/unifi_sysvinit_all.deb && sudo dpkg -i unifi_sysvinit_all.deb
else
    sudo dpkg -i unifi_sysvinit_all.deb
fi

# config startup management for database and unifi
sudo systemctl enable mongod
sudo systemctl start mongod

sudo systemctl enable unifi
sudo systemctl start unfi



# END

