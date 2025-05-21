#!/bin/bash

echo "System Resource Report - $(date)" > ~/DevSecOps-Journey/logs/sys_report.txt
echo "------------------------------------" >> ~/DevSecOps-Journey/logs/sys_report.txt
echo "CPU Load:" >> ~/DevSecOps-Journey/logs/sys_report.txt
uptime >> ~/DevSecOps-Journey/logs/sys_report.txt
echo "" >> ~/DevSecOps-Journey/logs/sys_report.txt
echo "Memory Usage:" >> ~/DevSecOps-Journey/logs/sys_report.txt
free -h >> ~/DevSecOps-Journey/logs/sys_report.txt
echo "" >> ~/DevSecOps-Journey/logs/sys_report.txt
echo "Top 5 Memory-Consuming Processes:" >> ~/DevSecOps-Journey/logs/sys_report.txt
ps aux --sort=-%mem | head -n 6 >> ~/DevSecOps-Journey/logs/sys_report.txt
