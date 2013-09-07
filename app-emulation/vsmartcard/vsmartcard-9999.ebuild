
EAPI="5"


inherit autotools git-2

DESCRIPTION="a smartcard emulator written in python"
HOMEPAGE="http://sourceforge.net/projects/vsmartcard/"
EGIT_REPO_URI="https://github.com/frankmorgner/vsmartcard.git"

LICENSE="GLPv3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-lang/python
		dev-python/pycrypto
		dev-python/pyscard
		sys-apps/pcsc-lite
"
RDEPEND="${DEPEND}"

src_prepare() {
	cd ${WORKDIR}/vsmartcard-9999/virtualsmartcard
	sed -i 's/if test "${prefix}" = NONE ; then/if test "${prefix}" != NONE ; then/' configure.ac || die 'sed failed'
	eautoreconf
}

src_configure() {
	cd ${WORKDIR}/vsmartcard-9999/virtualsmartcard
	econf
}

src_compile() {
	cd ${WORKDIR}/vsmartcard-9999/virtualsmartcard
	emake
}

src_install() {
	cd ${WORKDIR}/vsmartcard-9999/virtualsmartcard
	emake DESTDIR="${D}" install

	insinto /etc/reader.conf.d
	doins "${FILESDIR}/vsc-flexcos"
}
