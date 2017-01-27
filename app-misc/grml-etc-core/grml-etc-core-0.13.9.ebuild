# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Core configuration files of Grml"
HOMEPAGE="http://github.com/wandsas/grml-etc-core.git"

if [[ ${PV} = *9999 ]]; then
	inherit git-r3
	KEYWORDS=""
	EGIT_REPO_URI="git://github.com/wandsas/grml-etc-core.git"
else
	KEYWORDS="~amd64 ~arm"
	SRC_URI="https://github.com/wandsas/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi
LICENSE="GPL-2"
SLOT="0"
IUSE="+git +tmux +vim +zsh +emacs +sh-libs"

src_install() {
	insinto /etc/skel
	use git && doins etc/skel/.gitconfig
	use emacs && doins etc/skel/.emacs
	use vim && doins etc/vim/.vim
	insinto /etc/grml
	use sh-libs && doins /etc/grml/lsb-functions
	use sh-libs && doins /etc/grml/screen_multisession
	use sh-libs && doins /etc/grml/screenrc
	use sh-libs && doins /etc/grml/screenrc_acpi
	use sh-libs && doins /etc/grml/screenrc_generic
	use sh-libs && doins /etc/grml/script-functions
	use sh-libs && doins /etc/grml/sysexits-sh
	insinto /etc
	use tmux && doins etc/tmux.conf
	use zsh && doins etc/grml_colors
	use zsh && doins etc/grml_nocolors
	use zsh && doins etc/minimal-shellrc
	insinto /etc/vim
	use vim && doins etc/vim/vimrc
	insinto /etc/zsh
	use zsh && doins etc/zsh/zshrc
}
