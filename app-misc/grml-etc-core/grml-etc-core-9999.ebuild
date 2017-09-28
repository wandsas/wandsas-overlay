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
IUSE="+colors +git +tmux +screen +mercurial +vim +emacs +zsh +functions"

src_install() {
	insinto /etc
	use colors && newins etc/grml_colors grml_colors
	use colors && newins etc/grml_nocolors grml_nocolors
	use git && newins etc/skel/.gitconfig gitconfig
	uuse git && newins etc/skel/.gitconfig gitconfig
	use mercurial && newins etc/skel/.hgrc mercurial/hgrc
	use tmux && doins etc/tmux.conf tmux.conf


	insinto /etc/vim
	use vim && doins etc/vim/vimrc vimrc

	insinto /etc/zsh
	use zsh && doins etc/zsh/zshrc zshrc
	use zsh && doins etc/zsh/zlogin zlogin
	use zsh && doins etc/zsh/zlogout zlogout
	use zsh && doins etc/zsh/zprofile zprofile

	insinto /etc/grml
	use screenrc && doins /etc/grml/screenrc screenrc
	use screenrc && doins /etc/grml/screenrc_acpi screenrc_acpi
	use screenrc && doins /etc/grml/screenrc_generic screenrc_generic
	use screenrc && doins /etc/grml/screen_multisession screen_multisession
	use functions && doins /etc/grml/lsb-functions lsb-functions
	use functions && doins /etc/grml/script-functions script-functions
	use functions && doins /etc/grml/sysexits-sh sysexits-sh

	insinto /etc/skel
	use mercurial && doins /etc/skel/.hgrc .hgrc
	use zsh && doins /etc/skel/.zshrc .zshrc
	use vim && doins /etc/skel/.vim .vim

	insinto /etc/skel/.vim
	use vim && doins /etc/skel/.vim/klammerpaare.vim klammerpaare.vim
	use vim && doins /etc/skel/.vim/ftplugin/c.vim ftplugin/c.vim
	use vim && doins /etc/skel/.vim/plugin/DirDiff.vim plugin/DifDiff.vim




}
