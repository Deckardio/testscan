#!/bin/bash

IP_ADDRESS=$1
PORTS=$(seq 1 1000)

scan_port() {
    local ip=$1
    local port=$2
    timeout 1 bash -c "echo > /dev/tcp/$ip/$port" 2>/dev/null && echo "Port $port is open"
}

if [ -z "$IP_ADDRESS" ]; then
    echo "Usage: bash scan.sh [IP_ADDRESS]"
    exit 1
fi

for port in $PORTS; do
    scan_port $IP_ADDRESS $port
done
