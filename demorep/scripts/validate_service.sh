#!/bin/bash
echo `date -u` ":Validate Service Started." >> /tmp/deploylog.txt
echo "$PWD" >> /tmp/deploylog.txt
#mv "$PWD/target/firstapp-1.0.0-SNAPSHOT.jar" /home/ubuntu
echo `date -u` ":Starting Quote service." >> /tmp/deploylog.txt
systemctl start quote.service
sleep 10s
response=$(curl -s http://localhost:9090/firstapp/actuator/health)

if curl -I "http://localhost:9090/firstapp/actuator/health" 2>&1 | grep -w "200\|301" ; then
   echo "Application deployed successfully." >> /tmp/deploylog.txt
   echo `date -u` $response >> /tmp/deploylog.txt
else
   echo "Application deployment failed." >> /tmp/deploylog.txt
   echo `date -u` $response >> /tmp/deploylog.txt
   exit 1
fi