# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_HANDBOOK="optional"
KDE_TEST="true"
inherit kde5

DESCRIPTION="KDE hexeditor"
HOMEPAGE="http://www.kde.org/applications/utilities/okteta
http://utils.kde.org/projects/okteta"
KEYWORDS=""
IUSE="crypt examples"

DEPEND="
	$(add_frameworks_dep kbookmarks)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdoctools)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	crypt? ( app-crypt/qca:2[qt5] )
	dev-qt/qtcore:5
	dev-qt/qtnetwork:5
	dev-qt/designer:5
	dev-qt/qtprintsupport:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	dev-qt/qtscript:5[scripttools]
"
RDEPEND="${DEPEND}
	!kde-base/okteta:4
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_enable examples OKTETA_BUILD_EXAMPLES)
		$(cmake-utils_use_build test TESTING)
		$(cmake-utils_use_find_package crypt QCA2)
		$(cmake-utils_use_find_package test Qt5Test)
	)

	kde5_src_configure
}
