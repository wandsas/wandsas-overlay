# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="My current config for the zsh"
HOMEPAGE="http://rpi.gnu.local/root/zsh-system-config.git"

if [[ ${PV} = *9999 ]]; then
	inherit git-r3
	KEYWORDS=""
	EGIT_REPO_URI="http://rpi.gnu.local/root/zsh-system-config.ebuild"
else
	KEYWORDS="~amd64 ~arm"
	SRC_URI="https://github.com/wandsas/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi
LICENSE="GPL-2"
SLOT="0"
IUSE="+zsh"

src_install() {
	insinto /etc/zsh
	use zsh && newins zlogin zlogin
	use zsh && newins zshenv zshenv
	use zsh && newins zprofile zprofile
	use zsh && newins zshrc zshrc
	use zsh && newins zlogout zlogout
}
