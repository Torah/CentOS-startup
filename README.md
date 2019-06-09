# CentOS-startup

This is a pre-set script for CentOS server. Use it when a fresh CentOS setup, with terminal command

	git clone https://github.com/Torah/CentOS-startup && cd CentOS-startup && bash CentOS.sh

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
	2) setup the aliyun docker accelerator(in China mainland).

And the most excellent part is that u can use the docker-plugin (now Version2 and for free) to setup any docker containers u want. And this is the part I researched and tried recent two months. Also, that is why I recommand to setup a CentOS for server|host of docker (docker plugin supports CentOS only in bt-panel). Really, this part is my originality, and therefore it took me two months long. Because it is lack of tutorial or materials right now for this part, and mostly because this plugin is for free, I warried that it begin to ask for money after I expose all usage of it. Personally, I think it is valuable for further improvement on parameters setting part. Obviously, the docker-manager in Synology is better on usage.

下面是几张我最近使用这个插件配置容器的配置项。如你在CentOS.sh部分所见，可以直接抓下这几个容器镜像。这几个容器还是挺有用的，最近两个月折腾它们还是有不少心得，正如开篇所说，需要查阅它们的许多资料，为什么要这样配置，每一项有什么用，我在搞定它们时遇到哪些有意思的现象和问题，如果要详细写下来，洋洋洒洒可以好几篇了。期间，我还给阿里云的容器部门写信问过问题和投诉他们的公共镜像太少（50个）。

![alt pyspider-docker setting](https://github.com/Torah/CentOS-startup/blob/master/20190508_IMG_0749.JPG "Pyspider")

这里仅举一例我发现的有意思现象和问题。我在第一次装机和试错配置如上过程时（因为公司新电脑不能拆开，最近频繁重装CentOS系统，泪），主要是想调试ELK环境。因为发现ELK版本实在太多（更新太快），网上的教程就失效了，导致ELK插件的安装等很缺资料。所以我打算通过docker来简易启动不同版本的ELK环境测试。这里面就有许多坑要我填。第一次装机时配置的环境，不知道什么原因，可以让ELK640等容器顺利启动，但是此后重装的系统就再也不能正常启用了，不能启用的原因是容器执行完命令就自然终止了。这在第一次系统时不是这样的，我反复检查了配置项，是一致的。后来怀疑过bt版本正好那几天更新到了6.9.4，是这个原因导致了差异，但求证时然而并没有。所以还剩一种可能，是第一次安装ELK时，可能安装了本地版本，有某些依赖项删除不干净，导致阴差阳错，实现了我最舒服的使用状态，但是现在回头刻意为之，却不能回去了。泪。那时的ELK不同版本里，我可以直接终端切进去看到它们不同版本下plugin安装命令和路径的演进，还能随意在里面安装不同版本的插件（ELK的插件严格遵从版本号，差评）。
该问题的解决思路与线索：
https://www.zhihu.com/question/38696466
https://www.jb51.net/article/155093.htm

第二个重要的问题是让ELK弃用的旧插件版本更新为新版本
解决思路：安装ELK插件开发环境
1、安装合适的nodejs版本（Node v8.11.4 (LTS)， Even v8.11.0 can work well）
https://nodejs.org/en/blog/release/v8.11.4/
https://nodejs.org/en/download/releases/
https://www.cnblogs.com/jasonlam/p/7930278.html
https://www.jianshu.com/p/f43d6408c6dd
https://github.com/nodesource/distributions
2、依赖包？libiconv
http://www.gnu.org/software/libiconv/#downloading
https://centos.pkgs.org/7/forensics-x86_64/libiconv-devel-1.15-1.el7.x86_64.rpm.html
https://pkgs.org/download/libiconv-devel
3、生成一个Kibana插件（不同ELK版本有对应的不同的plugin generator）
https://github.com/elastic/kibana/tree/master/packages/kbn-plugin-generator
https://kibana.gitbook.io/kibana-plugin-development-tutorial/chu-shi/kibanakai-fa-huan-jing-da-jian#di-san-bu
