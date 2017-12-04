apt-get update && apt-get upgrade -y


echo "安裝防禦套件!!!!!!"

apt-get install denyhosts portsentry fail2ban

echo "開始安裝文件檔案portsentry"

cp portsentry.conf /etc/portsentry/portsentry.conf

echo "更換完成....."

echo "開始更換文件檔案denyhosts.conf"

cp denyhosts.conf /etc/denyhosts.conf

echo "done!"




echo "重啟服務loading...."

service denyhosts restart

service portsentry restart


echo "製作通知設定"

cp profile /etc/profile


#rm backup to home dir .deleted-files
current_file="$(pwd)/useful_shell/newrm"
cp $current_file /tmp/newrm


alias rm=/tmp/newrm


#log file touch
echo "***建立刪除檔案日誌***"
touch /var/log/remove.log

#log chmod
echo "更換權限...$"
chmod 752 /var/log/remove.log
chattr +a /var/log/remove.log

#tracking setuid 
echo -e "\e[5m ****Tracking setuid**** \e[25m"

source useful_shell/track_setuid.sh 2>/dev/null
