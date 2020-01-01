# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Multiple Repository management tool"
HOMEPAGE="https://github.com/wandsas/kitenet-mr"
SRC_URI=""
EGIT_REPO_URI="git://github.com/wandsas/kitenet-mr/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}
	dev-perl/libwww-perl
	dev-perl/HTML-Parser"

src_install() {
	dobin mr mr-recache mrdir webcheckout
	doman mr.1 webcheckout.1
	dodoc README debian/changelog \
		mrconfig mrconfig.complex

	insinto /usr/share/${PN}
	doins lib/*

	insinto /usr/local/share/zsh/site-functions
	doins zsh/mrcd zsh/_mr_repositories
}
