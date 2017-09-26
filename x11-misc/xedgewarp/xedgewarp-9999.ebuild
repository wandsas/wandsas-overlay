# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 toolchain-funcs

DESCRIPTION="window manager agnostic pointer warping between outputs"
HOMEPAGE="https://github.com/Airblader/xedgewarp"
SRC_URI=""
EGIT_REPO_URI="https://github.com/Airblader/xedgewarp.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

CDEPEND=">=x11-libs/libX11-1.6.2
>=x11-libs/libXi-1.7.4
>=x11-libs/libXrandr-1.4.2
>=x11-libs/libxcb-1.11-r1
>=x11-libs/xcb-util-0.4.0"
DEPEND="app-text/asciidoc
${CDEPEND}"
RDEPEND="${CDEPEND}"

src_prepare() {
	sed -i "s/CC = \(.\+\)/CC = $(tc-getCC)/" Makefile \
		|| die "Patching Makefile failed"
}

src_install() {
	dobin xedgewarp
	doman man/xedgewarp.1
}
