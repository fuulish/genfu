# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="
	https://github.com/sharkdp/bat/archive/v0.9.0.tar.gz
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/rust-1.29
dev-util/cmake
sys-libs/zlib"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	cargo build --release
}

src_install() {
	dobin ${WORKDIR}/${P}/target/release/bat
}
