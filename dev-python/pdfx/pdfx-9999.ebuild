# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1 git-2

DESCRIPTION="Extract all links from a PDF, and optionally download all referenced PDFs"
HOMEPAGE="http://www.metachris.com/pdfx"
EGIT_REPO_URI="https://github.com/metachris/pdfx.git"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~ia64-hpux ~x86-interix ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x86-solaris"

DEPEND=">=dev-lang/python-2.7"

python_install_all() {
	local DOCS=( README.rst AUTHORS LICENSE )
	distutils-r1_python_install_all
}
