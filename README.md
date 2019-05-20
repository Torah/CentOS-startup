# CentOS-startup

This is a pre-set script for CentOS server. Use it when a fresh CentOS setup, with terminal command "git clone https://github.com/Torah/CentOS-startup && cd CentOS-startup && bash CentOS.sh"

This script contains pre-installed docker, bt-panel, ntf-viewer, media player vlc (for jellyfin), SunLogin, Teamviewer, etc. 

With this script running, you can set up these other things for CentOS:

	1. /etc/ssh/sshd_config
	PermitRootLogin yes
	/etc/init.d/sshd restart

	2. /etc/gdm/custom.conf
	[deamon]
	AutomaticLoginEnable=True
	AutomaticLogin=root#你想自动登陆的用户名

	3.  gnome-terminal
	ctrl+shift+T  /usr/bin/gnome-terminal
	终端的复制、黏贴：shift+ctrl+C\V

when SunLogin installing, you should input:

	your Oray account
	your account password
	set your access password

Meanwhile, you can browse the bt-panel access page id by command bt->14 and reset the login username and password by bt->6 & bt->5. Then you can install software in bt-panel.

When finished, you should:

	1) set a serials of parameters for your downloaded docker images to container.
	2) setup the aliyun docker accelerator(in mainland).

