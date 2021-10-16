#!/bin/sh
set -v
mkdir -p ~/buildroot/output/target/temp
chmod 700 ~/buildroot/output/target/temp
echo '#!/bin/sh' > ~/buildroot/output/target/etc/init.d/S20weston
echo 'export XDG_RUNTIME_DIR=/temp' >> ~/buildroot/output/target/etc/init.d/S20weston
echo 'if [ "$1" = "start" ]; then' >> ~/buildroot/output/target/etc/init.d/S20weston
echo 'weston --config=/root/.config/weston.ini --drm-device=card1 --seat=0 --continue-without-input --shell=kiosk-shell.so >/tmp/weston.log 2>&1 &' >> ~/buildroot/output/target/etc/init.d/S20weston
echo 'echo $! > /tmp/weston_pid' >> ~/buildroot/output/target/etc/init.d/S20weston
echo 'fi' >> ~/buildroot/output/target/etc/init.d/S20weston
echo 'if [ "$1" = "stop" ]; then kill -9 $(cat /tmp/weston_pid); fi' >> ~/buildroot/output/target/etc/init.d/S20weston
chmod a+x ~/buildroot/output/target/etc/init.d/S20weston

mkdir -p ~/buildroot/output/target/root/.config
echo '[core]
repaint-window=15
[output]
name=DSI-1
transform=rotate-90
[autolaunch]
path=/bin/rmenu' > ~/buildroot/output/target/root/.config/weston.ini

cp ~/buildroot/retroarch.cfg ~/buildroot/output/target/etc/retroarch.cfg

#cp ~/buildroot/output/build/rmenu-main/rmenu ~/buildroot/output/target/bin/rmenu
#chmod a+x ~/buildroot/output/target/bin/rmenu

[ -e ~/buildroot/output/target/etc/init.d/S40xorg ] && rm ~/buildroot/output/target/etc/init.d/S40xorg || true
