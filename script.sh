#!/bin/bash

#bash to check ping and telnet status.

#set -x;

#

#clear

SetParam() {

export hostsfile="hosts2.txt"

}





Telnet_Status() {



SetParam



cat $hostsfile | while read next

do



server=`echo $next | cut -d , -f1`

port=`echo $next | awk -F"," '{print $2}'`



TELNETCOUNT=`sleep 2 | telnet $server $port | grep -v "Connection refused" | grep "Connected to" | grep -v grep | wc -l`



if [ $TELNETCOUNT -eq 1 ] ; then



echo -e "Port $port of URL http://$server:$port/ is \E[32m[ OPEN ]\E[0m";

else

echo "Error!"

exit

fi
done;
}
Main() {
Telnet_Status
}
SetParam
Main | tee -a
