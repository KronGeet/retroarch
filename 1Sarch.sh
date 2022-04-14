#!/bin/bash

# Arch Linux Fast Install - Быстрая установка Arch Linux https://github.com/ordanax/arch
# Цель скрипта - быстрое развертывание системы с вашими персональными настройками (конфиг XFCE, темы, программы и т.д.).
# Автор скрипта Алексей Бойко https://vk.com/ordanax

echo
loadkeys ru
setfont cyr-sun16

echo
timedatectl set-ntp true

echo
(
 echo g;

 echo n;
 echo 
 echo 1;
 echo +550M;
 echo ;
 echo t;
 echo 1;

 echo n;
 echo;
 echo;
 echo +2G;
 echo y;
 
  
 echo n;
 echo;
 echo;
 echo;
 echo y;
  
 echo w;
) | fdisk /dev/sda

echo
fdisk -l

echo

mkfs.fat -F32 /dev/sda1
mkfs.ext4  /dev/sda2
mkfs.ext4  /dev/sda3

echo
mount /dev/sda2 /mnt
mkdir /mnt/home
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
mount /dev/sda3 /mnt/home


echo "Server = http://mirror.yandex.ru/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist


pacstrap /mnt base base-devel linux linux-firmware nano

genfstab -U /mnt >> /mnt/etc/fstab
