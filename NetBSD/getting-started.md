
# Getting started on NetBSD

## To-dos for improving the NetBSD desktop experience

-   More regular binary package builds for both stable (quarterly) and current
-   Improvements to desktop-environment packages (LXQT, Mate, etc.)
-   Improvements to auto-media-format (sysutils/auto-admin)
    -   Used by qmediamanager
    -   Upgrade key packages such as fusefs-*
    -   newfs requires manual use of disklabel first
    -   Interactive fdisk seems to be the only way to create an MBR.
	FreeBSD's gpart does this quickly and easily:
	gpart create -s MBR da0
-   Add more configuration options to desktop-installer
-   Binary updates for the NetBSD base system

## System requirements

- 1 GiB RAM minimum
    - More if building large packages like gcc, clang
    - More if running Gnome or KDE
- 30 GB disk
- If running under VirtualBox
    - Download the NetBSD installer ISO image
    - Set pointing device to USB tablet
    - 2 or more cores
    - Boot order: Hard Disk first, then Optical (This will cause the
	VM to boot from the
	ISO image before install and the hard disk after)
    - Load the ISO image into the virtual optical drive under Storage

## NetBSD Current/Beta Installation

Only NetBSD systems with binary packages are supported.

Note: For non-release versions of NetBSD (e.g. 10.0-BETA),
base components cannot be added after installation,
so all the base sets you need must be selected during OS
installation.  You can choose "Full install" or choose "Custom installation"
and select at least the following sets to ensure that desktop-installer will
work:

    Compiler tools
    X11 sets (all)

Otherwise, the installation process is the same as for NetBSD releases.

### Configuration

Network (hostname only for hostname, domain is asked for after)

Timezone

Root shell

If not using binary packages from smartos.org:

    Enable installation of binary packages
    Fetch and update binary pkgsrc

Enable ntpd and ntpdate on real hardware only, not on virtual machines

Other options are unimportant to desktop-installer

## Installing smartos.org pkgsrc packages

Packages for the latest pkgsrc tree on select NetBSD versions
are available at
[https://pkgsrc.smartos.org/install-on-netbsd/](https://pkgsrc.smartos.org/install-on-netbsd/).

To use these packages, download and run the install script from smartos.org.
This entirely replaces /usr/pkg with a new pkgsrc installation.

```
ftp https://raw.githubusercontent.com/outpaddling/desktop-installer/master/NetBSD/smartos-install.sh
sh smartos-install.sh
```

Note that this script is an augmented copy of the script from smartos.org
and it may become outdated.  Please report any issues on this Github site.

Then follow the post-installation instructions below as you would for
any other NetBSD installation.  The main difference is you'll be using
the latest "current" packages instead of "stable"
(from quarterly pkgsrc snapshots).

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

