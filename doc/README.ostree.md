# Rename ostree entries in boots after install
* The titles in the boot menu entries (e.g., Fedora Linux 41.1.4 (Silverblue) (ostree:1)) are defined by the title variable inside these .conf files.

* .conf files are generated during the kernel installed or rpm-ostree deployment by:
  * /usr/lib/kernel/install.d/90-loaderentry.install
  * uses $PRETTY_NAME and the kernel version
  * $PRETTY_NAME is set by the OS build process

```sh
ls /boot/loader.1/entries
ostree-1.conf ostree-2.conf ostree-3.conf
```
