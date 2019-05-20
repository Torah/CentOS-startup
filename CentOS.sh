#!/bin/bash

sudo yum -y update
sudo yum upgrade

yum install -y wget && wget -O install.sh http://download.bt.cn/install/install_6.0.sh && bash install.sh


# ����İ�װ�������п�����CentOSʶ��NTF��ʽ����
wget http://ftp.tu-chemnitz.de/pub/linux/dag/redhat/el7/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
sudo yum install -y rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
sudo yum install -y fuse-ntfs-3g


# ��װ��ý�岥����
yum update
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
sudo yum -y install vlc


# ��װ���տ����ض�
wget http://download.oray.com/sunlogin/linux/SunloginClient9.6.1.tar.gz
tar -zxvf SunloginClient9.6.1.tar.gz
cd sunloginclient
./install.sh

# ��װteamviewer
wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
sudo yum install -y teamviewer.x86_64.rpm

# ���pip��װ�޷��滻�ϰ�������
pip install --upgrade pip
sudo pip install requests --ignore-installed requests
pip install docker

sudo yum remove docker docker-common docker-selinux docker-engine
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce
sudo systemctl start docker
sudo systemctl enable docker

docker pull jellyfin/jellyfin
docker pull oldiy/my-calibre-webserver-docker
docker pull zexi/listen1:v1
docker pull docker.io/tianon/grafana:latest
docker pull gitlab/gitlab-ce:10.8.0-ce.0
docker pull kishitat/wordpress-all-in-one
docker pull mvertes/alpine-mongo:latest
docker pull sebp/elk:640
docker pull sebp/elk:670
