#!/usr/bin/env bash
red='\033[0;31m'
bblue='\033[0;34m'
plain='\033[0m'
red(){ echo -e "\033[31m\033[01m$1\033[0m";}
green(){ echo -e "\033[32m\033[01m$1\033[0m";}
yellow(){ echo -e "\033[33m\033[01m$1\033[0m";}
blue(){ echo -e "\033[36m\033[01m$1\033[0m";}
white(){ echo -e "\033[37m\033[01m$1\033[0m";}
bblue(){ echo -e "\033[34m\033[01m$1\033[0m";}
rred(){ echo -e "\033[35m\033[01m$1\033[0m";}
readp(){ read -p "$(green "$1")" $2;}
[[ $EUID -ne 0 ]] && yellow "请以root模式运行脚本" && exit 1
if [[ -f /etc/redhat-release ]]; then
release="Centos"
elif cat /etc/issue | grep -q -E -i "debian"; then
release="Debian"
elif cat /etc/issue | grep -q -E -i "ubuntu"; then
release="Ubuntu"
elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
release="Centos"
elif cat /proc/version | grep -q -E -i "debian"; then
release="Debian"
elif cat /proc/version | grep -q -E -i "ubuntu"; then
release="Ubuntu"
elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
release="Centos"
else 
red "不支持你当前系统，请选择使用Ubuntu,Debian,Centos系统" && exit 1
fi

clear
green "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"           
echo -e "${bblue} ░██   ░██     ░██   ░██     ░██${plain}   ░██    ░██     ░██      ░██ ██ ${red}██${plain} "
echo -e "${bblue} ░██  ░██      ░██  ░██${plain}      ░██  ░██      ░██   ░██      ░██    ${red}░░██${plain} "            
echo -e "${bblue} ░██ ██        ░██${plain} ██        ░██ ██         ░██ ░██      ░${red}██        ${plain} "
echo -e "${bblue} ░██ ██       ${plain} ░██ ██        ░██ ██           ░██        ${red}░██    ░██ ██${plain} "
echo -e "${bblue} ░██ ░${plain}██       ░██ ░██       ░██ ░██          ░${red}██         ░██    ░░██${plain}"
echo -e "${bblue} ░${plain}██  ░░██     ░██  ░░██     ░██  ░░${red}██        ░██          ░██ ██ ██${plain} "
green "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 
white "甬哥Gitlab项目  ：gitlab.com/rwkgyg"
white "甬哥blogger博客 ：ygkkk.blogspot.com"
white "甬哥YouTube频道 ：www.youtube.com/c/甬哥侃侃侃kkkyg"
yellow "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 

[[ $(type -P yum) ]] && yumapt='yum -y' || yumapt='apt -y'
[[ $(type -P wget) ]] || (yellow "检测到wget未安装，升级安装中" && $yumapt update;$yumapt install wget)
[[ $(type -P curl) ]] || (yellow "检测到curl未安装，升级安装中" && $yumapt update;$yumapt install curl)
[[ $(type -P screen) ]] || (yellow "检测到screen未安装，升级安装中" && $yumapt install screen)	
att(){
if [[ -n $(screen -ls | grep '(Attached)' | awk '{print $1}' | awk -F "." '{print $1}') ]]; then
until [[ -z $(screen -ls | grep '(Attached)' | awk '{print $1}' | awk -F "." '{print $1}' | awk 'NR==1{print}') ]] 
do
Attached=`screen -ls | grep '(Attached)' | awk '{print $1}' | awk -F "." '{print $1}' | awk 'NR==1{print}'`
screen -d $Attached
done
fi
}

ab="1.创建screen窗口程序名称\n2.查看并进入指定screen窗口\n3.查看并删除指定screen窗口\n4.清除所有screen窗口\n0.退出\n 请选择："
readp "$ab" cd
case "$cd" in 
1 )
readp "为方便管理，设置screen窗口程序名称：" screen
screen -US $screen
;;

2 )
att
names=`screen -ls | grep '(Detached)' | awk '{print $1}' | awk -F "." '{print $2}'`
[[ -n $names ]] && green "$names" && readp "输入进入的screen窗口程序名称：" screename && screen -Ur $screename || red "无执行内容"
;;

3 )
att
names=`screen -ls | grep '(Detached)' | awk '{print $1}' | awk -F "." '{print $2}'`
[[ -n $names ]] && green "$names" && readp "输入删除的screen窗口程序名称：" screename && screen -S $screename -X quit || red "无执行内容"
;;

4 )
att
names=`screen -ls | grep '(Detached)' | awk '{print $1}' | awk -F "." '{print $2}'`
screen -wipe
[[ -n $names ]] && screen -ls | grep '(Detached)' | cut -d. -f1 | awk '{print $1}' | xargs kill && green "所有screen窗口清除完毕"|| red "无执行内容，无须清除"
;;
* ) rm -rf screen.sh && exit
esac
