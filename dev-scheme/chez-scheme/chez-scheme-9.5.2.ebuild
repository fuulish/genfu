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

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}/csv9.5.2
LDFLAGS=""
OPTS=""

src_configure() {
	LDFLAGS='-lncurses -ltinfo'
	if use threads; then
		OPTS='--threads'
	fi
	./configure --installprefix=${D}/usr ${OPTS} $(use_enable x11) LDFLAGS="${LDFLAGS}"
}
