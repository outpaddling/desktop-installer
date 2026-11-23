# Getting started on DragonFly BSD

DragonFly support is experimental at this stage.

Improved support will happen if the DragonFly community is interested
enough to contribute feedback and code improvements.

## System requirements

- 1 GiB RAM minimum
    - More if building large packages like gcc, clang
    - More if running Gnome or KDE
- Minimum 30 GB disk space in /usr/local
- If running under VirtualBox:
    - 2 or more cores will improve performance.
    - The paravirtualized network driver may offer the best performance.
    - Use NAT networking (VirtualBox bridged networking doesn't seem to work).
    - Boot order: Hard Disk first, then Optical (This will cause the
      VM to boot from the ISO image before install and the hard disk after.)
    - Load the DragonFly ISO image into the virtual optical drive under Storage.

## OS installation

- If using VirtualBox
    - DragonFly BSD 6.4.2 does not work well under VirtualBox 7.2.
      Other VirtualBox versions have not been tested and may have problems
      as well.  Use a later version of DragonFly (nightly snapshot
      at the time of this writing).
    - UFS is suggested.  Hammer2 requires at least a 50 GB disk, much
      larger than you need for a basic test install, and we generally want
      to minimize the capacity of virtual disks so the host doesn't run
      out of space.

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
    need more work to support DragonFly.  In many places this will be
    as simple as converting "FreeBSD)" cases to "DragonFly|FreeBSD)"
    (Please keep unames in alphabetical order).  In other cases,
    FreeBSD code will need to be replaced or removed.
    
    Note: The DragonFly desktop-installer script was forked from the
    FreeBSD script and still contains some FreeBSD code that will not work.
-   Get more desktop environments and window managers working in dports.
