# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id: sys-kernel/git-sources/git-sources-4.11.3.ebuild,v 2.2 2015/10/10 Exp $

EAPI="5"
ETYPE="sources"
K_DEBLOB_AVAILABLE="1"
#PATCHSET=(aufs bfq ck fbcondecor gentoo hardened muqss)
PATCHSET=(aufs gentoo hardened)

OKV="${PV}"
MKV="${PV%.*}"
KV_PATCH="${PV##*.}"

CK_VER="${MKV}-ck1"
CK_SRC=${CK_VER}-broken-out.tar.xz
GENTOO_VER="${MKV}-1"
FBCONDECOR_VER="${GENTOO_VER}"
HARDENED_VER="4.9.24-1"
REISER4_VER="${MKV}.0"
#AUFS_VER="${MKV}"

inherit kernel-git
