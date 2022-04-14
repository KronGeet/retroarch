#!/bin/bash

timedatectl set-ntp true

sleep 2

(
echo g;
echo n;
echo 1;
echo;
echo +550M;
echo;
echo n;
echo 2;
echo;
echo +2G;
echo;
echo n;
echo 3;
echo;
echo ;
echo t;
echo 1;
echo 1;
echo t;
echo 2;
echo 19;

echo w;
) | fdisk /dev/sda

fdisk -l
sleep 5
mkfs.fat -F32 /dev/sda1
sleep 5
mkfs.ext4  /dev/sda3
slwwp 5
mount  /dev/sda3  /mnt 
sleep 5
mkdir  /mnt/boot
sleep 5
mount  /dev/sda1  /mnt/boot
sleep 5
mkswap  /dev/sda2
sleep 5
swapon  /dev/sda2
sleep 5
echo "Server = http://mirror.yandex.ru/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel linux linux-firmware nano

genfstab -U /mnt >> /mnt/etc/fstab
