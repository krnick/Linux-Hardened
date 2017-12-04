#!/bin/bash
#find suid program

#find -perm  4000 up is setuid

find / -type f  -perm /4000 -xdev  -print0 |while read -d '' -r match

do
	if [ -x "$match" ] ; then
	
	owner="$(ls -ld $match|awk '{print $3}')"
	perms="$(ls -ld $match|cut -c5-10|grep 'w')"

	if [ ! -z $perms ] ;then
		echo -e " \e[1m \e[101m*****$match is setuid owner is $owner\e[0m"
	fi
	fi
done


echo -e "\e[5m ****Tracking setgid**** \e[25m"

find / -type f  -perm /2000 -xdev  -print0 |while read -d '' -r match

do
        if [ -x "$match" ] ; then

        owner="$(ls -ld $match|awk '{print $3}')"
        perms="$(ls -ld $match|cut -c5-10|grep 'w')"

        if [ ! -z $perms ] ;then
                echo -e " \e[1m \e[101m*****$match is setgid owner is $owner\e[0m"
        fi
        fi
done



