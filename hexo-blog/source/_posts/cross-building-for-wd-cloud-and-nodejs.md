---
title: Cross-building for WD Cloud and nodejs
tags:
  - arm
  - nodejs
  - wdcloud
id: 6851
categories:
  - Development
date: 2015-03-14 16:30:41
---

WD Cloud runs Debian Linux on ARM. When you build application for other architecture you need to have cross-building. I have successfully built package on Ubuntu 14 by following [this post](http://community.wd.com/t5/WD-My-Cloud/GUIDE-Building-packages-for-the-new-firmware-someone-tried-it/td-p/768007/page/2) with a few note,

If you see error message like
```Err http://ftp.debian.org wheezy-updates Release.gpg Could not resolve 'ftp.debian.org'```

{% codeblock lang:shell %}
copy /etc/resolv.conf into buld/etc, e.g.,
sudo cp /etc/resolv.conf build/etc
{% endcodeblock %}

Please check [here](/usefulinformation/download-links-for-wd-cloud-firmwares/) for a list of Wd Cloud firmware images.
# Summary of cross-building with wheezy for WD Cloud firmware version 4 or above

{% codeblock lang:shell %}
# required for cross-building
apt-get install qemu-user-static
apt-get install binfmt-support

# folder for building
mkdir wdmc-build
cd wdmc-build

# download location can be found in http://support.wdc.com/product/download.asp?groupid=904&amp;lang=en
wget http://download.wdc.com/gpl/gpl-source-wd_my_cloud-04.01.03-421.zip

unzip gpl-source-wd_my_cloud-04.01.03-421.zip packages/build_tools/debian/*
mkdir 64k-wheezy
cp -R packages/build_tools/debian/* ./64k-wheezy
echo '#!/bin/bash' &gt; 64k-wheezy/build.sh
echo './build-armhf-package.sh --pagesize=64k $1 wheezy' &gt;&gt; 64k-wheezy/build.sh
chmod a+x 64k-wheezy/build.sh

cd 64k-wheezy
# the setup script will prompt for root password during chroot
./setup.sh bootstrap/wheezy-bootstrap_1.24.14_armhf.tar.gz build

sudo mv build/usr/bin/qemu-arm-static build/usr/bin/qemu-arm-static_orig
sudo cp /usr/bin/qemu-arm-static build/usr/bin/qemu-arm-static

# override build/etc/apt/sources.list
sudo echo "deb http://security.debian.org/ wheezy/updates main contrib non-free" &gt; build/etc/apt/sources.list
sudo echo "deb-src http://security.debian.org/ wheezy/updates main contrib non-free" &gt;&gt; build/etc/apt/sources.list
sudo echo "deb http://ftp.debian.org/debian wheezy-updates main contrib non-free" &gt;&gt; build/etc/apt/sources.list
sudo echo "deb-src http://ftp.debian.org/debian wheezy-updates main contrib non-free" &gt;&gt; build/etc/apt/sources.list
sudo echo "deb http://ftp.debian.org/debian wheezy main contrib non-free" &gt;&gt; build/etc/apt/sources.list
sudo echo "deb-src http://ftp.debian.org/debian wheezy main contrib non-free" &gt;&gt; build/etc/apt/sources.list
# optional until you need to use backports packages
sudo echo "deb http://ftp.debian.org/debian wheezy-backports main contrib non-free" &gt;&gt; build/etc/apt/sources.list
sudo echo "deb http://ftp.debian.org/debian wheezy-backports main contrib non-free" &gt;&gt; build/etc/apt/sources.list

sudo cp /etc/resolv.conf build/etc
{% endcodeblock %}

Then you can build by running build.sh with package name, e.g,
{% codeblock lang=shell %}
./build.sh joe
{% endcodeblock%}

It will download the source package from the repository, cross-compile it and build a deb file. The process could take over 10 minutes. Once it is success you can scp the .deb file to your router and install it with ```dpkg -i```

# Building Node.JS Manually

It is a little tricky to build nodejs because the source is not in the repository. I have tried to use binary from http://nodejs.org/dist/v0.12.0/node-v0.12.0-linux-x86.tar.gz but it is Killed for failed with
```cannot execute binary file```
You can follow the scripts to build it manually,
{% codeblock lang:shell %}
# setup utils
./setup.sh bootstrap/wheezy-bootstrap_1.24.14_armhf.tar.gz build
sudo mkdir -p build/root/binutils
sudo tar vfx binutils/binutils-armhf-64k.tar.gz -C build/root/binutils
sudo chroot build /bin/bash
cd /root/binutils
dpkg -i binutils_*.deb
dpkg -i binutils-multiarch_*.deb
export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true
export LC_ALL=C
export LANGUAGE=C
export LANG=C
export DEB_CFLAGS_APPEND='-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE'
export DEB_BUILD_OPTIONS=nocheck
cd /root

# now the build environment is ready
wget http://nodejs.org/dist/v0.12.0/node-v0.12.0.tar.gz
tar vfxz node-v0.12.0.tar.gz
cd node-v0.12.0
./configure
make

# go back to original environment
exit
{% endcodeblock %}
The binary is ready in build/root/node-v0.12.0/node for you to upload to the WD Cloud. You can upload to /usr/local/bin in your WD Cloud

You also need to download npm and etc from http://nodejs.org/dist/v0.12.0/node-v0.12.0-linux-x86.tar.gz
Extract the files and put them to either /usr/local or /usr.
{% codeblock lang:shell %}
wget http://nodejs.org/dist/v0.12.0/node-v0.12.0-linux-x86.tar.gz
tar vfxz node-v0.12.0-linux-x86.tar.gz
cd node-v0.12.0-linux-x86
rm bin/node
cp -R include /usr/local
cp -R share /usr/local
cp -R lib /usr/local
cp -R bin /usr/local
{% endcodeblock %}
Remember do not override the binary you have uploaded.

# Package list

Below is a list of packages I have successfully built,

*   htop
*   joe
*   unrar
*   transmission
  *   libcurl3-gnutls
  *   libminiupnpc5
  *   libnatpmp1
  *   transmission-common
  *   transmission-daemon

*   nodejs prerequsities
  *   libc-ares2
  *   libv8

*   python3-pip
  *   libcurl3-gnutls
  *   python2.6
  *   python3
  *   python3-pkg-resources
  *   python3-setuptools
  *   python-pkg-resources
  *   python-setuptools

*   liberror-perl (required for git)
*   git
*   rrdtool (required for cacti)
*   virtual-mysql-client (required for cacti)
*   php5-mysql (required for cacti)
*   dbconfig-common (required for cacti)
*   libphp-adodb (required for cacti)
*   snmp (required for cacti)
*   php5-snmp (required for cacti)
*   cacti

Packages are upload to [https://app.box.com/wdcloud](https://app.box.com/wdcloud target=_blank)

Script to build,
{% gist 1629e9a9bf266fb4abfc %}
