# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-crypt/oclhashcat-bin/oclhashcat-bin-0.15.ebuild,v 1.1 2013/08/25 05:08:17 zerochaos Exp $

EAPI=5

inherit eutils pax-utils

DESCRIPTION="An opencl multihash cracker"
HOMEPAGE="http://hashcat.net/oclhashcat/"

MY_P="oclHashcat-${PV}"
SRC_URI="http://hashcat.net/files/${MY_P}.7z"

LICENSE="hashcat"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"

IUSE_VIDEO_CARDS="video_cards_fglrx
	video_cards_nvidia"

IUSE="virtualcl ${IUSE_VIDEO_CARDS}"

RDEPEND="sys-libs/zlib
	video_cards_nvidia? ( >=x11-drivers/nvidia-drivers-319.37 )
	video_cards_fglrx?  ( >=x11-drivers/ati-drivers-13.4 )"
DEPEND="${RDEPEND}
	app-arch/p7zip"

S="${WORKDIR}/${MY_P}"

RESTRICT="strip"
QA_PREBUILT="*Hashcat*.bin
	    opt/${PN}/kernels/4098/*.llvmir"

src_prepare() {
	use x86 && rm *Hashcat64*
	use amd64 && rm *Hashcat32*
	use virtualcl || rm vclHashcat*

	if ! use video_cards_fglrx; then
		rm -r kernels/4098 || die
		rm oclHashcat*.bin || die
	fi
	if ! use video_cards_nvidia; then
		rm -r kernels/4318 || die
		rm cudaHashcat*.bin || die
	fi

	#paxmark goes here so test and install works
	pax-mark r *Hashcat*.bin
}

src_test() {
	printf "%02x" ${PV#0.} > "${S}"/eula.accepted
	if use video_cards_nvidia; then
		addwrite /dev/nvidia0
		addwrite /dev/nvidiactl
		if [ ! -w /dev/nvidia0 ]; then
			einfo "To run these tests, portage likely must be in the video group."
			einfo "Please run \"gpasswd -a portage video\" if the tests will fail"
		fi
		if use amd64; then
			./cudaHashcat64.bin -a 3 -m 1500 nQCk49SiErOgk || die
		elif use x86; then
			./cudaHashcat32.bin -a 3 -m 1500 nQCk49SiErOgk || die
		fi
	fi
	if use video_cards_fglrx; then
		addwrite /dev/ati
		if use amd64; then
			./oclHashcat64.bin -a 3 -m 1500 nQCk49SiErOgk || die
		elif use x86; then
			./oclHashcat32.bin -a 3 -m 1500 nQCk49SiErOgk || die
		fi
	fi
	rm eula.accepted hashcat.pot hashcat.dictstat
}

src_install() {
	dodoc docs/*
	rm -r "${S}"/*.exe "${S}"/*.cmd "${S}"/docs || die

	insinto /opt/${PN}
	doins -r "${S}"/* || die "Copy files failed"

	dodir /opt/bin

	cat <<-EOF > "${ED}"/opt/bin/oclhashcat
		#! /bin/sh
		echo "oclHashcat and all related files have been installed in /opt/${PN}"
		echo "Please run one of the following binaries to use gpu accelerated hashcat:"
	EOF

	for x in oclHashcat64.bin oclHashcat32.bin cudaHashcat64.bin cudaHashcat32.bin vclHashcat64.bin vclHashcat32.bin
	do
		if [ -f "${ED}"/opt/${PN}/${x} ]
		then
			case "${x}" in
				oclHashcat64.bin)
					echo "echo '64 bit ATI accelerated \"oclHashcat64.bin\"'" >> "${ED}"/opt/bin/oclhashcat
					;;
				oclHashcat32.bin)
					echo "echo '32 bit ATI accelerated \"oclHashcat32.bin\"'" >> "${ED}"/opt/bin/oclhashcat
					;;
				cudaHashcat64.bin)
					echo "echo '64 bit NVIDIA accelerated \"cudaHashcat64.bin\"'" >> "${ED}"/opt/bin/oclhashcat
					;;
				cudaHashcat32.bin)
					echo "echo '32 bit NVIDIA accelerated \"cudaHashcat32.bin\"'" >> "${ED}"/opt/bin/oclhashcat
					;;
				vclHashcat64.bin)
					echo "echo '64 bit VirtualCL Cluster support \"vclHashcat64.bin\"'" >> "${ED}"/opt/bin/oclhashcat
					;;
				vclHashcat32.bin)
					echo "echo '32 bit VirtualCL Cluster support \"vclHashcat32.bin\"'" >> "${ED}"/opt/bin/oclhashcat
					;;
			esac

			fperms +x /opt/${PN}/${x}

			cat <<-EOF > "${ED}"/opt/bin/${x}
				#! /bin/sh
				cd /opt/${PN}
				echo "Warning: ${x} is running from /opt/${PN} so be careful of relative paths."
				exec ./${x} "\$@"
			EOF

			fperms +x /opt/bin/${x}

		fi
	done

	fperms +x /opt/bin/oclhashcat
	fowners -R root:video /opt/${PN}
	fperms g+w /opt/${PN}
	einfo "oclhashcat can be run as user if you are in the video group"
}

pkg_preinst() {
	#I feel so dirty doing this
	#first we remove the eula.accepted because it cannot properly handle and empty or old one (crash or doesn't run at all)
	rm -f "${EROOT}"/opt/${PN}/eula.accepted
	#next we remove any compiled kernel files as these get built on first run only if they aren't there because there are no timestamp checks
	rm -f "${EROOT}"/opt/${PN}/kernels/{4318,4098}/"*.kernel"
	#have mercy on my soul
}
