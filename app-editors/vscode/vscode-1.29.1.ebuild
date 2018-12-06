# Copyright 2018 Frank Uhlig (uhlig.frank@gmail.com)
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="VS CODE open source"
HOMEPAGE="https://code.visualstudio.com/"
SRC_URI="https://github.com/Microsoft/vscode/archive/1.29.1.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="sys-apps/yarn
net-libs/nodejs
app-crypt/libsecret
x11-libs/libxkbfile
x11-libs/libX11"
RDEPEND="${DEPEND}"
BDEPEND=""

PYTHON_COMPAT=( python2_7 )

# trying to rely on default src_prepare function and eapply
PATCHES=(
	"${FILESDIR}/product.patch"
	)

src_configure() {
	yarn || die
}

src_compile() {
	if [[ "$ARCH" == "amd64" ]]; then
		TARGET="linux-x64"
	elif [[ "$ARCH" == "x86" ]]; then
		TARGET="linux-ia32"
	elif [[ "$ARCH" == "arm" ]]; then
		TARGET="linux-arm"
	fi
	TARGET="${TARGET}-min"

	gulp vscode-${TARGET} || die
}

src_install() {
	#dodir /opt/${PN}
	insinto /opt/${PN}
	doins -r ${WORKDIR}/VSCode-linux-x64/*

	#exeinto /opt/${PN}
	#doexe ${WORKDIR}/code-oss

	#exeinto /opt/${PN}/bin
	#doexe ${WORKDIR}/bin/code-oss

	dosym "/opt/${PN}/bin/code-oss" "/usr/bin/code"

	fperms +x "/opt/${PN}/code-oss"
	fperms +x "/opt/${PN}/bin/code-oss"
	fperms +x "/opt/${PN}/libnode.so"
	fperms +x "/opt/${PN}/resources/app/node_modules.asar.unpacked/vscode-ripgrep/bin/rg"
	fperms +x "/opt/${PN}/resources/app/extensions/git/dist/askpass.sh"

}
