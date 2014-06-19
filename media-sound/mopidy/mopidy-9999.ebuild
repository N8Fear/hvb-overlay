EAPI="5"

EGIT_REPO_URI="git://github.com/jodal/mopidy.git"
PYTHON_DEPEND="2:2.7"

inherit eutils distutils git-2

DESCRIPTION="Hackable MPD server"
HOMEPAGE="http://www.mopidy.com/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="${RDEPEND}"
