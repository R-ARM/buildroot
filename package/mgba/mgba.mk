################################################################################
#
# MGBA
#
################################################################################

# Version of 22/08/2021
#MGBA_VERSION = 5ba012e530b81aa27b237bf646b4e0e37e3dadf9
MGBA_VERSION = HEAD
MGBA_SITE = $(call github,libretro,mgba,$(MGBA_VERSION))
MGBA_LICENSE = MPL-2.0
MGBA_LICENSE_FILES = LICENSE

MGBA_CONF_OPTS += -DUSE_DEBUGGERS=OFF -DUSE_GDB_STUB=OFF -DUSE_FFMPEG=OFF -DUSE_ZLIB=OFF -DUSE_SQLITE3=OFF -DUSE_DISCORD_RPC=OFF -DBUILD_QT=OFF -DCMAKE_BUILD_TYPE=Release -DBUILD_GL=OFF -DBUILD_SDL=ON 

$(eval $(cmake-package))
