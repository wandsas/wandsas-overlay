# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="My current config of the Tmux Multiplexer"
HOMEPAGE="http://github.com/wandsas/tmux-system-config.git"

if [[ ${PV} = *9999 ]]; then
	inherit git-r3
	KEYWORDS=""
	EGIT_REPO_URI="git://github.com/wandsas/app-misc/tmux-system-config.git"
else
	KEYWORDS="~amd64 ~arm"
	SRC_URI="https://github.com/wandsas/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi
LICENSE="GPL-2"
SLOT="0"
IUSE="+tmux"

src_install() {
	insinto /etc
	use tmux && newins .tmux.conf tmux.conf
}
