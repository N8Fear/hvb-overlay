EAPI=6
inherit meson git-r3

DESCRIPTION="A modular Wayland compostitor library"
HOMEPAGE="https://github.com/swaywm/wlroots"
EGIT_REPO_URI="https://github.com/swaywm/wlroots.git"
LICENSE="MIT"
SLOT="0"

IUSE="libcap systemd elogind xwayland"

#deps missing
#DEPEND


src_configure() {
	local emesonargs=(
		-Denable_libcap=$(usex libcap true false)
		-Denable_systemd=$(usex systemd true false)
		-Denable_elogind=$(usex elogind true false)
		-Denable_xwayland=$(usex xwayland true false)
	)
	meson_src_configure
}
