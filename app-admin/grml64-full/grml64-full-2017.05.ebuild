# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit versionator
MY_PN="grml64-full"
MY_PV="2017.05"
MY_P="${MY_PN}_${MY_PV}"

DESCRIPTION="The .iso image of Grml Debian base Live Linux amd64 variant"
HOMEPAGE="http://grml.org/"
# Large ISO mirroring explicitly approved by infra in bug #588766
SRC_URI="http://download.grml.org/${MY_P}.iso"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S=${WORKDIR}

src_install() {
	insinto "/boot/${PN%-*}"
	doins "${DISTDIR}/${MY_P}.iso"
}
