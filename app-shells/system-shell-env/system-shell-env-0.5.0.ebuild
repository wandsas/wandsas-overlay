# Copyright 2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
RESTRICT="mirror"

case "${PV}" in
	(9999*)
	KEYWORDS=""
	VCS_ECLASS=git-2
	EGIT_REPO_URI="git://github.com/wandsas/${PN}.git"
	EGIT_PROJECT="${PN}.git"
	;;
	(*)
	KEYWORDS="~amd64 ~arm ~x86"
	VCS_ECLASS="vcs-snapshot"
	SRC_URI="https://github.com/wandsas/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	;;
esac


DESCRIPTION="System-wide config files for bash and zsh"
HOMEPAGE="https://github.com/wandsas/system-shell-env"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x64-cygwin ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="bash zsh"

src_install() {

	dodoc README.md

	insinto /etc/zsh
	use zsh && doins zsh/zshenv zshenv
	use zsh && doins zsh/zshrc zshrc
	use zsh && doins zsh/zlogout zlogout
	use zsh && doins -r zsh/rc.d rc.d

	insinto /etc/bash
	use bash && doins bash/bashrc bashrc
	use bash && doins bash/bash_logout bash_logout
	use bash && doins -r bash/rc.d rc.d

	insinto /usr/local/share/zsh
	use zsh && doins -r zsh-site-functions site-function
}
