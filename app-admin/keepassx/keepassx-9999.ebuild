# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils git-r3

DESCRIPTION="Qt password manager compatible with its Win32 and Pocket PC versions"
HOMEPAGE="http://keepassx.sourceforge.net/"
EGIT_REPO_URI=(
	"https://github.com/N8Fear/keepassx.git"
)

LICENSE="LGPL-2.1 GPL-2 GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND="dev-libs/libgcrypt:=
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qttest:5
	sys-libs/zlib
"

src_configure() {
	local mycmakeargs=(
		-DWITH_QT5=ON
		-DWITH_GUI_TESTS=OFF
	)
	cmake-utils_src_configure
}
