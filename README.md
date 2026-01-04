# desktop-installer

## Summary

Desktop-installer is a post-install script for configuring a desktop
environment on a stock FreeBSD, NetBSD, or OpenBSD system.
It facilitates the setup of a complete desktop system much more quickly,
reliably, and securely than manual software installations and configurations.

The end result is a fully functional
graphical environment comparable to GUI-based systems such as
GhostBSD, or Debian or Ubuntu GNU/Linux.
However, unlike those systems, desktop-installer
supports every desktop environment or window manager provided by the
native package manager, every supported version of the operating system,
and every hardware platform supported by the operating system.

Note that FreeBSD, NetBSD, and OpenBSD are operating systems primarily
used by somewhat advanced Unix users such as professional software
developers and systems managers.  They are used in many hard-core
behind-the-scenes settings, such as the Netflix content delivery network,
many popular storage and networking appliances, etc.  They can, however,
also make a great desktop system for typical daily computing, such as
web browsing, document editing, gaming, etc.

Desktop installer is fairly quick and easy to use, but it does require
a little bit of Unix command-line knowledge.  If you're new to Unix,
but somewhat computer-savvy, you should have no trouble using desktop-installer.
If you prefer to start with the easiest path to seeing what Unix is
about, you may want to first try a system with a simple graphical
installer first, such as [GhostBSD](https://ghostbsd.org) or
[Debian GNU/Linux](https://debian.org).

For more information, see http://acadix.biz/desktop-installer.php.

## Using desktop-installer

1. Perform a minimal FreeBSD, NetBSD, or OpenBSD installation using the
   standard installer
2. Install the desktop-installer package:

    FreeBSD: pkg install desktop-installer
    
    NetBSD: pkgin install desktop-installer
    
    OpenBSD: Package currently under development in the
	     [OpenBSD ports WIP](https://github.com/jasperla/openbsd-wip)
	     collection.

3.  Run "desktop-installer"
4.  Carefully read and follow the instructions on the screen

## History

Desktop-installer began as a simple script to automate the setup of
a blank FreeBSD system with XFCE desktop.  However, I quickly realized
that about 95% of the code had nothing to do with XFCE and applied to
any desktop environment (DE), so I soon added a menu and separate shell
functions for additional DEs.  Desktop-installer has since evolved into
highly a sophisticated script that configures many core components of
BSD systems to produce a full-featured, stable, and secure desktop
system.
