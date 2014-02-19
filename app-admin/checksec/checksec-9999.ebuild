# Copyright 2014 Hinnerk van Bruinehsen
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit git-2

DESCRIPTION="A script checking for different hardening features"
HOMEPAGE="https://github.com/slimm609/checksec.sh.git"
EGIT_REPO_URI="https://github.com/slimm609/checksec.sh.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"


src_install() {
	insinto /bin/
	doins "${WORKDIR}/${P}/checksec.sh"
	insinto /usr/share/doc/${P}/
	doins "${WORKDIR}/${P}/changelog"
	doins "${WORKDIR}/${P}/README.md"
}
