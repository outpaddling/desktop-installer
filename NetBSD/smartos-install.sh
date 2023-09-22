#!/bin/sh -e
 
#
# Copy and paste the lines below to install the NetBSD/amd64 set.
#
BOOTSTRAP_TAR="bootstrap-netbsd-trunk-x86_64-20230918.tar.gz"
BOOTSTRAP_SHA="493161aa5dd4c91c99e77187fa9fc3498fd2560b"

# Download the bootstrap kit to the current directory.
ftp https://pkgsrc.smartos.org/packages/NetBSD/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA} ${BOOTSTRAP_TAR}" | sha1 -c

# Verify PGP signature.  This step is optional, and requires gpg.
#ftp https://pkgsrc.smartos.org/packages/NetBSD/bootstrap/${BOOTSTRAP_TAR}.asc
#ftp -Vo - https://pkgsrc.smartos.org/pgp/C72658C9.asc | gpg2 --import
#gpg2 --verify ${BOOTSTRAP_TAR}.asc ${BOOTSTRAP_TAR}

#
# Remove any existing packages.  Note also that the bootstrap kit will
# install its own copies of the security/mozilla-rootcerts certificates
# into the /etc/openssl/certs/ directory.
#
rm -rf /usr/pkg /var/db/pkg /var/db/pkgin

# Install bootstrap kit to /usr/pkg
tar -zxpf ${BOOTSTRAP_TAR} -C /

cd /usr
if [ -e pkgsrc ]; then
    printf "/usr/pkgsrc already exits.  Replace? y/[n] "
    read install_pkgsrc
else
    install_pkgsrc=y
fi
if [ 0"$install_pkgsrc" = 0y ]; then
    mv pkgsrc orig.pkgsrc
    ftp ftp://ftp.NetBSD.org/pub/pkgsrc/current/pkgsrc.tar.gz
    tar -zxvf pkgsrc.tar.gz -C /usr
fi
cd pkgsrc
cvs -q up -dP || true

sed -i'' -e 's|VERIFIED_INSTALLATION=always|VERIFIED_INSTALLATION=trusted|' \
    /usr/pkg/etc/pkg_install.conf

