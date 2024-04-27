#!/bin/bash

RPC_URL="https://eth1.lava.build/lava-referer-b8014ee7-f6be-4619-86eb-293695f42eb4/"

OUTPUT_DIR="logs"

UA=$(shuf -n 1 ua.txt)

eth_data=$(curl -A UA -x http://premium.proxywing.com:12321 --proxy-user d9hv1twu6q:rzld6kr3mb -s -H "Content-type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_gasPrice","id":1}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$eth_data" >> "$OUTPUT_DIR/ethereum.txt"
    
    echo "Ethereum data fetched and saved to $OUTPUT_DIR/ethereum.txt."
else
    echo "Failed to fetch Ethereum data."
fi
