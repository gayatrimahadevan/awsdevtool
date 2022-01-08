#!/bin/bash
echo `date -u` ":Application Stop." >> /tmp/deploylog.txt
isExistApp=`pgrep java`
if [[ -n  $isExistApp ]]; then
    echo `date -u` ":Stopping Quote service." >> /tmp/deploylog.txt
    systemctl stop quote.service
fi
