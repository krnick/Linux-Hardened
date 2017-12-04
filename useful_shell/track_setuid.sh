#!/bin/bash
#find suid program


mtime=7


#find -perm  4000 up is setuid

find / -type f  -perm /4000 -xdev  -print0 |while read -d '' -r match

do
	if [ -x "$match" ] ; then
	
	owner="$(ls -ld $match|awk '{print $3}')"
	perms="$(ls -ld $match|cut -c5-10|grep 'w')"

	if [ ! -z $perms ] ;then
		echo "*****$match is setuid owner is $owner"
	fi
	fi
done




