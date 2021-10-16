################################################################################
#
# MUPEN64PLUS-NX
#
################################################################################

#LIBRETRO_MUPEN64PLUS_NX_VERSION = 8fb474275aaca2e92e025c6a60af3e47cfdd185c
LIBRETRO_MUPEN64PLUS_NX_VERSION = HEAD
LIBRETRO_MUPEN64PLUS_NX_SITE = $(call github,libretro,mupen64plus-libretro-nx,$(LIBRETRO_MUPEN64PLUS_NX_VERSION))
LIBRETRO_MUPEN64PLUS_NX_LICENSE = GPLv3
LIBRETRO_MUPEN64PLUS_NX_DEPENDENCIES += host-nasm

ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
LIBRETRO_MUPEN64PLUS_NX_DEPENDENCIES += libegl
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
LIBRETRO_MUPEN64PLUS_NX_DEPENDENCIES += libgl
endif

LIBRETRO_MUPEN64PLUS_NX_PLATFORM=unix
LIBRETRO_MUPEN64PLUS_NX_SUPP_OPT=FORCE_GLES3=1 FORCE_GLES=0
LIBRETRO_MUPEN64PLUS_NX_DYNAREC=aarch64

define LIBRETRO_MUPEN64PLUS_NX_BUILD_CMDS
	$(SED) "s|-O2|-O3|g" $(@D)/Makefile
	CFLAGS="$(TARGET_CFLAGS) $(COMPILER_COMMONS_CFLAGS_SO)" \
		CXXFLAGS="$(TARGET_CXXFLAGS) $(COMPILER_COMMONS_CXXFLAGS_SO)" \
		CPPFLAGS="$(TARGET_CPPFLAGS) $(COMPILER_COMMONS_CPPFLAGS_SO)" \
		$(MAKE) NASM="$(HOST_DIR)/bin/nasm" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
		AR="$(TARGET_AR)" RANLIB="$(TARGET_RANLIB)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_MUPEN64PLUS_NX_PLATFORM)" $(LIBRETRO_MUPEN64PLUS_NX_SUPP_OPT) \
		WITH_DYNAREC=$(LIBRETRO_MUPEN64PLUS_NX_DYNAREC)
endef

define LIBRETRO_MUPEN64PLUS_NX_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/mupen64plus_next_libretro.so \
		$(TARGET_DIR)/cores/mupen64plus_next_libretro.so
#	mkdir -p $(TARGET_DIR)/recalbox/share_upgrade/bios/Mupen64plus/hires_texture
#	mkdir -p $(TARGET_DIR)/recalbox/share_upgrade/bios/Mupen64plus/cache
endef

$(eval $(generic-package))
