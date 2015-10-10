# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/binwalk/binwalk-2.0.1.ebuild,v 1.3 2014/11/21 07:40:11 radhermit Exp $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )

inherit git-2 distutils-r1 python-r1

DESCRIPTION="A tool for identifying files embedded inside firmware images"
HOMEPAGE="https://github.com/devttys0/binwalk"
EGIT_REPO_URI="https://github.com/devttys0/binwalk.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="graph"

RDEPEND="
	app-crypt/ssdeep
	sys-apps/file[${PYTHON_USEDEP}]
	graph? ( dev-python/pyqtgraph[opengl,${PYTHON_USEDEP}] )
"



python_compile_all() {
	distutils-r1_python_compile_all
}

python_install_all() {
	local DOCS=( API.md INSTALL.md )
	distutils-r1_python_install_all

}
