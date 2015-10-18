# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2 qmake-utils

DESCRIPTION="Powerful and easy-to-use multimedia player"
HOMEPAGE="http://bomi.github.io/"
EGIT_SRC_REPO="https://github.com/xylosper/bomi.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="aacs bdplus cdda jack pulseaudio samba systemd vaapi vdpau youtube-dl"

RDEPEND="dev-libs/fribidi
	dev-libs/icu
	dev-libs/libchardet
	dev-qt/linguist-tools
	dev-qt/qtchooser[qt5]
	>=dev-qt/qtcore-5.3
	>=dev-qt/qtdbus-5.3
	>=dev-qt/qtdeclarative-5.3[-gles2]
	>=dev-qt/qtgui-5.3[-gles2]
	>=dev-qt/qtnetwork-5.3
	>=dev-qt/qtopengl-5.3[-gles2]
	>=dev-qt/qtquickcontrols-5.3
	>=dev-qt/qtsql-5.3
	>=dev-qt/qtsvg-5.3
	>=dev-qt/qtwidgets-5.3[-gles2]
	>=dev-qt/qtx11extras-5.3
	>=dev-qt/qtxml-5.3
	media-libs/alsa-lib
	>=media-video/ffmpeg-2.4
	media-libs/glew
	>=media-libs/libass-0.12.1
	youtube-dl? ( net-misc/youtube-dl )
	media-libs/libbluray
	bdplus? ( media-libs/libbdplus )
	aacs? ( media-libs/libaacs )
	>=media-libs/libquvi-0.9
	media-libs/libdvdread
	media-libs/libdvdnav
	media-sound/mpg123
	x11-libs/libva
	cdda? (
		dev-libs/libcdio
		dev-libs/libcdio-paranoia )
	jack? ( media-sound/jack-audio-connection-kit )
	pulseaudio? ( media-sound/pulseaudio )
	samba? ( net-fs/samba[client] )
	systemd? ( sys-apps/systemd )
	virtual/opengl"
DEPEND="${RDEPEND}
	dev-lang/python
	media-libs/mesa
	sys-apps/sed
	>=sys-devel/gcc-4.9"

src_configure() {
	./configure --prefix=/usr \
		$(use_enable cdda) \
		$(use_enable jack) \
		$(use_enable pulseaudio) \
		$(use_enable samba) \
		$(use_enable systemd) \
		$(use_enable vaapi) \
		$(use_enable vdpau) \
		|| die
}

src_install() {
	emake DEST_DIR="${D}" install
	dodoc CHANGES.txt README.md
}
