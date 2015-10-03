# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="A primitive drawing library targeted at Wayland"
HOMEPAGE="https://github.com/michaelforney/wld"
EGIT_REPO_URI="https://github.com/N8Fear/wld.git"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=dev-libs/wayland-1.9.0"
RDEPEND="${DEPEND}"
