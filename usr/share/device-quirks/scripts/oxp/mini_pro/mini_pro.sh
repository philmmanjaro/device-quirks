#!/bin/bash
if [ $(whoami) != 'root' ]; then
	echo "You must be root to run this script."
   exit 1
fi
 
# Force 16 bit audio, format S16LE, sample rate 96000.
cp -a /usr/share/wireplumber /etc/
sed -i 's/--\["audio.format"\]/\["audio.format"\]/' /etc/wireplumber/main.lua.d/50-alsa-config.lua
sed -i 's/--\["audio.rate"\]/\["audio.rate"\]/' /etc/wireplumber/main.lua.d/50-alsa-config.lua
sed -i 's/44100/96000/' /etc/wireplumber/main.lua.d/50-alsa-config.lua