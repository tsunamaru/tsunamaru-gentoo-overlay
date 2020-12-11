# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Python classes to extract information from the Linux kernel /proc files"
HOMEPAGE="https://www.kernel.org/pub/scm/libs/python/python-linux-procfs/
	https://kernel.googlesource.com/pub/scm/libs/python/python-linux-procfs/python-linux-procfs/"
SRC_URI="https://git.kernel.org/pub/scm/libs/python/${PN}/${PN}.git/snapshot/${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/six[${PYTHON_USEDEP}]"

PATCHES=(
	"${FILESDIR}/${P}-fix-utillist-import.patch"
)