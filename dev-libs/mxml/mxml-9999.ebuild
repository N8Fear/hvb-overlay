EAPI=6

inherit git-r3 multilib

DESCRIPTION="Tiny XML Library"
HOMEPAGE="https://michaelrsweet.github.io/mxml"

EGIT_REPO_URI="https://github.com/michaelrsweet/mxml.git"

LICENSE="LGPL-2-with-linking-exception"
SLOT="0/${PV}"

src_install() {
	emake install DSTROOT="${D}"
	dodoc README.md CHANGES.md COPYING
}

