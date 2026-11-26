#!/bin/bash

tcpdump -i any -y LINUX_SLL port 443 -w get.pcap
