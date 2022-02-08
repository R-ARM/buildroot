################################################################################
#
# supertuxkart
#
################################################################################

SUPERTUXKART_VERSION = 1.3
SUPERTUXKART_SOURCE = SuperTuxKart-$(SUPERTUXKART_VERSION)-src.tar.xz
SUPERTUXKART_SITE = http://github.com/supertuxkart/stk-code/releases/download/$(SUPERTUXKART_VERSION)

# Supertuxkart itself is GPL-3.0+, but it bundles a few libraries with different
# licenses. Irrlicht, bullet and angelscript have Zlib license, while glew is
# BSD-3-Clause. Since they are linked statically, the result is GPL-3.0+.
SUPERTUXKART_LICENSE = GPL-3.0+
SUPERTUXKART_LICENSE_FILES = COPYING

SUPERTUXKART_DEPENDENCIES = \
	host-pkgconf \
	freetype \
	openal \
	libogg \
	libvorbis

SUPERTUXKART_CONF_OPTS = -DUSE_SQLITE3=OFF \
			 -DUSE_GLES2=ON \
			 -DBUILD_RECORDER=OFF \
			 -DUSE_MOJOAL=OFF \
			 -DUSE_LIBBFD=OFF \
			 -DCHECK_ASSETS=OFF \
			 -DUSE_WIIUSE=OFF \
			 -DBUILD_SHARED_LIBS=ON

$(eval $(cmake-package))
