# WARNING. This script is not general use. It is specifically designed to fix
# the boot partition on my mac book after an OSX upgrade wipes it.

echo assume already ran:
echo mount /dev/sda5 /mnt
echo arch-chroot /mnt

mount /dev/sda3 /boot
mount /dev/sda1 /boot/efi
# maybe just `mount -a` instead

pacman -S linux
mkinitcpio -p linux
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub --recheck --debug
grub-mkconfig -o /boot/efi/EFI/grub/grub.cfg

echo Remember to run umount -R /mnt before reboot
exit
