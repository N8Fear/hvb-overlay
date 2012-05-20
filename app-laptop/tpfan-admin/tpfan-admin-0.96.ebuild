# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit python eutils

DESCRIPTION="Userspace daemon to controll thinkpad fan speed."
HOMEPAGE="http://www.gambitchess.org/mediawiki/index.php/ThinkPad_Fan_Control"
SRC_URI="http://tpfanco.googlecode.com/files/tpfan-admin_${PV}.orig.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND="dev-lang/python"
DEPEND="${RDEPEND}
	app-laptop/tpfand
	dev-python/librsvg-python	
	dev-lang/perl"

src_prepare() {
	# This is a hacky workaround, needs replacement
	#epatch "${FILESDIR}"/tpfand-without-hal.diff

	# Makefile is hard-wired to python 2.5
	sed -i -e "s:/usr/lib/python2.5/site-packages:$(python_get_sitedir):g" Makefile
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
