#!/bin/bash
wsl=$(uname -r |egrep -c "WSL")
max=$(sysctl net.netfilter.nf_conntrack_max |awk '{print $NF}')
if [ $wsl -gt 0 ]; then
  now=$(netstat -pan |egrep -c "^(tcp|udp)")
else
  now=$(sysctl net.netfilter.nf_conntrack_count |awk '{print $NF}')
fi
if [ ${#max} -eq 5 ]; then
  printf "%5d/%5d Conn" $now $max
elif [ ${#max} -eq 6 ]; then
  printf "%6d/%6d Conn" $now $max
elif [ ${#max} -eq 7 ]; then
  printf "%7d/%7d Conn" $now $max
else
  printf "%d/%d Conn" $now $max
fi
