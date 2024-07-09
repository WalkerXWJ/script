#!/usr/bin/env bash
echo "******************** 将termux的源更换为国内源 ********************"
# 更换国内源
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
sed -i 's@^\(deb.*games stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable@' $PREFIX/etc/apt/sources.list.d/game.list
sed -i 's@^\(deb.*science stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable@' $PREFIX/etc/apt/sources.list.d/science.list
pkg update -y && pkg upragde -y
# 安装常用工具软件
echo '******************** 开始安装常用工具 ********************';
pkg install vim -y
pkg install vim-python -y
pkg install git -y
pkg install nmap -y
pkg install wget -y
pkg install curl -y
pkg install htop -y
pkg install python-pip -y
# 解决vim汉字乱码
echo "******************** 新建 ~/.vimrc 文件 增加配置 解决vim乱码问题 ********************"
sleep 3s
rm ~/.vimrc
touch ~/.vimrc
echo "set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1" >> ~/.vimrc
echo "set enc=utf8" >> ~/.vimrc
echo "set fencs=utf8,gbk,gb2312,gb18030" >> ~/.vimrc
echo "******************** 设置vim 语法高亮和行号显示 ********************"
echo "set nu" >> ~/.vimrc
echo "colorscheme desert"   >> ~/.vimrc
echo "syntax on"       >> ~/.vimrc
source ~/.vimrc

# 终端配色 脚本项目地址：https://github.com/Cabbagec/termux-ohmyzsh/
# 配色命令方案1 （github地址）： sh -c "$(curl -fsSL https://github.com/Cabbagec/termux-ohmyzsh/raw/master/install.sh)"
# 配色命令方案2 （国光私服地址）：sh -c "$(curl -fsSL https://html.sqlsec.com/termux-install.sh)"
#设置色彩样式：输入 chcolor 命令更换色彩样式，或者执行 ~/.termux/colors.sh 命令
#设置字体：运行 chfont 命令更换字体，或者执行 ~/.termux/fonts.sh 命令
# 问候语修改 vim $PREFIX/etc/motd
function myEcho(parameter) {
  #固定样式文本输出
  param = $1
  echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo "---------------  $param  ---------------"
  echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
}
myEcho "安装 MariaDB（mysql）"
myEcho "MariaDB 是 MySQL 关系数据库管理系统的一个复刻，由社区开发，有商业支持，旨在继续保持在 GNU GPL 下开源。开发这个分支的原因之一是：甲骨文公司收购了 MySQL 后，有将 MySQL 闭源的潜在风险，因此社区采用分支的方式来避开这个风险"
cd /data/data/com.termux/files/usr/etc/
mkdir my.cnf.d
cd ~
pkg install mariadb
mysql --version
mysql_install_db
myEcho "可使用 nohup mysqld & 将命令放在后台启动"
sleep 3s
nohup mysqld &
ps aux|grep mysql
myEcho "登陆Termux 的用户名，默认密码为空"
sleep 3s
mysql -u $(whoami) && quit
myEcho "mariadb 修改root用户密码"
mysql -u $(whoami) && use mysql; && set password for 'root'@'localhost' = password('toor8899toor');&& flush privileges;&& quit;
myEcho "root 密码 toor8899toor"
myEcho "使用 ： mysql -u root -p 命令来登陆root"


echo '******************** 安装一些github项目 ********************';
