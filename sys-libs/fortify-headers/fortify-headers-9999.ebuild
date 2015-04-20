# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils  git-2

DESCRIPTION="Standalone fortify source implementation"
HOMEPAGE="http://git.2f30.org/fortify-headers/about/"
EGIT_REPO_URI="git://git.2f30.org/fortify-headers"

LICENSE="freedist"
SLOT="0"
KEYWORDS="~arm ~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/fortify-headers-fix_install.patch"
}

src_install() {
	insinto /usr/include/fortify
	doins include/*.h
	insinto /usr/include/fortify/sys
	doins include/sys/*.h
	into /usr/share/doc/${P}
	dodoc LICENSE README
}
