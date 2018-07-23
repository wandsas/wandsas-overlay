# Copyright 2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
RESTRICT="mirror"

DESCRIPTION="System shell environment files for bash and zsh"
HOMEPAGE="https://github.com/wandsas/system-shell-env"
SRC_URI="https://github.com/wandsas/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x64-cygwin ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

src_install() {
	dodoc README.md

	insinto /etc/profile.d
	newins etc/profile.d/aliases.sh aliases.sh
	newins etc/profile.d/functions.sh functions.sh

	insinto /etc/zsh
	newins etc/zsh/zshenv
	newins etc/zsh/zshrc
	newins etc/zsh/zshrc.d/completions.sh
	newins etc/zsh/options

	insinto /etc/bash/bash
	newins etc/bash/bashrc.d/bash-prompt.sh
}
