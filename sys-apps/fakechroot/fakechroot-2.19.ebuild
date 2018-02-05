# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools

if [[ ${PV} == 99999999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dex4er/fakechroot.git"
	EGIT_CHECKOUT_DIR="${WORKDIR}/fakechroot-${P}"
	KEYWORDS=""
else
	SRC_URI="https://github.com/${PN}/archive/${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Provide a faked chroot environment without requiring root privileges"
HOMEPAGE="https://github.com/dex4er/fakechroot.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 ~ppc ~ppc64 x86"
IUSE=""

RESTRICT="test"

src_configure() {
	econf --disable-static
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc NEWS.md README.md THANKS
	find "${D}" -name '*.la' -exec rm -f '{}' +
}
