echo -e "\033[31m";
echo  "   _____                                _   _           ";
echo  "  / ____|                              (_) | |          ";
echo  " | (___     ___    ___   _   _   _ __   _  | |_   _   _ ";
echo  "  \___ \   / _ \  / __| | | | | | '__| | | | __| | | | |";
echo  "  ____) | |  __/ | (__  | |_| | | |    | | | |_  | |_| |";
echo  " |_____/   \___|  \___|  \__,_| |_|    |_|  \__|  \__, |";
echo  "                                                   __/ |";
echo  "                                                  |___/ ";
echo -e "\033[0m";


apt-get update && apt-get upgrade -y

echo "Install monitoring tools"
apt-get install sysdig
#sysdig -c spy_users "user.name=nick"
# sysdig -n "紀錄次數"  
#-w "寫入一個檔案" 
#-r "讀取寫入的檔案"
#-z 壓縮
#-s 4096 捕捉字節
#或可以直接透過 > 輸出 檔案較小
#sysdig -s 4096 -z -w /mnt/sysdig/$(hostname).scap.gz 

#open up cd auto spell
echo "shopt -s cdspell"


echo "Install a defensing tools"

apt-get install denyhosts portsentry fail2ban -y

echo "Replace the SSH service file"

source ssh_setting/banner_of_motd.sh
cp ssh_setting/sshd_banner /etc/ssh/sshd_banner
cp ssh_setting/sshd_config /etc/ssh/sshd_config
echo "restart ssh..."
/etc/init.d/ssh restart

echo "Start installing  portsentry"

cp portsentry.conf /etc/portsentry/portsentry.conf

cp denyhosts.conf /etc/denyhosts.conf

echo "Replacement  config file is complete....."

echo "done!"

echo "Restart service loading...."

service denyhosts restart

service portsentry restart


echo "Create notification settings"

cp profile /etc/profile

#rm backup to home dir .deleted-files
current_file="$(pwd)/useful_shell/newrm"
cp $current_file /tmp/newrm

alias rm=/tmp/newrm
alias ps=ps -aux

#log file touch
echo "***Create delete archive log***"
touch /var/log/remove.log

#log chmod
echo "Change permission..."
chmod 752 /var/log/remove.log
chattr +a /var/log/remove.log

#tracking setuid 
echo -e "\e[5m ****Tracking setuid**** \e[25m"

source useful_shell/track_setuid.sh 2>/dev/null


#track every user action
echo "start Sysdig Daemon!!"
process=$(  ps -aux|grep "sysdig -c spy_users" |grep -v grep |awk '{print $2}')

if [ -z $process ] ;then
        echo "not exist"
	setsid useful_shell/sysdig.sh
	echo "done"
else
        echo "exist"
        echo "the pid is $process"
fi






