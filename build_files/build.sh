#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

cp /ctx/yum.repos.d/docker-ce.repo /etc/yum.repos.d/docker-ce.repo
cp /ctx/yum.repos.d/vscode.repo /etc/yum.repos.d/vscode.repo

# From base image: desktop
#
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
	wlsunset \
	xdg-desktop-portal-gtk \
	xdg-desktop-portal-wlr \
	sway \
	sway-config-fedora \
	swaybg \
	swayidle \
	swaylock \
	Thunar \
	thunar-archive-plugin \
	labwc \
	wlopm \
	chayang \
       	mako \
	wofi \
	wlrctl	

# From base image:  applications
# 	firefox
dnf install -y \
	thunderbird \
	libreoffice \
	gimp \
	inkscape \
	mpv \
	vlc \
	sound-juicer \
	picard

# From base image: Developer Tools
# 	toolbox
# 	distrobox
# 	podman
# 	just
#	qemu
#
dnf install -y \
	make \
	neovim \
	helix \
	code \
       	containerd.io \
	docker-ce \
	docker-ce-cli \
	docker-compose-plugin	

#NetworkManager-l2tp-gnome \
#NetworkManager-libreswan-gnome \
#NetworkManager-openconnect-gnome \
#NetworkManager-openvpn-gnome \
#NetworkManager-sstp-gnome \
#NetworkManager-vpnc-gnome \
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
#tuned-ppd
#tuned-switcher
#xarchiver
#xorg-x11-server-Xwayland

# Add labwc desktop option for wayland sessions
cp /ctx/labwc.desktop /usr/share/wayland-sessions/labwc.desktop

# Set some defaults I prefer
cp /ctx/foot.ini /etc/xdg/foot/foot.ini

# Setup Labwc globally as I prefer
cp -r /ctx/labwc /etc/xdg/.

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File
systemctl enable docker.socket


###  Change the name that will be used.
#awk '{sub(/PRETTY_NAME=.*/,"PRETTY_NAME=\"UMOON-LABWC\"")}1' /etc/os-release > /etc/os-release
