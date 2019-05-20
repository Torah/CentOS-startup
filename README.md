# CentOS-startup

This is a pre-set script for CentOS server. Use it when a fresh CentOS setup, with terminal command "git clone https://github.com/Torah/CentOS-startup && cd CentOS-startup && bash CentOS.sh"

This script contains pre-installed docker, bt-panel, ntf-viewer, media player vlc (for jellyfin), SunLogin, Teamviewer, etc. 

With this script running, you can set up these other things for CentOS:
1.  /etc/ssh/sshd_config
PermitRootLogin yes
2.  /etc/gdm/custom.conf
[deamon]
AutomaticLoginEnable=True
AutomaticLogin=root#你想自动登陆的用户名
3.  gnome-terminal
ctrl+shift+T  /usr/bin/gnome-terminal

When finished, you should:
1) install software in bt-panel
2) set a serials of parameters for your downloaded docker images to container.
3) setup the aliyun docker accelerator(in mainland).
