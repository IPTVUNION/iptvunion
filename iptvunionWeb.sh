#!/bin/bash
mv /home/iptvunion/www/controllers/config.php  /home/iptvunion/config.php 
sleep 1
rm -r /home/iptvunion/www/*
sleep 1
cd /home/iptvunion/www/
sleep 1
wget https://github.com/IPTVUNION/iptvunion/raw/master/web.tar.gz
sleep 1
tar -xvzf web.tar.gz
sleep 1
rm -r web.tar.gz
sleep 1
mv /home/iptvunion/config.php /home/iptvunion/www/controllers/config.php
exit 3
