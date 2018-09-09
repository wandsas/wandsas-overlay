# Copyright 2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
RESTRICT="mirror"

DESCRIPTION="Gentoo shell config files"
HOMEPAGE="https://github.com/wandsas/gentoo-config"
SRC_URI="https://github.com/wandsas/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x64-cygwin ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

src_install() {
	#dodoc README.md

	# /etc/profile.d
	insinto /etc/profile.d
	doins etc/profile.d/aliases.sh
	doins etc/profile.d/functions.sh

	# /etc/bash
	insinto /etc/bash/bashrc.d
	doins etc/bash/bash_logout

	# /etc/zsh
	insinto /etc/zsh
	doins etc/zsh/zshenv

	# /usr/local/share/zsh/site-functions
	insinto /usr/local/share/zsh/site-functions
	doins usr/local/share/zsh/site-functions/prompt_wandsas_setup
	doins usr/local/share/zsh/site-functions/prompt_wandsas2_setup

}
