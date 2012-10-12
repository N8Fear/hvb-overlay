# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/lightdm-gtk-greeter/lightdm-gtk-greeter-1.1.5.ebuild,v 1.1 2012/04/28 14:52:26 hwoarang Exp $

EAPI=4

DESCRIPTION="LightDM Unity Greeter"
HOMEPAGE="https://launchpad.net/unity-greeter"
SRC_URI="https://launchpad.net/unity-greeter/12.10/${PV}/+download/unity-greeter-${PV}.tar.gz"
#https://launchpad.net/unity-greeter/12.10/12.10.4/+download/unity-greeter-12.10.4.tar.gz

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/gtk+:3
	>=x11-misc/lightdm-1.2.2
	>=dev-libs/libindicator-0.4.1-r300
	"
RDEPEND="x11-libs/gtk+:3
	>=x11-misc/lightdm-1.3.2
	x11-themes/gnome-themes-standard
	x11-themes/gnome-icon-theme"

