
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
	- Enable ntpd and ntpdate for real hardware, not for VMs
	- Do not enable XDM during install, desktop-installer will do this
	- Other config items are optional
- Exit Install System
- shutdown -p now
- Remove CD
- Boot into new system

## Post-installation

Starting sometime in July, 2023, the binary package should be available.
Users can then simply do the following as the root user:

```
pkgin -y install desktop-installer
desktop-installer

# Follow the instructions on the screen to set up your desktop system.
```

Until then, or if you want to use the latest work-in-progress version
of desktop-installer, follow the instructions below to use wip/desktop-installer:

```
#############################################################################
# Quickly install some prerequisites

pkgin -y install auto-admin cvs git digest cwrappers mktools

#############################################################################
# If you don't already have the pkgsrc-wip collection

cd /usr/pkgsrc
auto-pkgsrc-wip-checkout

#############################################################################
# Get the latest auto-admin to support desktop-installer, etc.

cd wip/auto-admin
make deinstall reinstall

#############################################################################
# Install the WIP version of desktop-installer

cd ../desktop-installer
make install

#############################################################################
# Optional: If you want external media automounting to work, install
# qmediamanager and dependencies before running desktop-installer.
# Desktop-installer will try to install them using pkgin, but the
# packages don't exist yet.

pkgin install qt6-qttools
# Comment out BUILDLINK_ABI_DEPENDS.qt6 in x11/qt6-qtbase/buildlink3.mk
# The binary package is behind, so pkgsrc will rebuild it from source,
# which takes a very long time due to huge dependencies like llvm.
# The ABI differences are not relevant, so no need to suffer through this.
cd ../qmediamanager
make install

#############################################################################
# Run desktop-installer to configure your desktop environment

cd
desktop-installer

# Follow the instructions on the screen to set up your desktop system.
```
