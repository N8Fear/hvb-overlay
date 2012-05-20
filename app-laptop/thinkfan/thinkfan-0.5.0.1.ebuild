# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A minimalist fan control program. Supports the sysfs hwmon
interface and thinkpad_acpi"
HOMEPAGE="https://phuk.ath.cx:3443/wordpress/?p=93"
SRC_URI="http://phuk.ath.cx:3080/thinkfan/thinkfan-$PV.tar.bz2"

LICENSE="Creative Commons Attribution-Share Alike 3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND=""
RDEPEND=""

src_compile() {
	cd $S
	if use debug; then
		gcc -Wall -g -D DEBUG $CFLAGS -o thinkfan thinkfan.c
	else
		gcc -Wall $CFLAGS -o thinkfan thinkfan.c
	fi
}

src_install() {
	dosbin thinkfan

	exeinto /etc/init.d
	newexe init.d/thinkfan.gentoo thinkfan

	dodoc README thinkfan.conf.example ChangeLog* || die
	if ! [[ -f /proc/acpi/ibm/fan ]]; then 
		elog "thinkpad_acpi procfs entries don't seem to exist." \
		 "You'll need to use the generic sysfs hwmon interface. See README."
	else
		elog "This seems to be a Thinkpad. You should use the IBM" \
		 "interface. See README."
	fi
	elog "If you're upgrading from <=thinkfan-0.4, you'll have" \
	 "to delete /var/run/thinkfan.pid."
}
