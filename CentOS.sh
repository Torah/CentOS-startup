#!/bin/bash
# -*- enconding:utf-8 -*-

sudo yum update -y
sudo yum upgrade

yum install -y wget && wget -O install.sh http://download.bt.cn/install/install_6.0.sh && bash install.sh

# ע��gparted������չ����Ч������ʽΪext4����װCentOSʱѡ��
sudo yum install -y gparted

# ����İ�װ�������п�����CentOSʶ��NTF��ʽ����
wget http://ftp.tu-chemnitz.de/pub/linux/dag/redhat/el7/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
sudo yum install -y rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm

sudo yum install -y fuse-ntfs-3g
rm rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm

# ��װ��ý�岥����
yum update
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
sudo yum -y install vlc

# ��װNTFS����ʶ��
wget https://tuxera.com/opensource/ntfs-3g_ntfsprogs-2017.3.23.tgz
tar zxvf ntfs-3g_ntfsprogs-2017.3.23.tgz
cd ntfs-3g_ntfsprogs-2017.3.23
./configure
make
make install
mkdir /mnt/usb
# mount -t ntfs-3g /dev/sdb1 /mnt/usb
# mount -t ntfs-3g /dev/sdd2 /mnt/usb2
fdisk -l
cp /etc/fstab /etc/fstab.bak
# sudo nano /etc/fstab
# /dev/sda1 /mnt/windows ntfs-3g defaults 0 0

# ��װ���տ����ض�
wget http://download.oray.com/sunlogin/linux/SunloginClient9.6.1.tar.gz
tar -zxvf SunloginClient9.6.1.tar.gz
cd sunloginclient
./install.sh
cd ..
rm SunloginClient9.6.1.tar.gz

# ��װteamviewer
wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
sudo yum install -y teamviewer.x86_64.rpm
rm teamviewer.x86_64.rpm

# ���pip��װ�޷��滻�ϰ�������
pip install --upgrade pip
sudo pip install requests --ignore-installed requests
pip install docker

# ���������Ҫ�޸�dockerrepo
sudo yum remove docker docker-common docker-selinux docker-engine
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum list docker-ce --showduplicates | sort -r
sudo yum install -y docker-ce
sudo systemctl start docker
sudo systemctl enable docker

#docker pull jellyfin/jellyfin
docker pull linuxserver/plex
docker pull oldiy/my-calibre-webserver-docker
docker pull zexi/listen1:v1
docker pull docker.io/tianon/grafana:latest
docker pull gitlab/gitlab-ce:10.8.4-ce.0
docker pull kishitat/wordpress-all-in-one
docker pull mvertes/alpine-mongo:latest

# ��ȫ�İ汾��ȷ�ϰ汾��Ӧ�ı�ǩ������û�����İ汾��������ȥ�����ֿ��ҵ���������Լ�buildһ��
# https://hub.docker.com/r/sebp/elk
#docker pull sebp/elk:640
#docker pull sebp/elk:670
#docker pull sebp/elk:es500_l500_k500

# https://www.colabug.com/4201254.html
yum update -y
yum install gcc gcc-c++ -y
yum install python-pip python-devel python-distribute libxml2 libxml2-devel python-lxml libxslt libxslt-devel openssl openssl-devel -y
pip install --upgrade pip

yum install mariadb-server mariadb -y
systemctl start mariadb
mysqladmin -u root password "Password"
mysql -uroot -p

wget http://download.redis.io/redis-stable.tar.gz
tar -xzvf redis-stable.tar.gz
mv redis-stable /usr/local/redis
cd /usr/local/redis
make
make install
mkdir -p /etc/redis
cp /usr/local/redis/redis.conf /etc/redis/redis.conf
daemonize yes
/usr/local/bin/redis-server /etc/redis/redis.conf
pip install --upgrade chardet
easy_install mysql-connector==2.1.3
easy_install redis
pip install pyspider
mkdir /etc/pyspider


# ��װelasticsearch-head https://www.jianshu.com/p/e3f7bf6277f9
git clone git://github.com/mobz/elasticsearch-head.git
cd elasticsearch-head
yum install npm==10.8.4 # sudo yum install nodejs
npm install -g grunt-cli
npm install grunt --save
npm install
#�޸������ļ����޸� elasticsearch-head Ŀ¼�µ� Gruntfile.js �ļ����� options ���������� hostname������Ϊ 0.0.0.0��
grunt server

