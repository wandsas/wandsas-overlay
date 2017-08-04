# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit check-reqs font python-single-r1

DESCRIPTION="Collection of fonts that are patched to include a high number of glyphs (icons). Also includes a FontForge patcher to patch your own fonts with glyphs."
HOMEPAGE="http://nerdfonts.com/"
SRC_URI="https://github.com/ryanoasis/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+fonts scripts"

REQUIRED_USE="
			|| ( fonts scripts )
"

DEPEND=""
RDEPEND="
		${DEPEND}
		media-libs/fontconfig
		scripts? ( 
				media-fonts/font-util
				media-gfx/fontforge[${PYTHON_USEDEP}] 
				x11-apps/bdftopcf
				x11-apps/mkfontdir
				x11-apps/mkfontscale
		)
"

FONT_CONF=( "${S}"/10-nerd-font-symbols.conf )
FONT_S=${S}
FONT_SUFFIX="otf ttf"

pkg_pretend() { 

	CHECKREQS_DISK_BUILD="650M"

	check-reqs_pkg_setup

}

src_prepare() { 
	
	default

	# move all patched font files to a single directory so font_src_install works

	if use fonts ; then 

		find patched-fonts/ \( -name '*.otf' -o -name '*.ttf' \) -exec mv {} . \; || die "Finding fonts failed"

	fi


	if use scripts ; then 

		cat <<- EOF > "${T}"/font-patcher
						#!/bin/bash
						/usr/share/nerd-fonts/font-patcher "\$@"
				EOF

	fi

	
}

src_install() { 
	
	if use fonts ; then 

		font_src_install

	fi

	# paths are hardcoded into script files
	if use scripts ; then 

		mkdir -p "${D}"/usr/share/${PN}
		cp -r bin/ "${D}"/usr/share/${PN}

		cp changelog.md "${D}"/usr/share/${PN}

		mkdir -p "${D}"/usr/share/${PN}/src
		cp -r src/glyphs "${D}"/usr/share/${PN}/src

		sed -i 's|changelog.md|/usr/share/nerd-fonts/changelog.md|g' font-patcher
		sed -i 's|src/glyphs/|/usr/share/nerd-fonts/src/glyphs/|g' font-patcher
		exeinto /usr/share/${PN}
			doexe font-patcher

		exeinto /usr/bin
			doexe "${T}"/font-patcher

	fi

	dodoc readme.md

}
