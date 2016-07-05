# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="Simplistic application to change Backlight levels on Laptops with Intel graphics card"
HOMEPAGE="https://github.com/psychoticmeow/dsplight.git"
EGIT_REPO_URI="https://github.com/psychoticmeow/dsplight.git"
KEYWORDS=""

SLOT="0"
LICENSE="BSD"

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}
