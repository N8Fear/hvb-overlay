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
IUSE=""

#DEPEND="x11-libs/libX11
#	xinerama? (
#		x11-proto/xineramaproto
#		x11-libs/libXinerama
#		)"
#RDEPEND="${DEPEND}"

#src_prepare() {
#	restore_config config.h
#	epatch_user
#}

#src_compile() {
#	if use xinerama; then
#		emake CC=$(tc-getCC)
#	else
#		emake CC=$(tc-getCC) XINERAMAFLAGS="" XINERAMALIBS=""
#	fi
#}

#src_install() {
#	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
#	dodoc README
#}

