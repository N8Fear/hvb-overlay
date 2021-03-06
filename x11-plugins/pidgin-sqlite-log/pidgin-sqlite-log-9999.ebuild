# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="SQLite Logging for Pidgin/Finch/libpurple"
HOMEPAGE="https://github.com/N8Fear/pidgin-sqlite-log.git"
EGIT_REPO_URI="https://github.com/N8Fear/pidgin-sqlite-log.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${RDEPEND}
		virtual/pkgconfig"
RDEPEND=">=net-im/pidgin-2.6"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" ${PLUGIN_LIST} install
}

