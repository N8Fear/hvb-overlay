# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit rpm

DESCRIPTION="Brother printer driver for HL-3150CDW"

HOMEPAGE="http://support.brother.com"

SRC_URI="http://download.brother.com/welcome/dlf100427/hl3150cdwlpr-1.1.2-1.i386.rpm
         http://download.brother.com/welcome/dlf100429/hl3150cdwcupswrapper-1.1.2-1.i386.rpm"

LICENSE="brother-eula"

SLOT="0"

KEYWORDS="amd64"

IUSE=""

RESTRICT="mirror strip"

DEPEND="net-print/cups"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_unpack() {
    rpm_unpack ${A}
}

src_install() {
    has_multilib_profile && ABI=x86

    dosbin "${WORKDIR}/usr/bin/brprintconf_hl3150cdw"

    cp -r usr opt "${D}" || die

    mkdir -p ${D}/usr/libexec/cups/filter || die
    ( cd ${D}/usr/libexec/cups/filter/ && ln -s ../../../../opt/brother/Printers/hl3150cdw/lpd/filterhl3150cdw brlpdwrapperhl3150cdw ) || die

    mkdir -p ${D}/usr/share/cups/model || die
    ( cd ${D}/usr/share/cups/model && ln -s ../../../../opt/brother/Printers/hl3150cdw/cupswrapper/brother_hl3150cdw_printer_en.ppd hl3150cdw.ppd ) || die
}
