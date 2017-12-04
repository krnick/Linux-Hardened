#!/bin/bash

process=$(  ps -aux|grep "sysdig -c spy_users" |grep -v grep |awk '{print $2}')

if [ -z $process ] ;then
	echo "not exist"
else
	echo "exist"
	echo "the pid is $process"

fi
