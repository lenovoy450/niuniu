#!/bin/bash
echo "清理日志"
rm -rf /var/log/messages-*
rm -rf /var/log/messages.*
rm -rf /var/log/daemon.*
rm -rf /var/log/syslog.*
rm -rf /var/log/kern.*
echo "" > /var/log/daemon.log
echo "" > /var/log/kern.log
echo "" > /var/log/syslog
echo "" > /var/log/messages
echo "清理完成"
echo "写入定时任务"
crontab -l > conf
 echo '0 0 * * * echo "" > /var/log/daemon.log' >> conf
 echo '0 0 * * * echo "" > /var/log/kern.log' >> conf
 echo '0 0 * * * echo "" > /var/log/syslog' >> conf  
 echo '0 0 * * * echo "" > /var/log/message' >> conf
crontab conf
rm -rf conf
service cron restart
service crond restart
echo "定时任务写入完成"
