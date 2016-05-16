# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4} )

inherit autotools eutils mercurial python-single-r1

DESCRIPTION="GTK Instant Messenger client"
HOMEPAGE="http://pidgin.im/"
EHG_REPO_URI="https://bitbucket.org/pidgin/main"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 sparc x86 ~x86-freebsd ~amd64-linux ~x86-linux ~x86-macos"
IUSE="dbus debug doc eds gadu gnutls +gstreamer +gtk idn meanwhile mxit"
IUSE+=" networkmanager nls perl silc tcl tk spell sasl ncurses"
IUSE+=" groupwise prediction python +xscreensaver zephyr zeroconf" # mono"
IUSE+=" aqua"

# dbus requires python to generate C code for dbus bindings (thus DEPEND only).
# finch uses libgnt that links with libpython - {R,}DEPEND. But still there is
# no way to build dbus and avoid libgnt linkage with python. If you want this
# send patch upstream.
# purple-url-handler and purple-remote require dbus-python thus in reality we
# rdepend on python if dbus enabled. But it is possible to separate this dep.
RDEPEND="
	>=dev-libs/glib-2.16
	>=dev-libs/libxml2-2.6.18
	ncurses? ( sys-libs/ncurses[unicode]
		dbus? ( ${PYTHON_DEPS} )
		python? ( ${PYTHON_DEPS} ) )
	gtk? (
		>=x11-libs/gtk+-2.10:2[aqua=]
		x11-libs/libSM
		xscreensaver? ( x11-libs/libXScrnSaver )
		spell? ( >=app-text/gtkspell-2.0.2:2 )
		eds? ( >=gnome-extra/evolution-data-server-3.6:= )
		prediction? ( >=dev-db/sqlite-3.3:3 ) )
	gstreamer? ( =media-libs/gstreamer-0.10*
		=media-libs/gst-plugins-good-0.10*
		net-libs/farstream:0.1
		media-plugins/gst-plugins-meta:0.10
		media-plugins/gst-plugins-gconf:0.10 )
	zeroconf? ( net-dns/avahi[dbus] )
	dbus? ( >=dev-libs/dbus-glib-0.71
		>=sys-apps/dbus-0.90
		dev-python/dbus-python )
	perl? ( >=dev-lang/perl-5.16:= )
	gadu? ( || ( >=net-libs/libgadu-1.11.0[ssl,gnutls]
		>=net-libs/libgadu-1.11.0[-ssl] ) )
	gnutls? ( net-libs/gnutls )
	!gnutls? ( >=dev-libs/nss-3.15.4 )
	meanwhile? ( net-libs/meanwhile )
	silc? ( >=net-im/silc-toolkit-1.0.1 )
	tcl? ( dev-lang/tcl:0= )
	tk? ( dev-lang/tk:0= )
	sasl? ( dev-libs/cyrus-sasl:2 )
	networkmanager? ( net-misc/networkmanager )
	idn? ( net-dns/libidn )
  net-libs/webkit-gtk:3
	!<x11-plugins/pidgin-facebookchat-1.69-r1"
	# Mono support crashes pidgin
	#mono? ( dev-lang/mono )"

# We want nls in case gtk is enabled, bug #
NLS_DEPEND=">=dev-util/intltool-0.41.1 sys-devel/gettext"

DEPEND="$RDEPEND
	dev-lang/perl
	dev-perl/XML-Parser
	virtual/pkgconfig
	gtk? ( x11-proto/scrnsaverproto
		${NLS_DEPEND} )
	dbus? ( ${PYTHON_DEPS} )
	doc? ( app-doc/doxygen )
	!gtk? ( nls? ( ${NLS_DEPEND} ) )"

DOCS="AUTHORS HACKING NEWS README ChangeLog"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )
		dbus? ( ${PYTHON_REQUIRED_USE} )"

# Enable Default protocols
DYNAMIC_PRPLS="irc,jabber,oscar"

# List of plugins
#   app-accessibility/pidgin-festival
#   net-im/librvp
#   x11-plugins/guifications
#	x11-plugins/msn-pecan
#   x11-plugins/pidgin-encryption
#   x11-plugins/pidgin-extprefs
#   x11-plugins/pidgin-hotkeys
#   x11-plugins/pidgin-latex
#   x11-plugins/pidgintex
#   x11-plugins/pidgin-libnotify
#	x11-plugins/pidgin-mbpurple
#	x11-plugins/pidgin-bot-sentry
#   x11-plugins/pidgin-otr
#   x11-plugins/pidgin-rhythmbox
#   x11-plugins/purple-plugin_pack
#   x11-themes/pidgin-smileys
#	x11-plugins/pidgin-knotify
# Plugins in Sunrise:
#	x11-plugins/pidgin-audacious-remote
#	x11-plugins/pidgin-autoanswer
#	x11-plugins/pidgin-birthday-reminder
#	x11-plugins/pidgin-blinklight
#	x11-plugins/pidgin-convreverse
#	x11-plugins/pidgin-embeddedvideo
#	x11-plugins/pidgin-extended-blist-sort
#	x11-plugins/pidgin-gfire
#	x11-plugins/pidgin-lastfm
#	x11-plugins/pidgin-sendscreenshot
#	x11-plugins/pidgimpd

src_prepare() {
	./autogen.sh
}

src_configure() {

	econf \
		--disable-enchant \
		--disable-vv \
		--disable-meanwhile \
		--disable-avahi \
		--disable-dbus \
		--disable-gnome-keyring \
		--disable-kwallet \
		--with-system-ssl-certs="${EPREFIX}/etc/ssl/certs/" \
		--with-dynamic-prpls="${DYNAMIC_PRPLS}" \
		--disable-mono \
		--x-includes="${EPREFIX}"/usr/include/X11 \
		${myconf}
		#$(use_enable mono) \
}
