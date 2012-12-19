desktop-installer(1)                                      desktop-installer(1)



NNAAMMEE
       desktop-installer - Quickly configure a FreeBSD desktop system





SSYYNNOOPPSSIISS
       desktop-installer


DDEESSCCRRIIPPTTIIOONN
       The  ddeesskkttoopp--iinnssttaalllleerr  script  automates  the process of configuring a
       FreeBSD machine as a desktop system running KDE, Gnome, or XFCE.  Other
       desktop  systems exist and support for them may be added in the future.

       This is a post-install script, i.e. one that  you  run  AFTER  doing  a
       standard  operating system installation with sysinstall.  ( See details
       below. )

       The desktop configuration process requires installing many  ports/pack-
       ages and configuring many different subsystems, which can be a daunting
       task for all but the most seasoned users.

       DDeesskkttoopp--iinnssttaalllleerr installs all the software necessary  for  the  chosen
       desktop  as  well  as common desktop-independent packages such as CUPS,
       Firefox, OpenOffice.org, etc.

       It also configures system services and settings  to  facilitate  conve-
       nient use of CD/DVD drives, USB ports, etc.


MMOOTTIIVVAATTIIOONN
       This  script is meant to provide a middle-ground between totally manual
       configuration and complete distributions such as DesktopBSD and PC-BSD.

       The post-install script approach has some advantages over complete dis-
       tributions.  The post-install script itself is far easier  to  maintain
       and  unlike  separate  distributions, the resulting desktop system is a
       nearly pristine  FreeBSD  system  with  minimal  differences  from  the
       default  install.   The system can therefore be maintained and upgraded
       using  traditional  FreeBSD  command-line  tools   (pkg_add,   adduser,
       freebsd-update,  etc.), or stock tools of the chosen desktop suite.  It
       also supports all platforms that  run  FreeBSD,  whereas  distributions
       like  DesktopBSD  and  PC-BSD are limited to the most popular architec-
       tures.


BBAASSIICC UUSSEE
       To use ddeesskkttoopp--iinnssttaalllleerr::

       1. Install a basic FreeBSD system.

       DDeesskkttoopp--iinnssttaalllleerr can also be used to upgrade all the  software  on  an
       existing  system,  but  there  are  more possibilities for failure here
       since it is impossible to predict what kinds of system hacks  it  might
       encounter.  Also, it's generally a good idea to back up your data, wipe
       your disk clean, and reinstall everything every few years,  since  data
       on  magnetic  disks  can fade over time and read errors will eventually
       occur.

       If you enjoy the simple life, install a -RELEASE  version  rather  than
       -STABLE  or -CURRENT.  With a -RELEASE version, ports and packages will
       be installed from a snapshot taken when the release  was  built.   This
       will mean you're not running the very latest of all the ports/packages,
       but the ports and packages will all be compatible with each other.

       More adventurous users, and those who want to help the FreeBSD  project
       by testing the latest software can use -STABLE or -CURRENT, but be pre-
       pared to resolve dependency issues.

       The recommended install options are a basic user system including bina-
       ries,  docs,  source code, and ports tree.  Install the ports tree as a
       distribution from sysinstall rather than  using  portsnap.   Sysinstall
       will  install  the  ports tree from which the packages for your release
       were built.

       Portsnap, on the other hand, fetches the latest ports, which  will  not
       all be compatible with the binary packages for your release.  This will
       inevitably cause stability problems with certain applications that  are
       fussy about versions of dependencies.

       DDeesskkttoopp--iinnssttaalllleerr installs the latest packages over the network, mostly
       using "pkg_add -r", but also using ports where necessary.  (Some  soft-
       ware,  such  as  Java,  cannot  be  distributed as a binary package for
       licensing reasons.)

       2. Install desktop-installer:

           pkg_add -r desktop-installer

       or (if you have a ports tree installed)

           cd /usr/ports/sysutils/desktop-installer
           make install

       3. Run desktop-installer:

       a. Run rehash if using a csh-based shell

       b. desktop-installer

       c. Follow the instructions on your screen.


BBUUGGSS
       Too many to document.


SSEEEE AALLSSOO
       amd-setup


AAUUTTHHOORR
       Jason W. Bacon
       Acadix Consulting, LLC




                                                          desktop-installer(1)
