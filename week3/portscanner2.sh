#!/bin/bash
# to run the file sudo portscanner2.sh 10.0.5 53

# set -e exits the code when any command fails
set -e

#echo -n "Enter the first 24 bits of the IP: "
#read p

#echo -n "Enter the port(s) (if more than 1 add a comma): "
#read port

# targets ip range specified after script
p=$1

# targets port(s) specified after script
port=$2

for i in {2..254}; do 
ip="${p}.${i}"
   for port in ${port}; do
   #echo "${ip},${port}" 
     #echo >/dev/tcp/$host/$port will try to open a TCP connection
     #&& echo will only print if previous is true
    timeout .1 bash -c "echo >/dev/tcp/${ip}/${port}" 2>/dev/null && echo "${ip} port ${port}"
   done
done
