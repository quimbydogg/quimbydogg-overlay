# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
# This was just a copy of mrueg overlay ebuild with hard coded 3.1.0 SRC_URI (in Mrueg this is dated to 3.0.0)
# 3.1.0 mopidy-spotify includes oauth, necessary for SEARCH, 
# with 3.1.0-r1 switched to BlackLight fork to fix playlists

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit vcs-snapshot distutils-r1

DESCRIPTION="Mopidy extension for playing music from Spotify"
HOMEPAGE="https://github.com/BlackLight/mopidy-spotify"
SRC_URI="https://github.com/BlackLight/mopidy-spotify/archive/fix/incompatible_playlists.zip  -> ${P}-r1.zip"
S=${WORKDIR}/mopidy-spotify-fix-incompatible_playlists
RESTRICT="mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

#latest pykka in gentoo tree (1.2.1 requires building with python3_5 or 3_6 - not sure how to update RDEPEND for that so removed...)
RDEPEND=">=dev-python/pykka-1.1
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

