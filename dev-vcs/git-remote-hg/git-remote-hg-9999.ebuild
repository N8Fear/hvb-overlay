EAPI="5"

inherit git-2 eutils

DESCRIPTION="Semi official mercurial bridge for git"
HOMEPAGE="https://github.com/felipec/git-remote-hg.git"
EGIT_REPO_URI="https://github.com/felipec/git-remote-hg.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="app-text/asciidoc"
DEPEND="dev-lang/python"
RDEPEND="${DEPEND}
		dev-vcs/mercurial"


src_install() {
	dobin git-remote-hg
	dodoc LICENSE
	dodoc doc/git-remote-hg.1
}

