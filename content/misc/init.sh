#!/bin/bash
mount /dev/sdb2 /mnt
mount /dev/sdb1 /mnt/home
mount /dev/sda1 /mnt/boot
mount -t proc proc /mnt/proc
mount --rbind /sys /mnt/sys
mount --rbind /dev /mnt/dev
mount --make-rslave /mnt/sys
mount --make-rslave /mnt/dev
chroot /mnt /bin/bash
