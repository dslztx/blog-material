#!/bin/bash

# 设置环境变量，密钥会写入该文件
export SSLKEYLOGFILE=/tmp/sslkey.log

# 正常发起请求，同时另开终端用 tcpdump 抓包
curl --http3-only https://quic.nginx.org/
