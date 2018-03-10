# Copyright 2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
RESTRICT="mirror"

DESCRIPTION="Fork of the grml-etc-core project of the Grml Live Linux"
HOMEPAGE="https://github.com/wandsas/grml-etc-core"
SRC_URI="https://github.com/wandsas/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x64-cygwin ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="git tmux zsh"

src_install() {
	dodoc README.md
	insinto /etc
	use tmux && doins etc/tmux.conf tmux.conf
	use git && newins etc/skel/.gitconfig gitconfig

	insinto /etc/zsh
	use zsh && doins etc/zsh/zlogin zlogin
	use zsh && doins etc/zsh/zlogout zlogout
	use zsh && doins etc/zsh/zprofile zprofile
	use zsh && doins etc/zsh/zshenv zshenv
	use zsh && doins etc/zsh/zshrc zshrc
}
