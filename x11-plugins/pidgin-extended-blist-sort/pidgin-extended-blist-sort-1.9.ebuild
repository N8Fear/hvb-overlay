# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

MY_P="extended_blist_sort-${PV}"

DESCRIPTION="Pidgin plugin that provides several new sort options for the buddy list"
HOMEPAGE="http://freakazoid.teamblind.de/2008/12/13/pidgin-extended-buddy-list-sort-plugin/"
SRC_URI="https://github.com/kgraefe/pidgin-extended-blist-sort/archive/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-im/pidgin[gtk]"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
    cd ${WORKDIR}/${P}
    eapply_user
    ./autogen.sh

}
