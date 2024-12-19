# Getting started on OpenBSD

## To-dos for improving the OpenBSD desktop experience

-   Improvements to desktop-environment packages (LXQT, Mate, etc.)
-   Inclusion of auto-media-format from the other BSDs (sysutils/auto-admin)
-   Qmediamanager
-   Openbsd-update-notify (port freebsd-update-notify)
-   Add more configuration options to desktop-installer
-   Binary updates / security patches for the OpenBSD base system
-   Optimization to `sysctl.conf` & other tweaks (maybe?)

## System requirements

- 1 GiB RAM minimum
    - More if building large packages like gcc, clang
    - More if running Gnome or KDE
- Minimum 30 GB disk space in /usr/local
- If running under VirtualBox:
    - Download the OpenBSD installer ISO image from
      [https://openbsd.org](https://openbsd.org).
    - Set pointing device to USB tablet.
    - Caution: Some OpenBSD users have reported problems when using
      dynamically allocated disk images.
    - Caution: Some users have reported trouble with I/O APIC.
      If you encounter problems, try disabling it under System Settings.
    - 2 or more cores will improve performance, but this has been known
      to cause system freezes in some cases.
    - The paravirtualized network driver may offer the best performance.
    - Boot order: Hard Disk first, then Optical (This will cause the
      VM to boot from the ISO image before install and the hard disk after.)
    - Load the ISO image into the virtual optical drive under Storage.

## Post-installation

When adding new users via adduser(8) or auto-adduser(8), note that
placing them in the "staff" login class provides higher resource limits.
See login.conf(5) for details.  Note also that auto-adduser(8) provides
more guidance on user account parameters than the native adduser(8) command,
though both provide the opportunity to assign a login class.

Do the following as the root user:

```
pkg_add -u
pkg_add desktop-installer
desktop-installer

# Follow the instructions on the screen to set up your desktop system.
# If you do not understand a particular question asked by desktop-installer,
# accepting the default response should be fine in most cases.
```
