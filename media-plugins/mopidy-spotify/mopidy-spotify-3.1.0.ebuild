# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
# This is literally just a copy of mrueg overlay ebuild with hard coded 3.1.0 SRC_URI (in Mrueg this is dated to 3.0.0)
# 3.1.0 mopidy-spotify includes oauth, necessary for SEARCH

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit vcs-snapshot distutils-r1

DESCRIPTION="Mopidy extension for playing music from Spotify"
HOMEPAGE="http://mopidy.com https://github.com/mopidy/mopidy-spotify"
SRC_URI="https://github.com/mopidy/mopidy-spotify/archive/v3.1.0.tar.gz  -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND=">=dev-python/pykka-1.1[${PYTHON_USEDEP}]
	>=dev-python/pyspotify-2.0.5[${PYTHON_USEDEP}]
	>=media-sound/mopidy-2.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]"

DEPEND="test? ( ${RDEPEND}
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-capturelog[${PYTHON_USEDEP}]
	dev-python/responses[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS=( README.rst )

python_test() {
	py.test || die
}
