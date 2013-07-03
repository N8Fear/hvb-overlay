# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kde-meta/kde-meta-4.10.5.ebuild,v 1.1 2013/07/02 16:48:01 johu Exp $

EAPI=5
inherit kde4-meta-pkg

DESCRIPTION="KDE - merge this to pull in all split kde-base/* packages"
KEYWORDS=" ~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="accessibility nls sdk semantic-desktop"

RDEPEND="
	$(add_kdebase_dep kate)
	$(add_kdebase_dep kdeadmin-meta)
	$(add_kdebase_dep kdeartwork-meta)
	$(add_kdebase_dep kdebase-meta)
	$(add_kdebase_dep kdenetwork-meta)
	$(add_kdebase_dep kdeutils-meta)
	nls? ( $(add_kdebase_dep kde-l10n) )
"
