#!/bin/bash

cp /root/firstboot/os-release /etc/os-release # set os details
cp /root/firstboot/os-release /etc/initrd-release
cp /root/firstboot/os-release /usr/lib/os-release

cp /root/firstboot/sudoers /etc/ # ferdi's stuff
cp /root/firstboot/pacman.conf /etc

cd /root/firstboot # install uwufetch
git clone https://github.com/femarch/based-uwufetch
cd based-uwufetch
make
mkdir -pv /usr/bin /usr/lib/uwufetch /usr/share/man/man1 /etc/uwufetch
cp uwufetch /usr/bin
cp libfetch.so /usr/lib
cp fetch.h /usr/include
cp -r res/* /usr/lib/uwufetch
cp default.config /etc/uwufetch/config
cp ./uwufetch.1.gz /usr/share/man/man1

rm -rf /root/firstboot