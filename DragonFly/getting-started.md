# Getting started on DragonFly BSD

DragonFly support is experimental at this stage.

Improved support will happen if the DragonFly community is interested
enough to contribute feedback and code improvements.

## System requirements

- 1 GiB RAM minimum
    - More if building large packages like gcc, clang
    - More if running Gnome or KDE
- Minimum 30 GB disk space in /usr/local
- If running under VirtualBox or other VMMs:
    - UFS is suggested, as Hammer2 requires a fairly large disk, much
      larger than you need, and probably larger than you want to make
      a virtual disk.
    - 2 or more cores will improve performance.
    - The paravirtualized network driver may offer the best performance.
    - Boot order: Hard Disk first, then Optical (This will cause the
      VM to boot from the ISO image before install and the hard disk after.)
    - Load the ISO image into the virtual optical drive under Storage.

## Post-installation

There is no desktop-installer package yet.
For now, we install via the work-in-progress ports collection.

Do the following as the root user:

1.  pkg install auto-admin
1.  auto-ports-wip-checkout
1.  pkg install desktop-file-utils  # Avoid building deps from source
1.  wip-reinstall-port auto-admin desktop-installer
1.  desktop-installer

## To-dos for improving the DragonFly desktop experience

-   Numerous auto-admin scripts and the desktop-installer script itself
    need updates to support DragonFly

