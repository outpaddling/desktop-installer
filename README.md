# desktop-installer

## Summary

Desktop-installer is a post-install script for configuring a desktop
environment on a stock FreeBSD, NetBSD, or OpenBSD system.

It facilitates the setup of a complete desktop system much more quickly,
reliably, and securely than manual software installations and configurations.

The end result is a fully functional
graphical environment comparable to GUI-based systems such as
GhostBSD or Ubuntu Linux. However, unlike those systems, desktop-installer
supports *any* desktop environment or window manager provided by the
native package manager and *any* hardware
supported by the operating system.

For more information, see http://acadix.biz/desktop-installer.php.

## Using desktop-installer

1. Perform a minimal FreeBSD, NetBSD, or OpenBSD installation using the
   standard installer
2. Install the desktop-installer package:

    FreeBSD: pkg install desktop-installer
    
    NetBSD: pkgin install desktop-installer
    
    OpenBSD: Package currently under development

3.  Run "desktop-installer"
4.  Carefully follow the instructions on the screen

## History

Desktop-installer began as a simple script to automate the setup of
a blank FreeBSD system with XFCE desktop.  However, I quickly realized
that about 95% of the code had nothing to do with XFCE and applied to
any desktop environment (DE), so I soon added a menu and separate shell
functions for additional DEs.  Desktop-installer has since evolved into
highly a sophisticated script that configures many core components of
BSD systems to produce a full-featured, stable, and secure desktop
system.
