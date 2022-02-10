################################################################################
#
# mednafen
#
################################################################################

MEDNAFEN_VERSION = 1.29.0
MEDNAFEN_SOURCE = mednafen-$(MEDNAFEN_VERSION).tar.xz
MEDNAFEN_SITE = https://mednafen.github.io/releases/files
MEDNAFEN_LICENSE = TODO

MEDNAFEN_CONF_OPTS = --disable-apple2 --disable-lynx --disable-ngp --disable-pce --disable-pce-fast --disable-pcfx --enable-psx --disable-sms --disable-ss --disable-ssfplay --disable-vb --disable-wswan --enable-alsa --disable-jack

$(eval $(autotools-package))
