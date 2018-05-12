# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils toolchain-funcs xdg meson

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.pwmt.org/pwmt/zathura-pdf-poppler.git"
	EGIT_BRANCH="develop"
else
	KEYWORDS="amd64 ~arm x86"
	SRC_URI="http://pwmt.org/projects/zathura/plugins/download/${P}.tar.xz"
fi

DESCRIPTION="PDF plug-in for zathura"
HOMEPAGE="http://pwmt.org/projects/zathura/"

LICENSE="ZLIB"
SLOT="0"
IUSE=""

RDEPEND="app-text/poppler[cairo]
	>=app-text/zathura-0.3.8
	x11-libs/cairo:="
DEPEND="${RDEPEND}
	virtual/pkgconfig"

