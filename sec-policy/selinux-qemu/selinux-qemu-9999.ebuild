# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="4"

IUSE=""
MODS="qemu"
BASEPOL="9999"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for qemu"

KEYWORDS=""
DEPEND="${DEPEND}
	sec-policy/selinux-virt
"
RDEPEND="${DEPEND}"
