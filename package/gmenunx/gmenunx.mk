#############################################################################
#
# gmenunx
#
#############################################################################

GMENUNX_VERSION = 31361423ecf6d611ea73c771bb1cd7dda8ef5019
GMENUNX_SITE = https://github.com/mac2612/gmenunx.git
GMENUNX_SITE_METHOD = git
GMENUNX_LICENSE = GPLv3
GMENUNX_LICENSE_FILES = COPYING
GMENUNX_DEPENDENCIES = sdl sdl_image sdl_ttf
GMENUNX_INSTALL_STAGING = NO

define GMENUNX_BUILD_CMDS
	CROSS_COMPILE="$(TARGET_CROSS)" $(MAKE) -C $(@D) -f Makefile.lf1000 zip
endef

define GMENUNX_INSTALL_TARGET_CMDS
mkdir -p $(TARGET_DIR)/usr/share/gmenunx/
$(UNZIP) -o $(@D)/dist/gmenunx-lf1000.zip -d $(TARGET_DIR)/usr/share/gmenunx
endef

$(eval $(generic-package))

