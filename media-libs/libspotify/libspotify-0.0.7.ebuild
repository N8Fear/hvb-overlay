inherit eutils

DESCRIPTION="The libspotify C API package allows third party developers to write applications that utilize the Spotify music streaming service."
HOMEPAGE="http://developer.spotify.com/en/libspotify/overview/"

MY_ARCH=${ARCH/x86/i686}
MY_ARCH=${MY_ARCH/amd64/x86_64}
ANAME="${P}-linux6-${MY_ARCH}"
S="${WORKDIR}/${ANAME}"

URI_BASE="http://developer.spotify.com/download/libspotify/${P}-linux6-"
SRC_URI="x86? ( ${URI_BASE}i686.tar.gz )
	 amd64? ( ${URI_BASE}x86_64.tar.gz )"

LICENSE="Spotify"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

#It could be installed in the same time, but libopenspotify installs
#in the wrong directory.
RDEPEND="!media-libs/libopenspotify"
DEPEND="${RDEPEND}"


src_compile() {
	      :
}

src_install() {
	emake prefix="${D}/${DESTTREE}" install || die
	dodoc README ChangeLog
	if use doc; then
	  mkdir -p "${D}/${DESTTREE}/share/man/" || die
	  cp -r share/man3 "${D}/${DESTTREE}/share/man/" || die
	  cd share/doc/libspotify || die
	  mkdir -p "${D}/${DESTTREE}/share/doc/libspotify" || die
	  cp -r html images examples "${D}/${DESTTREE}/share/doc/libspotify" || die
	fi
}
