# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 eutils autotools multilib-minimal

DESCRIPTION="a text-based calendar and scheduling application"
HOMEPAGE="http://calcurse.org/"
EGIT_REPO_URI="http://git.calcurse.org/calcurse.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc ~ppc64"

RDEPEND="sys-libs/ncurses:0="
DEPEND="${RDEPEND}"

DOCS=( AUTHORS NEWS README )

src_prepare() {
	default

	epatch "${FILESDIR}"/"calcurse-4.1.0-tinfo.patch"

	echo "${PV}" > .version
	./autogen.sh

	# Dubious tests.
	#rm -v "${S}/test"/ical-00{2,4,6}.sh || die

	eautoreconf
}

multilib_src_configure() {
	ECONF_SOURCE="${S}" econf
}

src_compile() {
	multilib-minimal_src_compile
}

src_install() {
	multilib-minimal_src_install
}
