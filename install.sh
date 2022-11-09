#!/bin/bash

cd /root/femarch-bootstrap
xdg-icon-resource install --size 512 femarch-logo.png # install femarch logo

cp /root/femarch-bootstrap/os-release /etc/os-release # set os details
cp /root/femarch-bootstrap/os-release /etc/initrd-release
cp /root/femarch-bootstrap/os-release /usr/lib/os-release

cp /root/femarch-bootstrap/sudoers /etc/ # ferdi's stuff
cp /root/femarch-bootstrap/pacman.conf /etc

cd /root/femarch-bootstrap # install uwufetch
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

pacman-key --init
gpg --import /usr/share/pacman/keyrings/femarch.gpg
pacman-key --add /usr/share/pacman/keyrings/femarch.gpg
pacman-key --lsign-key 7062A8668D1D930BF985FD5DB52216032B237E33


pacman -Sy calamares

touch /bootstrap.ran
rm -rf /root/femarch-bootstrap
