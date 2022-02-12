#!/bin/bash
max=$(sysctl net.netfilter.nf_conntrack_max |awk '{print $NF}')
now=$(sysctl net.netfilter.nf_conntrack_count |awk '{print $NF}')
echo -n "Conn: $now/$max"
