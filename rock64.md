# FreeBSD and ARM-based Single Board Computers

Desktop-installer has preliminary support for ARM-based single board
computers (SBCs), though much work remains to be done before they are viable
for everyday use.  As of June, 2021, the vast majority of FreeBSD ports
are building successfully on aarch64, though a few key packages still need to
be fixed to enable popular desktop environments and applications.  We are
also awaiting infrastructure improvements to speed up the package build cycle
for aarch64.

The $200 [PINEBOOK Pro](https://www.pine64.org/pinebook-pro/) looks very
promising as a low-cost laptop capable of competing with x86-based PCs.
The [ROCKPro 64](https://www.pine64.org/rockpro64) is an equivalent SBC that
can be configured as a desktop system.  Unfortunately, both are out of stock
at present due to a global parts shortage.

If you would like to experiment or contribute in the meantime, the
[ROCK64](https://www.pine64.org/devices/single-board-computers/rock64/)
is very inexpensive and powerful enough for many typical uses,
with up to 4 GiB RAM and 4 1.5 GHz cores.  It can boot from a microSD card
and also accommodate an eMMC module via a bus connector on top of the board.

FreeBSD provides two ways to install on ARM-based
SBCs.  If your SBC can boot from USB, you can load one of the USB images
onto a USB stick and install from it as you would an x86-based PC. Some SBCs
don't support this and others may require some configuration to enable
USB boot.

FreeBSD also provides pre-built images for popular SBCs such as Raspberry-Pi
and ROCK64.  These images can be loaded onto the bootable media supported by
your SBC, typically a micro-SD card.  You will need another computer with an
SD slot and probably an appropriate adapter (e.g. SD to microSD), or a USB
microSD card reader.

## Using a pre-built image to install on ROCK64

Download pre-built image if available, e.g.
FreeBSD-13.0-RELEASE-arm64-aarch64-ROCK64.img.xz
from, e.g. http://ftp9.freebsd.org/pub/FreeBSD/releases/ISO-IMAGES/13.0/

See https://wiki.freebsd.org/arm/RockChip for tips

Uncompress:

```unxz FreeBSD-13.0-RELEASE-arm64-aarch64-ROCK64.img.xz```

Copy the uncompressed image to the microSD card, e.g. using dd:

1. Insert microSD into slot or adapter

2. Find out what device name FreeBSD has assigned to it, e.g. /dev/da0:

```dmesg```

3. Copy the uncompressed image to the device:

```dd if=FreeBSD-13.0-RELEASE-arm64-aarch64-ROCK64.img      of=/dev/da0 bs=4096 status=progress```

(bs = 4096 is just to speed things up over the default 512)

4. Insert microSD into ROCK64

As of June, 2021, the ROCK64 HDMI port does not work with FreeBSD, so you
cannot just connect a monitor and keyboard and be on your way.  Support is
in the works.  HDMI and X11 apparently work on the ROCKPro64, but these
devices are currently hard to find.

There are 2 ways around this:

1.  Connect a serial adapter to the GPIO

This will require some wiring from the GPIO pins on the board to a
serial cable or more likely, a serial-USB adapter.  Most modern computers
don't have serial ports, so you'll need a serial-USB adapter to connect
from your computer to the SBC.  Not all serial-USB adapters are supported
by FreeBSD.
    
See https://wiki.freebsd.org/arm/RockChip for recommendations.

2.  Boot headless with an Ethernet connection and ssh in

    1.  Connect the ROCK64 to your network with an Ethernet cable
    2.  Power on
    3.  Wait a minute or so for boot to complete
    4.  Most routers have an "attached devices" page on their web interface.
    At the time of this writing, the ROCK64 image reports its hostname as
    "generic".  Find this in the attached devices list and note the IP
    address.  If this has changed, you can always unplug the Ethernet cable
    and refresh the web page.  Whatever host disappear is your ROCK64.
    5.  From another machine, run "ssh freebsd@ip-address"
    6.  Enter "yes" if asked to verify the new ssh destination
    7.  Enter "freebsd" as the password.
    8.  Run "passwd" to change the default password.
    9.  Run "su" and enter "root" as the password.
    10.  Run "passwd" to change the default password for root.

3.  Configure swap space

The FreeBSD pre-built image has no swap space configured, so your processes
will be limited to physical RAM by default.  Given that the ROCK64 has at
most 4 GiB RAM, this could prove very limiting.

If you only have a microSD card, swapping will be extremely slow. MST-Bench
on my ROCK64 microSD showed average write throughput of about 6 MB/s and
read throughput of 24 MB/s.  A modern mechanical disk will provide over
100 MB/s both read and write, while a eMMC or SSD will typically provide
at least 200 MB/s write and 500 MB/s read, possibly much more.

Swap on a microSD might suffice for interactive processes that sleep most of
the time, such as a word
processor, but anything computationally intensive will suffer extreme
slow-downs if it has to swap to a microSD.

An eMMC module is very fast, on the other hand, and adding a swap file on
the eMMC device can extend your memory space with reasonable performance
for most tasks.
