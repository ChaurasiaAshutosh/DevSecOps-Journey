#!/bin/bash

# Services to monitor
services=("ssh" "cron" "rsyslog")

# Create or overwrite the health report
echo "Service Health Report - $(date)" > /home/ubuntu/DevSecOps-Journey/logs/health_report.txt
echo "------------------------------------" >> /home/ubuntu/DevSecOps-Journey/logs/health_report.txt

# Loop through the services array and check status
for service in "${services[@]}"
do
    systemctl is-active --quiet $service
    if [ $? -eq 0 ]; then
        echo "$service: Running" >> /home/ubuntu/DevSecOps-Journey/logs/health_report.txt
    else
        echo "$service: NOT Running" >> /home/ubuntu/DevSecOps-Journey/logs/health_report.txt
    fi
done

