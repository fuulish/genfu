# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils git-r3 llvm

DESCRIPTION="Language server"
HOMEPAGE="https://github.com/cquery-project/cquery.git"

EGIT_REPO_URI="https://github.com/cquery-project/cquery"
EGIT_COMMIT="70c755b2e390d3edfb594a84a7531beb26b2bc07"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-devel/clang"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
			-DSYSTEM_CLANG=ON
			-DCMAKE_PREFIX_PATH="/usr/lib/llvm/9"
			-DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
			-DREPROC_INSTALL=ON
			)
	cmake-utils_src_configure
}
