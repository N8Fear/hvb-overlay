# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3

DESCRIPTION="Pidgin plugin that provides several new sort options for the buddy list"
HOMEPAGE="http://freakazoid.teamblind.de/2008/12/13/pidgin-extended-buddy-list-sort-plugin/"
EGIT_REPO_URI="https://github.com/kgraefe/pidgin-extended-blist-sort.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="net-im/pidgin[gtk]"
DEPEND="${RDEPEND}
	virtual/pkgconfig"


src_prepare() {
    cd ${WORKDIR}/${P}
    eapply_user
    ./autogen.sh

}
