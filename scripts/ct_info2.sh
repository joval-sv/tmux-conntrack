#!/bin/bash
max=$(sysctl net.netfilter.nf_conntrack_max |awk '{print $NF}')
now=$(sysctl net.netfilter.nf_conntrack_count |awk '{print $NF}')
if [ $now -eq 0 ]; then
  now=${1-1}
fi
# compute percent
per=$(bc <<< "scale=10; (100*$now)/$max")
printf "Usage: %6.1f%%" $per
