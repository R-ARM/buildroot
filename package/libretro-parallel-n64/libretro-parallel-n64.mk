################################################################################
#
# PARALLEL-N64
#
################################################################################

LIBRETRO_PARALLEL_N64_VERSION = HEAD
LIBRETRO_PARALLEL_N64_SITE = $(call github,libretro,parallel-n64,$(LIBRETRO_PARALLEL_N64_VERSION))
LIBRETRO_PARALLEL_N64_LICENSE = GPL-3.0

ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
LIBRETRO_PARALLEL_N64_DEPENDENCIES += libgles
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
LIBRETRO_PARALLEL_N64_DEPENDENCIES += libgl
endif


#$(SED) "s|-O2|-O3|g" $(@D)/Makefile

define LIBRETRO_PARALLEL_N64_BUILD_CMDS
	PLATCFLAGS="$(TARGET_CFLAGS)" CFLAGS="$(TARGET_CFLAGS)" \
		CXXFLAGS="$(TARGET_CXXFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		$(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC) -DARM_FIX" -C $(@D)/ -f Makefile \
		platform="unix" WITH_DYNAREC=aarch64 \
		CPUFLAGS="-march=armv8-a+crc+simd -mtune=cortex-a35 -mcpu=cortex-a35 -DARM64 -DCLASSIC" \
		HAVE_PARALLEL=1 HAVE_PARALLEL_RSP=1
endef

define LIBRETRO_PARALLEL_N64_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/parallel_n64_libretro.so \
		$(TARGET_DIR)/cores/parallel_n64_libretro.so
endef

$(eval $(generic-package))
