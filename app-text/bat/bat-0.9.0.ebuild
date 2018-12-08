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

DEPEND=">=dev-lang/rust
dev-util/cmake"
#libz"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	cargo install bat
}
