# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Spike, a RISCV ISA Simulator"
HOMEPAGE="https://github.com/riscv/riscv-isa-sim"
EGIT_REPO_URI="https://github.com/riscv/riscv-isa-sim.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~mips ~ppc ~x86"
IUSE=""

DEPEND="dev-libs/riscv-fesvr"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e "s:$(INSTALLDIR)/lib:$(INSTALLDIR)/$(get_libdir):" Makefile.in || die
	eapply_user
}
