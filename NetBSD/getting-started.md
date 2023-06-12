
# Getting started on NetBSD

## System requirements

- 1 GiB RAM recommended, more if building large packages like gcc, clang
- 30 GB disk

## NetBSD Installation

- Recommended:    At least 4 GiB swap
- Required:       BIOS console
- Recommended:    Minimal installation
- Required:       Configure the following items
	- Network
	- Timezone
	- Root shell ksh (best interactive features among preinstalled shells)
	- Root password
	- Binary packages

## Post-installation

Below are instructions for getting started with wip/desktop-installer.
Once the tool matures, it will become available via pkgin, and these
instructions will be simplified.

```
pkgin install auto-admin cvs git fetch digest cwrappers mktools
cd /usr
ftp ftp://ftp.NetBSD.org/pub/pkgsrc/stable/pkgsrc.tar.gz
tar -zxvf pkgsrc.tar.gz
cd /usr/pkgsrc
auto-pkgsrc-wip-checkout
auto-install-base-components comp xcomp
cd desktop-installer
make install
desktop-installer

Now just follow the instructions on the screen to set up your desktop
system.
```
