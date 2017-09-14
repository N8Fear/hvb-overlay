# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit git-r3 eutils flag-o-matic autotools

EGIT_REPO_URI="https://github.com/neomutt/neomutt.git"
DESCRIPTION="Bringing together all the Mutt code."
HOMEPAGE="http://www.neomutt.org/"
IUSE="berkdb crypt debug doc gdbm gnutls gpg hcache idn imap kerberos libressl -lua mbox nls notmuch pop qdbm sasl selinux sidebar slang smime smtp ssl tokyocabinet"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS=""
CDEPEND="
	app-misc/mime-types
	nls? ( virtual/libintl )
	tokyocabinet?  ( dev-db/tokyocabinet )
	!tokyocabinet? (
		qdbm?  ( dev-db/qdbm )
		!qdbm? (
			gdbm?  ( sys-libs/gdbm )
			!gdbm? ( berkdb? ( >=sys-libs/db-4 ) )
		)
	)
	imap?    (
		gnutls?  ( >=net-libs/gnutls-1.0.17 )
		!gnutls? (
			ssl? (
				!libressl? ( >=dev-libs/openssl-0.9.6:0 )
				libressl? ( dev-libs/libressl )
			)
		)
		sasl?    ( >=dev-libs/cyrus-sasl-2 )
	)
	kerberos? ( virtual/krb5 )
	pop?     (
		gnutls?  ( >=net-libs/gnutls-1.0.17 )
		!gnutls? (
			ssl? (
				!libressl? ( >=dev-libs/openssl-0.9.6:0 )
				libressl? ( dev-libs/libressl )
			)
		)
		sasl?    ( >=dev-libs/cyrus-sasl-2 )
	)
	smtp?     (
		gnutls?  ( >=net-libs/gnutls-1.0.17 )
		!gnutls? (
			ssl? (
				!libressl? ( >=dev-libs/openssl-0.9.6:0 )
				libressl? ( dev-libs/libressl )
			)
		)
		sasl?    ( >=dev-libs/cyrus-sasl-2 )
	)
	idn?     ( net-dns/libidn )
	gpg?     ( >=app-crypt/gpgme-0.9.0 )
	smime?   (
		!libressl? ( >=dev-libs/openssl-0.9.6:0 )
		libressl? ( dev-libs/libressl )
	)
	slang? ( sys-libs/slang )
	!slang? ( >=sys-libs/ncurses-5.2:0 )
"
DEPEND="${CDEPEND}
	!mail-client/mutt
	net-mail/mailbase
	doc? (
		dev-libs/libxml2
		dev-libs/libxslt
		app-text/docbook-xsl-stylesheets
		|| ( www-client/lynx www-client/w3m www-client/elinks )
	)"
RDEPEND="${CDEPEND}
	selinux? ( sec-policy/selinux-mutt )
"

src_prepare() {
	eapply_user

	# many patches touch the buildsystem, we always need this
	AT_M4DIR="m4" eautoreconf

	# the configure script contains some "cleverness" whether or not to setgid
	# the dotlock program, resulting in bugs like #278332
	sed -i -e 's/@DOTLOCK_GROUP@//' \
		Makefile.in || die "sed failed"

	# don't just build documentation (lengthy process, with big dependencies)
	if use !doc ; then
		sed -i -e '/SUBDIRS =/s/doc//' Makefile.in || die
	fi
}

src_configure() {
	local myconf="
		$(use_enable crypt pgp) \
		$(use_enable debug) \
		$(use_enable gpg gpgme) \
		$(use_enable lua) \
		$(use_enable notmuch) \
		$(use_enable nls) \
		$(use_enable smime) \
		$(use_with kerberos gss) \
		$(use slang && echo --with-slang=${EPREFIX}/usr) \
		$(use !slang && echo --with-curses=${EPREFIX}/usr) \
		--sysconfdir=${EPREFIX}/etc/${PN} \
		--with-docdir=${EPREFIX}/usr/share/doc/${PN}-${PVR} \
		"

	case $CHOST in
		*-solaris*)
			# Solaris has no flock in the standard headers
			myconf+=" --enable-fcntl --disable-flock"
			# wchar_t depends on locale
			myconf+=" --without-wc-funcs"
		;;
		*)
			myconf+=" --disable-fcntl --enable-flock"
		;;
	esac

	# mutt prioritizes gdbm over bdb, so we will too.
	# hcache feature requires at least one database is in USE.
	if use tokyocabinet; then
		myconf="${myconf} \
			--with-tokyocabinet --without-qdbm --without-gdbm --without-bdb"
	elif use qdbm; then
		myconf="${myconf} \
			--without-tokyocabinet --with-qdbm --without-gdbm --without-bdb"
	elif use gdbm ; then
		myconf="${myconf} \
			--without-tokyocabinet --without-qdbm --with-gdbm --without-bdb"
	elif use berkdb; then
		myconf="${myconf} \
			--without-tokyocabinet --without-qdbm --without-gdbm --with-bdb"
	else
		myconf="${myconf} \
			--without-tokyocabinet --without-qdbm --without-gdbm --without-bdb"
	fi

	# there's no need for gnutls, ssl or sasl without socket support
	if use pop || use imap || use smtp ; then
		if use gnutls; then
			myconf="${myconf} --with-gnutls"
		elif use ssl; then
			myconf="${myconf} --with-ssl"
		fi
		# not sure if this should be mutually exclusive with the other two
		myconf="${myconf} $(use_with sasl)"
	else
		myconf="${myconf} --without-gnutls --without-ssl --without-sasl"
	fi

	if use mbox; then
		myconf="${myconf} --with-mailpath=${EPREFIX}/var/spool/mail"
	else
		myconf="${myconf} --with-homespool=Maildir"
	fi

	econf ${myconf} || die "configure failed"

  # hacky
  sed -i Makefile -e s/ncursesw/ncursesw\ -ltinfow/
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	if use mbox; then
		insinto /etc/mutt
		newins "${FILESDIR}"/Muttrc.mbox Muttrc
	else
		insinto /etc/mutt
		doins "${FILESDIR}"/Muttrc
	fi

	# A newer file is provided by app-misc/mime-types. So we link it.
	rm "${ED}"/etc/${PN}/mime.types
	dosym /etc/mime.types /etc/${PN}/mime.types

	#if use !prefix ; then
	#	fowners root:mail /usr/bin/mutt_dotlock
	#	fperms g+s /usr/bin/mutt_dotlock
	#fi

	dodoc COPYRIGHT ABOUT-NLS CODE_OF_CONDUCT.md CONTRIBUTING.md LICENSE.md README*
}

pkg_postinst() {
	if [[ -z ${REPLACING_VERSIONS} ]] ; then
		echo
		elog "If you are new to mutt you may want to take a look at"
		elog "the Gentoo QuickStart Guide to Mutt E-Mail:"
		elog "   https://wiki.gentoo.org/wiki/Mutt"
	fi
}
