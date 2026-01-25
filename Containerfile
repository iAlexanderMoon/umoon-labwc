# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image
FROM ghcr.io/ublue-os/base-main:43

## Other possible base images include:
# FROM ghcr.io/ublue-os/base-main:latest
# FROM ghcr.io/ublue-os/bazzite:latest
# FROM ghcr.io/ublue-os/bluefin-nvidia:stable
# 
# ... and so on, here are more base images
# Universal Blue Images: https://github.com/orgs/ublue-os/packages
# Fedora base image: quay.io/fedora/fedora-bootc:41
# CentOS base images: quay.io/centos-bootc/centos-bootc:stream10

# Set variables for 
#ARG BASE_IMAGE_NAME="silverblue"
ARG FEDORA_MAJOR_VERSION="43"
#ARG IMAGE_NAME="bluefin"
#ARG IMAGE_VENDOR="ublue-os"
#ARG KERNEL="6.10.10-200.fc40.x86_64"
#ARG SHA_HEAD_SHORT="dedbeef"
#ARG UBLUE_IMAGE_TAG="stable"
#ARG VERSION=""
#ARG IMAGE_FLAVOR=""

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh
    
### LINTING
## Verify final image and contents are correct.
RUN bootc container lint
