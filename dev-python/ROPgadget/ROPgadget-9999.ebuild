# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit distutils-r1 git-r3

DESCRIPTION="Tool to find ROP gadets"
HOMEPAGE="https://github.com/JonathanSalwan/ROPgadget"
EGIT_REPO_URI="https://github.com/JonathanSalwan/ROPgadget"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~ia64-hpux ~x86-interix ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x86-solaris"

DEPEND=">=dev-lang/python-2.7
				>=dev-libs/capstone-3.0.5[python]"

python_install_all() {
	local DOCS=( README.md LICENSE_BSD.txt AUTHORS )
	distutils-r1_python_install_all
}
