# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/slock/slock-1.1-r1.ebuild,v 1.1 2013/10/19 15:27:06 jer Exp $

EAPI=5
inherit fcaps savedconfig toolchain-funcs git-2

DESCRIPTION="simple X screen locker"
HOMEPAGE="http://tools.suckless.org/slock"
EGIT_REPO_URI="https://bitbucket.org/N8Fear/slock.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~x86 ~x86-fbsd"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXext"
DEPEND="${RDEPEND}
	x11-proto/xproto"

src_prepare() {
	sed -i \
		-e '/^CFLAGS/{s: -Os::g; s:= :+= :g}' \
		-e '/^CC/d' \
		-e '/^LDFLAGS/{s:-s::g; s:= :+= :g}' \
		config.mk || die
	sed -i \
		-e 's|@${CC}|$(CC)|g' \
		Makefile || die
	if use elibc_FreeBSD; then
		sed -i -e 's/-DHAVE_SHADOW_H//' config.mk || die
	fi
	restore_config config.mk
	tc-export CC
}

src_compile() { emake slock; }

src_install() {
	dobin slock
	save_config config.mk
}

pkg_postinst() {
	fcaps cap_dac_read_search /usr/bin/slock

	savedconfig_pkg_postinst
}