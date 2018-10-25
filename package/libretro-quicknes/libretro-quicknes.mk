################################################################################
#
# QUICKNES
#
################################################################################
LIBRETRO_QUICKNES_VERSION = b9c48e6756dd73c42aa17110186525b0a7c619a9
LIBRETRO_QUICKNES_SITE = $(call github,libretro,QuickNES_Core,$(LIBRETRO_QUICKNES_VERSION))

LIBETRO_PLATFORM="Linux EMUPI 2.6.37.4-OpenLF #3 Tue Feb 16 22:14:28 PST 2016 armv7l GNU/Linux cortexa9"

define LIBRETRO_QUICKNES_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_PLATFORM)"
endef

define LIBRETRO_QUICKNES_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/quicknes_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/quicknes_libretro.so
endef

$(eval $(generic-package))