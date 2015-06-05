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
IUSE="debug test qt5"

RDEPEND="dev-libs/libgcrypt:=
	qt5? ( dev-qt/qtcore:5 )
	qt5? ( dev-qt/qtgui:5 )
	!qt5? ( dev-qt/qtcore:4 )
	!qt5? ( dev-qt/qtgui:4 )
	sys-libs/zlib
"
DEPEND="${RDEPEND}
	test? ( qt5? ( dev-qt/qttest:5 )
			!qt5? ( dev-qt/qttest:4 )
	)

"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with test TESTS)
		-DWITH_GUI_TESTS=OFF
	)
	mycmakeargs=" ${mycmakeargs} -DWITH_QT5=ON"
	cmake-utils_src_configure
}
