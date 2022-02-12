#!/bin/bash
max=$(sysctl net.netfilter.nf_conntrack_max |awk '{print $NF}')
echo -n "$max"
