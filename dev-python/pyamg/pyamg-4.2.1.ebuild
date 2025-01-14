# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Algebraic multigrid solvers in Python"
HOMEPAGE="https://pyamg.org"
SRC_URI="
	https://github.com/pyamg/pyamg/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/pybind11[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	test? (
		dev-python/matplotlib[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

python_test() {
	cp -r -l -n pyamg "${BUILD_DIR}/lib" || die
	cd "${BUILD_DIR}/lib" || die
	epytest
}
