# Copyright 1999-2015 Gentoo Foundation
# Copyright 1999-2015 Hinnerk van Bruinehsen
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils git-2

DESCRIPTION="Facebook protocol plugin for libpurple"
HOMEPAGE="https://github.com/jgeboski/purple-facebook"
EGIT_REPO_URI="https://github.com/jgeboski/purple-facebook.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-libs/json-glib
		net-im/pidgin"
DEPEND="${RDEPEND}"
DOCS=( AUTHORS ChangeLog NEWS README VERSION )

src_configure() {
	./autogen.sh
	eautoreconf
	./configure
}
