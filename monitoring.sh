#!/bin/bash

# colors definition
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
NC=$(tput sgr0) 

displaySystemInfo() {
    while true; do

        load_average=$(uptime | awk -F'load average:' '{print $2}')

        mem_free=$(free -m | awk 'NR==2 {print $4}')

        heure=$(date +"%T")

    echo "${GREEN}Time:${NC} $heure - ${RED}CPU Load:${NC} $load_average ${YELLOW}- Available Memory: ${NC}${mem_free} MB"

        sleep 0.5
    done
}
displaySystemInfo
