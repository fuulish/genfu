# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="(chez (chez scheme))"
HOMEPAGE="https://www.scheme.com/"
SRC_URI="https://github.com/cisco/ChezScheme/releases/download/v9.5.2/csv9.5.2.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="threads -x11"

DEPEND="sys-libs/ncurses
		x11? ( x11-libs/libX11 )"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}/csv9.5.2
LDFLAGS=""
OPTS=""

src_configure() {
	LDFLAGS="${LDFLAGS} -lncurses -ltinfo"

	if ! use x11; then
	    OPTS="${OPTS} --disable-x11"
	fi

	if use threads; then
		OPTS="${OPTS} --threads"
	fi

	./configure --installprefix=/usr ${OPTS} LDFLAGS="${LDFLAGS}" --temproot=${D}
}
