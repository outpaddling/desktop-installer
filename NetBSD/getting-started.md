
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

```
pkgin install auto-admin cvs git
cd /usr
ftp ftp://ftp.NetBSD.org/pub/pkgsrc/stable/pkgsrc.tar.gz
tar -zxvf pkgsrc.tar.gz
cd /usr/pkgsrc
auto-pkgsrc-wip-checkout
cd desktop-installer
make install
desktop-installer
```
