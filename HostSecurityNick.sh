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
cp current_file /tmp/newrm
