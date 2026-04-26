# Getting started on OpenBSD

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

A request has been made to add desktop-installer to the official openbsd
ports collection, but this has not yet been completed.  Once the port
has been created, we can replace every below preceding the `desktop-installer`
command with `pkg_add desktop-installer`.

For now, we install via the work-in-progress ports collection.

Do the following as the root user:

1.  If you don't have the ports tree installed, follow the instructions
    at [https://www.openbsd.org/faq/ports/ports.html](https://www.openbsd.org/faq/ports/ports.html).
1.  Clone [https://github.com/jasperla/openbsd-wip](https://github.com/jasperla/openbsd-wip)
    into /usr/ports/openbsd-wip.
    
    ```
    pkg_add git
    cd /usr/ports
    git clone https://github.com/jasperla/openbsd-wip
    ```
    See the Github site for additional info on using WIP ports.
1.  Add the following to /etc/mk.conf:
    ```
    PORTSDIR_PATH=${PORTSDIR}:${PORTSDIR}/openbsd-wip:${PORTSDIR}/mystuff
    ```
1.  `cd /usr/ports/openbsd-wip/sysutils/desktop-installer`
1.  `make install`
1.  `make clean`
1.  `cd`
1.  `desktop-installer`

Follow the instructions on the screen to set up your desktop system.
If you do not understand a particular question asked by desktop-installer,
accepting the default response should be fine in most cases.

Note: When adding new users via adduser(8) or auto-adduser(8), note that
placing them in the "staff" login class provides higher resource limits.
See login.conf(5) for details.  Note also that auto-adduser(8) provides
more guidance on user account parameters than the native adduser(8) command,
though both provide the opportunity to assign a login class.

## To-dos for improving the OpenBSD desktop experience

-   Improvements to desktop-environment packages (LXQT, Mate, etc.)
-   Inclusion of auto-media-format from the other BSDs (sysutils/auto-admin)
-   Qmediamanager
-   Openbsd-update-notify (port freebsd-update-notify)
-   Add more configuration options to desktop-installer
-   Binary updates / security patches for the OpenBSD base system
-   Optimization to `sysctl.conf` & other tweaks (maybe?)
```
