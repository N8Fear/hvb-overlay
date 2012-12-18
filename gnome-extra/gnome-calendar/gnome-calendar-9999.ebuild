# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
GCONF_DEBUG="no"
VALA_MIN_API_VERSION="0.18"

inherit gnome2 vala
if [[ ${PV} = 9999 ]]; then
	inherit gnome2-live
fi

DESCRIPTION="GNOME calendar application"
HOMEPAGE="https://live.gnome.org/Design/Apps/Calendar"

LICENSE="GPL-3"
SLOT="0"
if [[ ${PV} = 9999 ]]; then
	KEYWORDS=""
else
	KEYWORDS="~amd64 ~x86"
fi
VALA_DEPEND="$(vala_depend)
	dev-libs/folks[vala]
	gnome-base/gnome-desktop[introspection]
	gnome-extra/evolution-data-server[vala]
	net-libs/telepathy-glib[vala]
	x11-libs/libnotify[introspection]"
# Configure is wrong; it needs cheese-3.5.91, not 3.3.91

if [[ ${PV} = 9999 ]]; then
	DEPEND+="
		${VALA_DEPEND}"
fi

src_prepare() {
	DOCS="AUTHORS ChangeLog NEWS" # README is empty
	# Regenerate the pre-generated C sources
	if ! use v4l; then
		touch src/*.vala
	fi
	if [[ ${PV} = 9999 ]]; then
		vala_src_prepare
	fi
	gnome2_src_prepare
}
