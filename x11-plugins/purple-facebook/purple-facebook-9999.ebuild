# Copyright 1999-2015 Gentoo Foundation
# Copyright 1999-2015 Hinnerk van Bruinehsen
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="Facebook protocol plugin for libpurple"
HOMEPAGE="https://github.com/jgeboski/purple-facebook"
EGIT_REPO_URI="https://github.com/jgeboski/purple-facebook.git"

LICENSE="GPL2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/json-glib"
RDEPEND="${DEPEND}"
