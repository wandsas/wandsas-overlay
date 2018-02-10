# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="My current gitconfig"
HOMEPAGE="http://github.com/wandsas/git-system-config.git"

if [[ ${PV} = *9999 ]]; then
	inherit git-r3
	KEYWORDS=""
	EGIT_REPO_URI="git://github.com/wandsas/app-misc/git-system-config.ebuild"
else
	KEYWORDS="~amd64 ~arm"
	SRC_URI="https://github.com/wandsas/${PN}/archive/${ PV}.tar.gz -> ${P}.tar.gz"
fi
LICENSE="GPL-2"
SLOT="0"
IUSE="+git"

src_install() {
	insinto /etc
	use git && newins /etc/gitconfig gitconfig
}
