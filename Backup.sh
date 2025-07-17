#!/bin/bash
dat=`date +%Y_%m_%d_%H_%M`
cd /root/currentVersion/worlds/
tar -czvf /root/worldsBackup/worlds.$dat.tar.gz ./*
echo "Backup Process Complete at DAT=$dat" >> /root/Backup.log
yes | cp /root/worldsBackup/*.* /var/www/html/worldsBackuphttpd/
