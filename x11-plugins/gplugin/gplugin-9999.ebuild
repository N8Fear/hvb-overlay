# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils mercurial

DESCRIPTION="libpurple plugin infrastructure"
HOMEPAGE="https://bitbucket.org/gplugin/main"
EHG_REPO_URI="https://bitbucket.org/gplugin/main"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk3 lua perl python"

DEPEND="${RDEPEND}
		virtual/pkgconfig"
RDEPEND=">=net-im/pidgin-2.6"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_build gtk3)
		$(cmake-utils_use_build lua)
		$(cmake-utils_use_build perl)
		$(cmake-utils_use_build python)
		-DTESTING_ENABLED=off
	)
	cmake-utils_src_configure
}

#src_compile() {
#
#}
#
#src_install() {
#	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" ${PLUGIN_LIST} install
#}

