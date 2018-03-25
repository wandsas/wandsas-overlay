# Copyright 2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
RESTRICT="mirror"

DESCRIPTION="Config for the Neovim editor"
HOMEPAGE="https://github.com/wandsas/nvim-config"
SRC_URI="https://github.com/wandsas/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x64-cygwin ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

src_install() {
	dodoc README.md

	insinto /etc/vim
	newins .config/nvim/init.vim nvimrc.local

	insinto /usr/share/nvim/runtime/autoload
	newins .config/nvim/autoload/plug.vim plug.vim
}
