#!/bin/bash

#count each person in linux the hard disk usage ;


MAXDISKUSAGE=20000

for name in $(cut -d : -f1,3 /etc/passwd | awk -F : '$2>99{print $1}')
do
	/bin/echo $name
	#search all file owned by whom
	find / /usr /var /home -xdev -user $name  -type f -ls | \
	awk '{sum+=$7} END { print sum / (1024*1024) "Mbytes" } '

done |awk " { print \$0 } "
