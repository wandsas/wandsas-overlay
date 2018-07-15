# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Grub menu entries for the .iso image of Grml Debian based Live Linux"
HOMEPAGE="http://grml.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT=0
KEYWORDS="~amd64"

S=${WORKDIR}

RDEPEND="app-admin/grml64-full
	sys-boot/grub"

src_install() {
	exeinto /etc/grub.d
	newexe "${FILESDIR}"/grml-rescueboot.grub 42_grml

	insinto /etc/default
	newins "${FILESDIR}"/grml-rescueboot.default grml-rescueboot
}

pkg_postinst() {
	elog "To add the menu entries for grml64-full to grub, you should now run"
	elog "	grub-mkconfig -o /boot/grub/grub.cfg"
	elog "You can set custom bootoptions in /etc/default/grml-rescueboot"
}
