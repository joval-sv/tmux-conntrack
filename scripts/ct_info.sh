#!/bin/bash
max=$(sysctl net.netfilter.nf_conntrack_max |awk '{print $NF}')
now=$(sysctl net.netfilter.nf_conntrack_count |awk '{print $NF}')
if [ ${#max} -eq 5 ]; then
  printf "%5d/%5d Conn" $now $max
elif [ ${#max} -eq 6 ]
  printf "%6d/%6d Conn" $now $max
elif [ ${#max} -eq 7 ]
  printf "%7d/%7d Conn" $now $max
else
  printf "%d/%d Conn" $now $max
fi
