
# Getting started on NetBSD

## System requirements

- 1 GiB RAM minimum
    - More if building large packages like gcc, clang
    - More if running Gnome or KDE
- 30 GB disk
- VirtualBox
    - USB tablet
    - 2 cores

## NetBSD Installation

- At least 4 GiB swap recommended
- BIOS console
- Minimal installation recommended
- Configure the following items
	- Network (required)
	- Timezone (required)
	- Root shell ksh (best interactive features among preinstalled shells)
	- Root password (required)
	- Binary packages (required)
	- Fetch and unpack pkgsrc (required)
- Shut down
- Remove CD
- Boot into new system

## Post-installation

Below are instructions for getting started with wip/desktop-installer.
Once the tool matures, it will become available via pkgin, and these
instructions will be simplified to `pkgin install desktop-installer`.

```
pkgin install auto-admin cvs git fetch digest cwrappers mktools
cd /usr/pkgsrc
auto-pkgsrc-wip-checkout
cd desktop-installer
make install
desktop-installer

Now just follow the instructions on the screen to set up your desktop
system.
```
