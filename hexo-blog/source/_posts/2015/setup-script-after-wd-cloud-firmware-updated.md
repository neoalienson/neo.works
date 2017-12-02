---
title: Setup script after WD Cloud firmware updated
tags:
  - arm
  - wdcloud
id: 6943
categories:
  - Development
date: 2015-10-19 09:53:53
---

@[toc]

You lose all custom configurations whenever the WD Cloud firmware has updated. Below scripts help me to revert my settings,

## Update SSH server to use public key authentication
Login to root on the WD Cloud and create .ssh on the server side,
{% codeblock lang:bash %}
mkdir ~/.ssh
{% endcodeblock %}

Upload public key from your machine to the server, Replace _**nas**_ with your host/IP address.
{% codeblock lang:bash %}
scp ~/.ssh/id_rsa.pub root@_**nas**_:~/.ssh/authorized_keys
{% endcodeblock %}

on the server-side
{% codeblock lang:bash %}
chmod go-rwx ~/.ssh
sed -i.bak "s/PubkeyAuthentication no/PubkeyAuthentication yes/" /etc/ssh/sshd_config
/etc/init.d/ssh restart
{% endcodeblock %}

You can ssh to the nas without entering the password. In short,
{% codeblock lang:bash %}
# run it from you own machine
# prerequistes, you have generated a public/pair key pair in ~/.ssh

# configuration
export TARGET_SERVER=nas

ssh root@$TARGET_SERVER mkdir ~/.ssh
Upload public key from your machine to the server, Replace nas with your host/IP address.

scp ~/.ssh/id_rsa.pub root@nas:~/.ssh/authorized_keys
on the server-side

ssh root@$TARGET_SERVER << EOF
chmod go-rwx ~/.ssh
sed -i.bak "s/PubkeyAuthentication no/PubkeyAuthentication yes/" /etc/ssh/sshd_config
/etc/init.d/ssh restart
EOF
{% endcodeblock %}

If you do not want to build packages, you can download from [https://app.box.com/wdcloud](https://app.box.com/wdcloud). I will try to keep it up-to-date.

## Script to build general packages
Below script build packages such as transmission, joe, etc
{% codeblock lang:bash %}
# build useful component base on my personal preference WD Cloud (ubuntu, arm)

### configuration ###
# your WD cloud host name
export SERVER_HOST=nas

# target cloud version
WD_VERSION=04.04.02-105

### execute ###

# download and unpack the gpl source and build tools
wget http://download.wdc.com/gpl/gpl-source-wd_my_cloud-$WD_VERSION.zip
rm -rf packages
unzip gpl-source-wd_my_cloud-$WD_VERSION.zip packages/build_tools/debian/*

mkdir 64k-wheezy
cp -R packages/build_tools/debian/* ./64k-wheezy
echo '#!/bin/bash' > 64k-wheezy/build.sh
echo './build-armhf-package.sh --pagesize=64k $1 wheezy' >> 64k-wheezy/build.sh
chmod a+x 64k-wheezy/build.sh

cd 64k-wheezy
./setup.sh bootstrap/wheezy-bootstrap_1.24.14_armhf.tar.gz build

mv build/usr/bin/qemu-arm-static build/usr/bin/qemu-arm-static_orig
cp /usr/bin/qemu-arm-static build/usr/bin/qemu-arm-static

# override build/etc/apt/sources.list
echo "deb http://security.debian.org/ wheezy/updates main contrib non-free" > build/etc/apt/sources.list
echo "deb-src http://security.debian.org/ wheezy/updates main contrib non-free" >> build/etc/apt/sources.list
echo "deb http://ftp.debian.org/debian wheezy-updates main contrib non-free" >> build/etc/apt/sources.list
echo "deb-src http://ftp.debian.org/debian wheezy-updates main contrib non-free" >> build/etc/apt/sources.list
echo "deb http://ftp.debian.org/debian wheezy main contrib non-free" >> build/etc/apt/sources.list
echo "deb-src http://ftp.debian.org/debian wheezy main contrib non-free" >> build/etc/apt/sources.list
# optional until you need to use backports packages
echo "deb http://ftp.debian.org/debian wheezy-backports main contrib non-free" >> build/etc/apt/sources.list
echo "deb http://ftp.debian.org/debian wheezy-backports main contrib non-free" >> build/etc/apt/sources.list

cp /etc/resolv.conf build/etc

# exiv2
./build.sh exiv2

# editor
./build.sh joe
scp build/root/joe_*.deb root@$SERVER_HOST:~
ssh root@$SERVER_HOST dpkg -i joe_*.deb

# htop
./build.sh htop
scp build/root/htop_*.deb root@$SERVER_HOST:~
ssh root@$SERVER_HOST dpkg -i htop_*.deb

# unrar
./build.sh unrar
scp build/root/unrar_*.deb root@$SERVER_HOST:~
ssh root@$SERVER_HOST dpkg -i unrar_*.deb

# transmission
# below build process will be finished after an hour or so
./build.sh libcurl3-gnutls
./build.sh libminiupnpc5
./build.sh libnatpmp1
./build.sh transmission-common
./build.sh transmission-daemon
# upload
scp build/root/libcurl3-gnutls_*.deb root@$SERVER_HOST:~
scp build/root/libminiupnpc5_*.deb root@$SERVER_HOST:~
scp build/root/libnatpmp1_*.deb root@$SERVER_HOST:~
scp build/root/transmission-common_*.deb root@$SERVER_HOST:~
scp build/root/transmission-daemon_*.deb root@$SERVER_HOST:~
# install
ssh root@$SERVER_HOST dpkg -i libcurl3-gnutls_*.deb
ssh root@$SERVER_HOST dpkg -i libminiupnpc5_*.deb
ssh root@$SERVER_HOST dpkg -i libnatpmp1_*.deb
ssh root@$SERVER_HOST dpkg -i transmission-common_*.deb
ssh root@$SERVER_HOST dpkg -i transmission-daemon_*.deb
# the transmission daemon / web should be started
# if not, /etc/init.d/transmission-daemon start
# in case you have backup settings, upload settings and restart
# /etc/init.d/transmission-daemon restart

# nodejs
./build.sh libc-ares2
scp build/root/libc-ares2_*.deb root@$SERVER_HOST:~
ssh root@$SERVER_HOST dpkg -i libc-ares2_*.deb
# it takes an hour to build
./build.sh libv8
scp build/root/libv8-3*.deb root@$SERVER_HOST:~
ssh root@$SERVER_HOST dpkg -i libv8-3*.deb
wget https://nodejs.org/dist/v4.2.1/node-v4.2.1-linux-armv7l.tar.gz
tar vfxz node-v4.2.1-linux-armv7l.tar.gz
cd node-v4.2.1-linux-armv7l
{% endcodeblock %}
