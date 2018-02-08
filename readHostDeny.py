#block all ip from hosts.deny via python
import re
import os

file_of_hostsdeny = open("/etc/hosts.deny")

##os.system("iptables -A INPUT -s IP_ADDRESS -j DROP")


string_of_command = ""
for index,ip in enumerate(file_of_hostsdeny):
	ip = re.sub('[^\d.]',"",ip)
	command = "iptables -A INPUT -s  " + ip +"  -j DROP;"
	string_of_command+= command

os.system(string_of_command)

file_of_hostsdeny.close()
