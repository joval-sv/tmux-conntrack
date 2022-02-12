#!/bin/bash
max=$(sysctl net.netfilter.nf_conntrack_count |awk '{print $NF}')
echo -n "$max"
