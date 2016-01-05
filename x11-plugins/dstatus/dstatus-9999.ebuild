# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/dwm/dwm-6.0.ebuild,v 1.11 2012/05/03 14:40:04 jer Exp $

EAPI="5"

inherit eutils savedconfig toolchain-funcs git-2

DESCRIPTION="a statusbar for dwm"
HOMEPAGE="https://bitbucket.org/N8Fear/dstatus"
EGIT_REPO_URI="https://bitbucket.org/N8Fear/dstatus.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86 ~x86-fbsd"
IUSE="battery brightness cpu ip load memory mpd net selinux volume wifi"

PLUGIN_LIST=""

DEPEND="x11-libs/libX11
mpd? ( media-libs/libmpdclient )
wifi? ( dev-libs/libnl )
"

src_prepare() {
	restore_config config.h
	if use battery; then
		PLUGIN_LIST="${PLUGIN_LIST} WITH_BATTERY=1"
	fi
	if use brightness; then
		PLUGIN_LIST="${PLUGIN_LIST} WITH_BRIGHTNESS=1"
	fi
	if use cpu; then
		PLUGIN_LIST="${PLUGIN_LIST} WITH_CPU=1"
	fi
	if use ip; then
		PLUGIN_LIST="${PLUGIN_LIST} WITH_IP=1"
	fi
	if use load; then
		PLUGIN_LIST="${PLUGIN_LIST} WITH_LOADAVG=1"
	fi
	if use memory; then
		PLUGIN_LIST="${PLUGIN_LIST} WITH_MEMORY=1"
	fi
	if use mpd; then
		PLUGIN_LIST="${PLUGIN_LIST} WITH_MPD=1"
	fi
	if use net; then
		PLUGIN_LIST="${PLUGIN_LIST} WITH_NETSTAT=1"
	fi
	if use selinux; then
		PLUGIN_LIST="${PLUGIN_LIST} WITH_SELINUX=1"
	fi
	if use volume; then
		PLUGIN_LIST="${PLUGIN_LIST} WITH_VOLUME=1"
	fi
	if use wifi; then
		PLUGIN_LIST="${PLUGIN_LIST} WITH_WIFI=1"
	fi
	epatch_user
}

src_compile() {
	echo "Build: ${PLUGIN_LIST}"
	emake ${PLUGIN_LIST}
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" ${PLUGIN_LIST} install
	save_config config.h
}
