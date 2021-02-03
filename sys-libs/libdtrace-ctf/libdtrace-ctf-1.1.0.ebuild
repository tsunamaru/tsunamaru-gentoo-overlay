# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=7

inherit autotools

DESCRIPTION="Port of the Solaris Compact Type Format library to Linux"
HOMEPAGE="https://github.com/oracle/libdtrace-ctf/"
SRC_URI="https://github.com/oracle/libdtrace-ctf/archive/1.1.0.zip"
LICENSE="UPL-1.0"

SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

DEPEND="dev-libs/elfutils
		sys-libs/zlib"

src_compile() {
	emake
}

src_install() {
	# You must *personally verify* that this trick doesn't install
	# anything outside of DESTDIR; do this by reading and
	# understanding the install part of the Makefiles.
	# This is the preferred way to install.
	emake DESTDIR="${D}" install

	# When you hit a failure with emake, do not just use make. It is
	# better to fix the Makefiles to allow proper parallelization.
	# If you fail with that, use "emake -j1", it's still better than make.

	# For Makefiles that don't make proper use of DESTDIR, setting
	# prefix is often an alternative.  However if you do this, then
	# you also need to specify mandir and infodir, since they were
	# passed to ./configure as absolute paths (overriding the prefix
	# setting).
	#emake \
	#	prefix="${D}"/usr \
	#	mandir="${D}"/usr/share/man \
	#	infodir="${D}"/usr/share/info \
	#	libdir="${D}"/usr/$(get_libdir) \
	#	install
	# Again, verify the Makefiles!  We don't want anything falling
	# outside of ${D}.
}
