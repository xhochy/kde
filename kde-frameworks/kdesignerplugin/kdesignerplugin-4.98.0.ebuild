# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

FRAMEWORKS_TEST="false"
inherit kde-frameworks

DESCRIPTION="Framework providing plugins to use KDE frameworks widgets in QtDesigner"
LICENSE="LGPL-2.1+"
KEYWORDS=" ~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="designer webkit"

RDEPEND="
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	designer? (
		dev-qt/designer:5
		$(add_frameworks_dep kcompletion)
		$(add_frameworks_dep kconfigwidgets)
		$(add_frameworks_dep kiconthemes)
		$(add_frameworks_dep kio)
		$(add_frameworks_dep kitemviews)
		$(add_frameworks_dep kplotting)
		$(add_frameworks_dep ktextwidgets)
		$(add_frameworks_dep kwidgetsaddons)
		$(add_frameworks_dep kxmlgui)
		$(add_frameworks_dep sonnet)
	)
	webkit? (
		dev-qt/designer:5
		dev-qt/qtgui:5
		$(add_frameworks_dep kdewebkit)
	)
"
DEPEND="${RDEPEND}
	$(add_frameworks_dep kdoctools)
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package designer KF5IconThemes)
		$(cmake-utils_use_find_package designer KF5ItemViews)
		$(cmake-utils_use_find_package designer KF5KIO)
		$(cmake-utils_use_find_package designer KF5Plotting)
		$(cmake-utils_use_find_package designer KF5TextWidgets)
		$(cmake-utils_use_find_package designer KF5WidgetsAddons)
		$(cmake-utils_use_find_package webkit KF5WebKit)
	)

	kde-frameworks_src_configure
}