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

mkfs.fat -F32 /dev/sda1
mkfs.ext4  /dev/sda3
mount  /dev/sda3  /mnt 
mkdir  /mnt/boot 
mount  /dev/sda1  /mnt/boot
mkswap  /dev/sda2
swapon  /dev/sda2

pacstrap /mnt base base-devel linux linux-firmware nano dhcpcd netctl

genfstab -pU /mnt >> /mnt/etc/fstab