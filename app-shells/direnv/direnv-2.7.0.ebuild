# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="An environment switcher for the shell"
HOMEPAGE="http://direnv.net/"
SRC_URI="https://github.com/direnv/direnv/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}usr" install
	dodoc README.md
}

pkg_postinst() {
	elog "To activate ${PN} in your bash shells, you must add the following"
	elog "to your ~/.bashrc file:"
	elog ""
	elog '    eval "$(direnv hook bash)"'
	elog ""
	elog "If you use an alternate shell, see ${HOMEPAGE}"
}
