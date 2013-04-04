# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_5,2_6,2_7} )

inherit distutils-r1

DESCRIPTION="A PC/SC wrapper for Python."
HOMEPAGE="http://homepage.mac.com/jlgiraud/pycsc/Pycsc.html"
SRC_URI="https://pypi.python.org/packages/source/P/PyCSC/PyCSC-0.3.zip"
LICENSE="pycsc"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~ia64-hpux ~x86-interix ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x86-solaris"

DEPEND=">=dev-lang/python-2.2
	sys-apps/pcsc-lite"

S=${WORKDIR}/PyCSC-0.3/

python_install_all() {
	local DOCS=( CHANGELOG README TODO INSTALL COPYING )
	distutils-r1_python_install_all
}
