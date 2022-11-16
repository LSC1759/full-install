pacman -Syy archlinux-keyring &&
mkfs.fat -F 32 /dev/sda1 &&
mkswap /dev/sda2 &&
mkfs.ext4 /dev/sda3 &&
mount /dev/sda3 /mnt &&
swapon /dev/sda2 &&
mount --mkdir /dev/sda1 /mnt/boot/efi &&
pacstrap /mnt alacritty amd-ucode base base-devel blueman bluez bspwm efibootmgr firefox git grub htop intel-ucode jdk-openjdk linux linux-firmware linux-headers mpv nano net-tools networkmanager nitrogen obs-studio openssh papirus-icon-theme pavucontrol picom pipewire pipewire-alsa pipewire-jack pipewire-media-session pipewire-pulse polybar rofi sxhkd ttf-font-awesome unzip vim xorg xorg-xinit &&
genfstab -U /mnt > /mnt/etc/fstab &&
arch-chroot /mnt ln -sf /usr/share/zoneinfo/Asia/Tbilisi /etc/localtime &&
arch-chroot /mnt sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen &&
arch-chroot /mnt locale-gen &&
arch-chroot /mnt touch /etc/locale.conf &&
arch-chroot /mnt echo LANG=en_US.UTF-8 > /etc/locale.conf &&
arch-chroot /mnt touch /etc/hostname &&
arch-chroot /mnt echo archlinux > /etc/hostname &&
arch-chroot /mnt passwd &&
arch-chroot /mnt useradd -m -G wheel -s /bin/bash arch &&
arch-chroot /mnt passwd arch &&
arch-chroot /mnt sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers &&
arch-chroot /mnt grub-install /dev/sda &&
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg &&
arch-chroot /mnt systemctl enable bluetooth &&
arch-chroot /mnt systemctl enable NetworkManager &&
umount -a
