# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="4"

IUSE=""
MODS="squid"
BASEPOL="9999"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for squid"

KEYWORDS=""
DEPEND="${DEPEND}
	sec-policy/selinux-apache
"
RDEPEND="${DEPEND}"
