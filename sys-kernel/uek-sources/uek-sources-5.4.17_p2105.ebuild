# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
K_SECURITY_UNSUPPORTED="1"
ETYPE="sources"
inherit kernel-2
detect_version

DESCRIPTION="Oracle UEK (Unbreakable Enterprise Kernel) sources"
HOMEPAGE="https://github.com/oracle/linux-uek"
SRC_URI="https://github.com/oracle/linux-uek/archive/v5.4.17-2105.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="sys-libs/libdtrace-ctf"

src_unpack() {
	unpack ${P}.tar.gz || die
	mv linux-uek-5.4.17-2105 linux-5.4.17_p2105
}
