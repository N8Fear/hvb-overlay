# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="Outputs xwindow titles"
HOMEPAGE="https://github.com/baskerville/xtitle"
SRC_URI=""
EGIT_REPO_URI="https://github.com/baskerville/xtitle.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="x11-libs/libxcb"
RDEPEND="x11-libs/libxcb"

