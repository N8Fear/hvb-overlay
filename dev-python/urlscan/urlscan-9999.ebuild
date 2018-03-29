# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit distutils-r1 git-r3

DESCRIPTION="Mutt and terminal url selector (similar to urlview) "
HOMEPAGE="https://github.com/firecat53/urlscan.git"
EGIT_REPO_URI="https://github.com/firecat53/urlscan.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~ia64-hpux ~x86-interix ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x86-solaris"

DEPEND=">=dev-lang/python-2.7
		>=dev-python/urwid-2.0.1"

python_install_all() {
	local DOCS=( README.rst COPYING )
	distutils-r1_python_install_all
}
