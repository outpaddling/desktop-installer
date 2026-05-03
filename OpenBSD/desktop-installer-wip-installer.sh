#!/bin/sh -e

##########################################################################
#   Function description:
#       Pause until user presses return
##########################################################################

pause()
{
    local junk
    
    printf "Press return to continue..."
    read junk
}

cat << EOM

This script will install the desktop-installer tool from the openbsd-wip
(work-in-progress) ports collection.

This should eventually be replaced by an official openbsd ports package,
so that users can simply run

    pkg_add desktop-installer

instead of downloading and running this script.

EOM
pause

if [ ! -e /usr/ports ]; then
    cd /tmp
    ftp https://cdn.openbsd.org/pub/OpenBSD/$(uname -r)/{ports.tar.gz,SHA256.sig}
    signify -Cp /etc/signify/openbsd-$(uname -r | cut -c 1,3)-base.pub -x SHA256.sig ports.tar.gz

    printf "Unpacking to /usr/ports...\n"
    cd /usr
    tar zxf /tmp/ports.tar.gz
fi

if ! which git; then
    pkg_add git
fi

if [ ! -e /usr/ports/openbsd-wip ]; then
    cd /usr/ports
    git clone https://github.com/jasperla/openbsd-wip
fi

if ! fgrep openbsd-wip /etc/mk.conf; then
    printf 'PORTSDIR_PATH=${PORTSDIR}:${PORTSDIR}/openbsd-wip\n' >> /etc/mk.conf
fi

cd /usr/ports/openbsd-wip/sysutils/desktop-installer
make install
make clean
