# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-libs/fortify-headers/fortify-headers-0.4.ebuild,v 1.1 2015/05/15 13:49:19 blueness Exp $

EAPI=6

inherit git-r3

DESCRIPTION="libfesvr for riscv isa simulator/spike"
HOMEPAGE="https://github.com/riscv/riscv-fesvr"
EGIT_REPO_URI="https://github.com/riscv/riscv-fesvr.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~mips ~ppc ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e "s:\$(INSTALLDIR)/lib:\$(INSTALLDIR)/$(get_libdir):" Makefile.in || die
	eapply_user
}

