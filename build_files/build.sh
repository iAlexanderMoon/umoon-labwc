#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Sway
dnf install -y \
	sddm \
	sddm-wayland-sway \
	foot \
	kanshi \
	slurp \
	grim \
	imv \
	waybar \
	wev \
	wl-clipboard \
	wlr-randr \
	sway \
	sway-config-fedora \
	swaybg \
	swayidle \
	swaylock

# Labwc
dnf install -y \
	labwc 
#dnf5 -y install wlopm
#dnf5 -y install chayang

#NetworkManager-l2tp-gnome \
#NetworkManager-libreswan-gnome \
#NetworkManager-openconnect-gnome \
#NetworkManager-openvpn-gnome \
#NetworkManager-sstp-gnome \
#NetworkManager-vpnc-gnome \
#Thunar \
#blueman \
#bolt \
#dunst \
#fprintd-pam
#gnome-keyring-pam
#gvfs
#gvfs-smb
#lxqt-policykit
#mesa-dri-drivers
#mesa-vulkan-drivers
#network-manager-applet
#pavucontrol
#pinentry-gnome3
#playerctl
#plymouth-system-theme
#polkit
#pulseaudio-utils
#system-config-printer
#thunar-archive-plugin
#tuned-ppd
#tuned-switcher
#wlsunset
#xarchiver
#xdg-desktop-portal-gtk
#xdg-desktop-portal-wlr
#xorg-x11-server-Xwayland



# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
