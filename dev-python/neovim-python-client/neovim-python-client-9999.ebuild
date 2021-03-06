# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5,3_6} )
inherit distutils-r1 git-r3

DESCRIPTION="Python client for Neovim"
HOMEPAGE="https://github.com/neovim/python-client"
EGIT_REPO_URI="https://github.com/neovim/python-client.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk"

DEPEND="
	>=dev-python/msgpack-0.4.0
	virtual/python-greenlet
	dev-python/trollius
	gtk? (
		>=dev-python/click-3.0
		dev-python/pygobject:2
		dev-python/pygtk:2
		x11-libs/gtk+:2[introspection]
	)"
RDEPEND="${DEPEND}"
