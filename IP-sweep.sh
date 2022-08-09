#!/bin/bash
#file sweeps all Ip addresses under 172.20.240.xxx to see which are in use
x=$1
#clear text file before each sweep
echo "" > octets.txt

#start sweeping through IPs
for ip in {1..254}
do
    ping $x.$ip -c 1 | grep icmp | cut -d " " -f 4 | uniq | tr -d     ":" | cut -d "." -f 4 >> octets.txt &
done

sort -n octets.txt > IPlist.txt
sed -i -e "s/^/${x}./" IPlist.txt
sed -i '1d' IPlist.txt
echo ""
echo "The following IP addresses are in use:"
echo ""
cat IPlist.txt

exit 0

~            
