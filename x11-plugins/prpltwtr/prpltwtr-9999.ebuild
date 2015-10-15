# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit git-2

DESCRIPTION="libpurple twitter protocol"
HOMEPAGE="https://github.com/mikeage/prpltwtr"
EGIT_REPO_URI="https://github.com/mikeage/prpltwtr.git"
EGIT_BRANCH="twitter-json"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${RDEPEND}
		virtual/pkgconfig"
RDEPEND=">=net-im/pidgin-2.6"

src_configure() {
	"${WORKDIR}/${P}/autogen.sh"
}
