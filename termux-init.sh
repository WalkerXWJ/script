#!/usr/bin/env bash
echo "********************将termux的源更换为国内源********************"
# 更换国内源
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
sed -i 's@^\(deb.*games stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable@' $PREFIX/etc/apt/sources.list.d/game.list
sed -i 's@^\(deb.*science stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable@' $PREFIX/etc/apt/sources.list.d/science.list
pkg update -y && pkg upragde -y
# 安装常用工具软件
echo '********************开始安装常用工具********************';
apt install vim git nmap wget curl htop -y

# 终端配色 脚本项目地址：https://github.com/Cabbagec/termux-ohmyzsh/
# 配色命令方案1 （github地址）： sh -c "$(curl -fsSL https://github.com/Cabbagec/termux-ohmyzsh/raw/master/install.sh)"
# 配色命令方案2 （国光私服地址）：sh -c "$(curl -fsSL https://html.sqlsec.com/termux-install.sh)"
#设置色彩样式：输入 chcolor 命令更换色彩样式，或者执行 ~/.termux/colors.sh 命令
#设置字体：运行 chfont 命令更换字体，或者执行 ~/.termux/fonts.sh 命令
# 问候语修改 vim $PREFIX/etc/motd
echo '********************安装一些github项目********************';
