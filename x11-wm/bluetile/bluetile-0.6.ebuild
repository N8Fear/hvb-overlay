# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

# ebuild generated by hackport 0.2.13

EAPI="3"

CABAL_FEATURES="bin lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="A tiling window manager"
HOMEPAGE="http://bluetile.org"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~sparc ~x86"
IUSE="+default-term pass-focus-click"

RDEPEND="dev-haskell/mtl[profile?]
		=dev-haskell/utf8-string-0.3*[profile?]
		>=dev-haskell/x11-1.5[profile?] <dev-haskell/x11-1.7[profile?]
		>=dev-lang/ghc-6.10.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.2
		dev-haskell/configfile
		dev-haskell/glade
		dev-haskell/regex-compat
		dev-haskell/x11-xft
		dev-haskell/gtk

		>=x11-wm/xmonad-contrib-0.10"
PDEPEND="default-term? ( x11-terms/xterm )
	x11-apps/xmessage
"

SAMPLE_CONFIG="bluetile.hs"
SAMPLE_CONFIG_LOC="man"

