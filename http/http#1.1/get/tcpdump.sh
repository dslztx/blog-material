#!/bin/bash

tcpdump -i any -y LINUX_SLL port 8080 -w get.pcap
