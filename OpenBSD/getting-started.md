# Getting started on OpenBSD

## To-dos for improving the OpenBSD desktop experience

-   Improvements to desktop-environment packages (LXQT, Mate, etc.)
-   Inclusion of auto-media-format from the other BSDs (sysutils/auto-admin)
-   Add more configuration options to desktop-installer
-   Binary updates / security patches for the OpenBSD base system
-   Optimization to `sysctl.conf` & other tweaks (maybe?)

## System requirements

- 1 GiB RAM minimum
    - More if building large packages like gcc, clang
    - More if running Gnome or KDE
- 30 GB disk space in /usr/local
- If running under VirtualBox
    - Download the OpenBSD installer ISO image
    - Set pointing device to USB tablet
    - *Don't* use dynamically allocated disk space
    - Disable I/O APIC under System Settings
    - 2 or more cores
    - Boot order: Hard Disk first, then Optical (This will cause the
	VM to boot from the
	ISO image before install and the hard disk after)
    - Load the ISO image into the virtual optical drive under Storage

## Post-installation

Do the following as the root user:

```
pkg_add -u
pkg_add desktop-installer
desktop-installer

# Follow the instructions on the screen to set up your desktop system.
# If you do not understand a particular question asked by desktop-installer,
# accepting the default response should be fine in most cases.
```