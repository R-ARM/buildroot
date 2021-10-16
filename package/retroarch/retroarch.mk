################################################################################
#
# RetroArch, yoinked that package from https://gitlab.com/recalbox/recalbox/-/blob/master/package/retroarch/retroarch.mk
#
################################################################################

# Version 1.9.8
RETROARCH_VERSION = v1.9.8
RETROARCH_SITE = git://github.com/libretro/RetroArch.git
RETROARCH_SITE_METHOD = git
RETROARCH_LICENSE = GPLv3+
RETROARCH_CONF_OPTS += --disable-oss --enable-zlib
RETROARCH_DEPENDENCIES = host-pkgconf

RETROARCH_COMPILER_COMMONS_CFLAGS = $(COMPILER_COMMONS_CFLAGS_NOLTO)
RETROARCH_COMPILER_COMMONS_CXXFLAGS = $(COMPILER_COMMONS_CXXFLAGS_NOLTO)
RETROARCH_COMPILER_COMMONS_LDFLAGS = $(COMPILER_COMMONS_LDFLAGS_NOLTO)

#RETROARCH_CONF_OPTS += --disable-nvda --disable-video_filter --disable-winrawinput --disable-dsp_filter --disable-blissbox --disable-caca --enable-rgui --disable-materialui --enable-xmb --disable-ozone --disable-runahead --disable-dsound --disable-xaudio --disable-wasapi --disable-winmm --disable-ssl --enable-sdl2 --disable-libusb --disable-dbus --disable-systemd --enable-udev --enable-threads --enable-thread_storage --disable-ffmpeg --disable-mpv --enable-dylib --disable-networking --enable-opengl --disable-opengl1 --enable-opengl_core --enable-opengles --enable-opengles3 --disable-x11 --disable-kms --disable-plain_drm --enable-wayland --enable-egl --enable-dynamic_egl --disable-vg --disable-cg --enable-zlib --enable-alsa --disable-oss --disable-al --disable-jack --disable-pulse --enable-freetype --disable-xvideo --disable-flac --disable-dr_mp3 --disable-online_updater --disable-parport --disable-qt --enable-mmap --disable-imageviewer --disable-xshm --disable-cheevos --disable-discord --disable-accessibility --disable-translate --disable-vulkan --disable-hid --disable-videocore --disable-cdrom --disable-steam --disable-wifi

RETROARCH_CONF_OPTS += --prefix=/usr \
--disable-builtinflac \
--disable-builtinmbedtls \
--disable-builtinminiupnpc \
--disable-builtinzlib \
--disable-cg \
--disable-jack \
--disable-oss \
--disable-sdl \
--enable-sdl2 \
--disable-x11 \
--enable-wayland \
--disable-dbus \
--enable-opengles

define RETROARCH_CONFIGURE_CMDS
	(cd $(@D); rm -rf config.cache; \
		$(TARGET_CONFIGURE_ARGS) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) $(RETROARCH_COMPILER_COMMONS_CFLAGS)" \
		CXXFLAGS="$(TARGET_CXXFLAGS) $(RETROARCH_COMPILER_COMMONS_CXXFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS) $(RETROARCH_COMPILER_COMMONS_LDFLAGS) -lc" \
		CROSS_COMPILE="$(HOST_DIR)/bin/" \
		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig/" \
		./configure \
		--prefix=/usr \
		$(RETROARCH_CONF_OPTS) \
	)
endef

define RETROARCH_FIX_LIBS
	$(SED) "s|-\([IL]\)/usr|-\1$(STAGING_DIR)/usr|g" $(@D)/config.mk
endef

RETROARCH_POST_CONFIGURE_HOOKS += RETROARCH_FIX_LIBS

define RETROARCH_BUILD_CMDS
	$(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define RETROARCH_INSTALL_TARGET_CMDS
	$(MAKE) CXX="$(TARGET_CXX)" -C $(@D) DESTDIR=$(TARGET_DIR) install
endef

$(eval $(generic-package))

RETROARCH_LIBRETRO_PLATFORM += unix
RETROARCH_LIBRETRO_PLATFORM += armv8

RETROARCH_LIBRETRO_BOARD=$(RETROARCH_LIBRETRO_PLATFORM)
