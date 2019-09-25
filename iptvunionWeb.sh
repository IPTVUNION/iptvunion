#!/bin/bash
rm -r /home/iptvunion/*
sleep 1
wget https://sourceforge.net/projects/iptvunion/files/iptvunion.tar.gz -P /home/iptvunion 
(tar -zxvf /home/iptvunion/iptvunion.tar.gz -C /home/iptvunion/ > /dev/null 2>&1);
sleep 1
(rm -r  /home/iptvunion/iptvunion.tar.gz); 
sleep 1
(rm -r  /home/iptvunion/iptvunion.sql); 
(rm -r  /home/iptvunion/phpmyadmin.sql);
(rm -r  /home/iptvunion/www/info.php 2> /dev/null);
(rm -r  /home/iptvunion/iptvunion);
exit 3
