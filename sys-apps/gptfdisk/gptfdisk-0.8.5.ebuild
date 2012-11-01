# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/gptfdisk/gptfdisk-0.8.5.ebuild,v 1.2 2012/09/29 16:44:31 armin76 Exp $

EAPI=4
inherit flag-o-matic toolchain-funcs

DESCRIPTION="gdisk - GPT partition table manipulator for Linux"
HOMEPAGE="http://www.rodsbooks.com/gdisk/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~mips ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="dev-libs/icu
	dev-libs/popt
	>=sys-libs/ncurses-5.7-r7
	kernel_linux? ( sys-apps/util-linux )"
DEPEND="${RDEPEND}"

src_prepare() {
	sed	-e "s|^\(CC\s*=\).*|\1 $(tc-getCC)|g" \
		-e "s|^\(CXX\s*=\).*|\1 $(tc-getCXX)|g" \
		-i Makefile || die

	if icu-config --cxxflags 2>/dev/null | grep -qs  "std=\(c\|gnu\)++11"; then
		append-cxxflags -std=c++11
	fi
}

src_install() {
	local app
	for app in gdisk sgdisk cgdisk fixparts; do
		dosbin ${app}
		doman ${app}.8
	done
	dodoc NEWS README
}

src_test() {
	./gdisk_test.sh || die
}
