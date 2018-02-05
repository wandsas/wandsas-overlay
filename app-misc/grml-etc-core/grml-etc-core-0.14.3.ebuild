# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Core configuration files of Grml"
HOMEPAGE="http://github.com/grml/grml-etc-core.git"

if [[ ${PV} = *9999 ]]; then
	inherit git-r3
	KEYWORDS=""
	EGIT_REPO_URI="git://github.com/grml/grml-etc-core.git"
else
	KEYWORDS="~amd64 ~arm"
	SRC_URI="https://github.com/grml/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi
LICENSE="GPL-2"
SLOT="0"
IUSE="+git +tmux +vim +zsh"

src_install() {
	insinto /etc
	use git && newins etc/skel/.gitconfig gitconfig
}
