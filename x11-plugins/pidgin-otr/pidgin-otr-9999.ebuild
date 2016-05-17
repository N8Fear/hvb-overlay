# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="(OTR) Messaging allows you to have private conversations over instant messaging"
HOMEPAGE="http://www.cypherpunks.ca/otr/"
EGIT_REPO_URI="https://github.com/N8Fear/pidgin-otr.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 sparc x86"
IUSE=""

RDEPEND="dev-libs/libgcrypt:0
	net-im/pidgin[gtk]
	>=net-libs/libotr-4.0.0
	x11-libs/gtk+:2"
DEPEND="${RDEPEND}
	dev-util/intltool
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog NEWS README )


src_prepare() {
        "${WORKDIR}/${P}/autogen.sh"
}

