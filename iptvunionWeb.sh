#!/bin/bash
sleep 4
read -p "Please enter a password for your MySQL : " mysqlpassword
(mysql -uroot -p$mysqlpassword -e "CREATE DATABASE iptvunion"  2> /dev/null);
(mysql -uroot -p$mysqlpassword -e "CREATE DATABASE phpmyadmin"  2> /dev/null);
echo -n "1. [password for your MySQL:] "
echo -n " [############"
RESULT=`mysqlshow --user=root --password=$mysqlpassword mysql | grep -v Wildcard | grep -o mysql `
if [ "$RESULT" == "mysql" ]; then 
echo -e "]$(tput setaf 2)Successful$(tput sgr0)"
sleep 1
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
sleep 1
sed -i 's/xxx/'$mysqlpassword'/g' /home/iptvunion/www/controllers/config.php 
sleep 1
else
echo -e "]$(tput setaf 1)The Password is incorrect$(tput sgr0)"
sleep 5
./iptvunionWeb.sh
fi
exit 3
