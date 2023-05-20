#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
total=0
up=0
down=0

while read url; do
    total=$((total+1))
    if curl --output /dev/null --silent --head --fail "$url"; then
        echo "${GREEN}$url is up${NC}"
        up=$((up+1))
    else
        echo "${RED}$url is down${NC}"
        down=$((down+1))
    fi
done < urls.txt

echo "Total Websites: $total"
echo "Total Websites Up: $up"
echo "Total Websites Down: $down"