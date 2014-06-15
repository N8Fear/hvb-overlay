# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/dwm/dwm-6.0.ebuild,v 1.11 2012/05/03 14:40:04 jer Exp $

EAPI="5"

inherit eutils savedconfig toolchain-funcs git-2

DESCRIPTION="a statusbar for dwm"
HOMEPAGE="https://bitbucket.org/N8Fear/dstatus"
EGIT_REPO_URI="https://bitbucket.org/N8Fear/dstatus.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86 ~x86-fbsd"
IUSE="mpd selinux wifi battery volume"

DEPEND="x11-libs/libX11
mpd? ( media-libs/libmpdclient )
"

src_prepare() {
	restore_config config.h
	restore_config config.mk
	epatch_user
#	for i in ${IUSE}; do
	if ! use mpd; then
		sed -i -e 's/mpd//' ${WORKDIR}/${P}/config.mk || die
	fi
	if ! use wifi; then
		sed -i -e 's/wifi//' ${WORKDIR}/${P}/config.mk || die
	fi
	if ! use battery; then
		sed -i -e 's/battery//' ${WORKDIR}/${P}/config.mk || die
	fi
	if ! use selinux; then
		sed -i -e 's/selinux//' ${WORKDIR}/${P}/config.mk || die
	fi
	if ! use volume; then
		sed -i -e 's/volume//' ${WORKDIR}/${P}/config.mk || die
	fi
#	done
}


src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install

	save_config config.h
	save_config config.mk
}
