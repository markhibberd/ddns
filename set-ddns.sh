#!/bin/sh

keyfile='Krazor.mth.io.+157+19224.private'
nameserver='mth.io.'
host='razor.mth.io'
ttl=10
ip=`ifconfig tun0 | grep inet | tail -n 1 | cut -c 7- | awk '{print $1}'`

echo "ip determined to be $ip"

/usr/bin/nsupdate -k $keyfile <<EOF
server $nameserver
update delete $host A
update add $host $ttl A $ip
show
send
EOF

