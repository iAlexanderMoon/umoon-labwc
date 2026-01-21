#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

cp /ctx/yum.repos.d/docker-ce.repo /etc/yum.repos.d/docker-ce.repo
cp /ctx/yum.repos.d/vscode.repo /etc/yum.repos.d/vscode.repo

# Load package list for install from packages.list
packages=`sed -E '/^[[:blank:]]*(#|;|$)/d; s/[[:blank:]]*(#|;).*//' packages.list | tr '\n' ' '`
dnf install -y ${packages}

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
echo PRETTY_PRINT=\"UMOON-LABWC\" > /etc/os-release
