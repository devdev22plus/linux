# upgrade nowmal
yum upgrade -y
yum update -y



# install iptables
yum install iptables-services
systemctl enable iptables
systemctl start iptables



# stop firewalld
systemctl disable firewalld
systemctl stop firewalld


#echo 1 > /proc/sys/net/ipv4/ip_forward
sysctl -w net.ipv4.ip_forward=1


# change ssh port here
# vi /etc/ssh/sshd_config

# help for this command https://stackoverflow.com/questions/525592/find-and-replace-inside-a-text-file-from-a-bash-command
# auto find and replace
sed -i -e 's/#Port 22/Port 42639/g' /etc/ssh/sshd_config



curl -k https://raw.githubusercontent.com/devdev22plus/linux/master/iptables_setup/iptables < iptables



iptables-restore < iptables
service iptables save


reboot now



