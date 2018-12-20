# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://www.catb.org/~esr/src/src-1.22.tar.gz"

LICENSE="BSD LICENSE"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="graphviz"

DEPEND="dev-vcs/rcs
graphviz? ( media-gfx/graphviz )"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake prefix="${D}/usr" install
}
