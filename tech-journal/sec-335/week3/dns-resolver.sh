#!/bin/bash
# to run the file sudo dns-resolver.sh 10.0.5 10.0.5.22

#echo -n "Enter the first 24 bits of the IP: "
#read p

#echo -n "Enter a DNS server: "
#read dns

# First 24 bits of the ip
p=$1

# specific dns server
dns=$2

for i in {2..254}; do 
ip="${p}.${i}"
   timeout .1 bash -c nslookup="echo nslookup ${ip} ${dns}" | grep "5.0.10" | cut -d "*" -f 1 | grep -v '^[[:space:]]*$'
done
