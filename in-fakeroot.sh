#!/bin/sh
set -x
set -e
bsdtar xf output/images/rootfs.tar -C $RFS_PATH
mkdir -p $RFS_PATH/temp
chmod 700 $RFS_PATH/temp
echo '#!/bin/sh' > $RFS_PATH/etc/init.d/S20weston
echo 'export XDG_RUNTIME_DIR=/temp' >> $RFS_PATH/etc/init.d/S20weston
echo 'if [ "$1" = "start" ]; then' >> $RFS_PATH/etc/init.d/S20weston
echo 'weston --config=/root/.config/weston.ini --drm-device=card1 --seat=0 --continue-without-input --shell=kiosk-shell.so >/tmp/weston.log 2>&1 &' >> $RFS_PATH/etc/init.d/S20weston
echo 'echo $! > /tmp/weston_pid' >> $RFS_PATH/etc/init.d/S20weston
echo 'fi' >> $RFS_PATH/etc/init.d/S20weston
echo 'if [ "$1" = "stop" ]; then kill -9 $(cat /tmp/weston_pid); fi' >> $RFS_PATH/etc/init.d/S20weston
chmod a+x $RFS_PATH/etc/init.d/S20weston

mkdir -p $RFS_PATH/root/.config
echo '[core]
repaint-window=15
[output]
name=DSI-1
transform=rotate-90
[autolaunch]
path=/bin/rmenu' > $RFS_PATH/root/.config/weston.ini

cp retroarch.cfg $RFS_PATH/etc/retroarch.cfg

#cp ~/buildroot/output/build/rmenu-main/rmenu $RFS_PATHbin/rmenu
#chmod a+x $RFS_PATHbin/rmenu

cp output/build/linux-*/arch/arm64/boot/dts/rockchip/rk3326*dtb $RFS_PATH/boot/
cp -r menu $RFS_PATH/menu

[ -e $RFS_PATH/etc/init.d/S40xorg ] && rm $RFS_PATH/etc/init.d/S40xorg || true
