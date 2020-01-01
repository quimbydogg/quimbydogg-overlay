# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# Pulled from main Gentoo tree 20191231 and switched back to py2 support for mopidy-spotify from this overlay

EAPI=5
PYTHON_COMPAT=(python{2_7,3_{5,6}})

inherit distutils-r1

DESCRIPTION="A Python implementation of the actor model"
HOMEPAGE="https://www.pykka.org/en/latest/ https://github.com/jodal/pykka"
SRC_URI="mirror://pypi/P/Pykka/Pykka-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="test? ( dev-python/nose[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

S=${WORKDIR}/Pykka-${PV}

python_test() {
	nosetests -v || die
}