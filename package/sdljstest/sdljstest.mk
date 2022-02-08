################################################################################
#
# sdl-jstest
#
################################################################################


SDLJSTEST_VERSION = master
SDLJSTEST_SITE = $(call github,Grumbel,sdl-jstest,master)
SDLJSTEST_METHOD = git

SDLJSTEST_LICENSE = GPL-3.0+
SDLJSTEST_LICENSE_FILES = LICENSE.txt

SDLJSTEST_DEPENDENCIES = \
	sdl2

SDLJSTEST_CONF_OPTS = -DBUILD_SDL2_JSTEST=ON -DBUILD_SDL_JSTEST=OFF 

$(eval $(cmake-package))
