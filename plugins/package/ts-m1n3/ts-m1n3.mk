######################################
#
# TS-M1N3
#
######################################

TS_M1N3_VERSION = f3bb633a593b6fbb22a44c1ef9d1dbedbfe92d5b
TS_M1N3_SITE = https://github.com/GuitarML/TS-M1N3.git
TS_M1N3_SITE_METHOD = git
TS_M1N3_DEPENDENCIES = juce host-juce
# TODO make some jack2mod optional
TS_M1N3_DEPENDENCIES += jack2mod
TS_M1N3_CONF_ENV = MOD_TOOLCHAIN_FILE=$(BR2_EXTERNAL)/package/juce/toolchain.cmake
TS_M1N3_BUNDLES = TS_M1N3.lv2

# needed for submodules support
TS_M1N3_PRE_DOWNLOAD_HOOKS += MOD_PLUGIN_BUILDER_DOWNLOAD_WITH_SUBMODULES

define TS_M1N3_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/lv2/TS_M1N3.lv2
	cp -rL $($(PKG)_PKGDIR)/TS_M1N3.lv2/* $(TARGET_DIR)/usr/lib/lv2/TS_M1N3.lv2/
	cp -rL $(@D)/TS_M1N3/TS_M1N3_artefacts/Release/LV2/TS_M1N3.lv2/* $(TARGET_DIR)/usr/lib/lv2/TS_M1N3.lv2/
endef

$(eval $(cmake-package))
