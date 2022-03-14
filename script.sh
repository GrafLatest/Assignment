#!/bin/bash

#bash to check telnet status.


### Setting basic parameters ###

SetParam() {

export hostsfile="hosts2.txt"

}



#### Creating a function for telnet ####

Telnet_Status() {



SetParam


###--Reading the file--###

cat $hostsfile | while read next

do

###--Cutting before and after the ","--###

server=`echo $next | cut -d , -f1`

port=`echo $next | awk -F"," '{print $2}'`

###--Catching status with grep--###

TELNETCOUNT=`sleep 2 | telnet $server $port | grep -v "Connection refused" | grep "Connected to" | grep -v grep | wc -l`

###--Setting conditions--###

if [ $TELNETCOUNT -eq 1 ] ; then



echo -e "Port $port of URL http://$server:$port/ is \E[32m[ OPEN ]\E[0m";

else

echo "Error!"

exit

fi
done;
}
###--Running the main function--###
Main() {
Telnet_Status
}
SetParam
Main | tee -a
