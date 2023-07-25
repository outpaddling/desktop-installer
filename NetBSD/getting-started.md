
# Getting started on NetBSD

## To-dos for improving the NetBSD desktop experience

-   More regular binary package builds for both stable (quarterly) and current
-   Improvements to desktop-environment packages (LXQT, Mate, etc.)
-   Improvements to auto-media-format (sysutils/auto-admin)
    -   Used by qmediamanager
    -   mkfs.exfat does not seem to work properly
    -   newfs requires manual use of disklabel first
-   Add more configuration options to desktop-installer
-   Binary updates for the NetBSD base system

## System requirements

- 1 GiB RAM minimum
    - More if building large packages like gcc, clang
    - More if running Gnome or KDE
- 30 GB disk
- VirtualBox
    - USB tablet
    - 2 cores

## NetBSD Current/Beta Installation

Currently, only NetBSD10-BETA with binary packages from smartos.org
is supported.  Desktop-installer and related
tools are evolving fast, so we need a system with regularly updated
packages from pkgsrc-current.  NetBSD releases do not currently meet
this requirement.

For non-release versions of NetBSD, auto-install-base-components won't
work, so all the base sets you need must be selected during OS
installation.  You can choose "Full install" or choose "Custom installation"
and select the following sets to ensure that desktop-installer will
work:

    Compiler tools
    X11 sets (all)

Otherwise, the installation process is the same as for NetBSD releases
as described below.

## Installing smartos.org pkgsrc packages

Packages for the latest pkgsrc tree available at
[https://pkgsrc.smartos.org/install-on-netbsd/](https://pkgsrc.smartos.org/install-on-netbsd/).

To use these packages:

1. pkgin upgrade    # Upgrade the original /usr/pkg to get latest certs
2. pkgin install mozilla-rootcerts-openssl (needed by smartos install script)
3. Download and run the install script from smartos.org.  This entirely
   replaces /usr/pkg with a new pkgsrc installation.

```
ftp https://raw.githubusercontent.com/outpaddling/desktop-installer/master/NetBSD/smartos-install.sh
sh smartos-install.sh
```

Note that this script is an augmented copy of the script from smartos.org
and it may become outdated.  Report any issues on this Github site.

Then follow the post-installation instructions above as you would for
any other NetBSD installation.  The main difference is you'll be using
the latest packages instead of quarterly snapshots.

## Post-installation

Do the following as the root user:

```
pkgin upgrade
pkgin -y install desktop-installer
desktop-installer

# Follow the instructions on the screen to set up your desktop system.
# If you do not understand a particular question asked by desktop-installer,
# accepting the default response should be fine in most cases.
```

