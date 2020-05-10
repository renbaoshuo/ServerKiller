#!/bin/bash

# Coding: UTF-8
# Author: renbaoshuo
# Link:   www.baoshuo.ren
# Github: https://github.com/renbaoshuo/ServerKiller/
# Date:   2020/05/03

# 颜色定义
red='\e[91m'     # 红色
green='\e[92m'   # 绿色
yellow='\e[93m'  # 黄色
magenta='\e[95m' # 紫色
cyan='\e[96m'    # 蓝色
none='\e[0m'     # 白色

# 判断是否使用 root 用户运行
[[ $(id -u) != 0 ]] && echo -e " 哎呀……请使用 ${red}root ${none}用户运行 ${yellow}~(^_^) ${none}" && exit 1

# 获取系统版本
get_os_version() {
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        if [ -f /etc/redhat-release ]; then
            os_version="Redhat"
        elif [ -f /etc/SuSE-release ]; then
            os_version="Suse"
        elif [ -f /etc/arch-release ]; then
            os_version="Arch"
        elif [ -f /etc/mandrake-release ]; then
            os_version="Mandrake"
        elif [ -f /etc/debian_version ]; then
            os_version="Ubuntu/Debian"
        else
            os_version="Unknown"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        os_version="Darwin"
    elif [[ "$OSTYPE" == "freebsd"* ]]; then
        os_version="FreeBSD"
    else
        os_version="Unknown"
    fi
}
get_os_version

clear

if [ "${os_version}" == "Unknown" ]; then 
    echo -e "
这个 ${red}辣鸡脚本${none} 不支持你的系统。 ${yellow}(-_-) ${none}

即将退出..." && exit 1
fi 

# 程序入口
echo -e "
==========================================================
   ${red}服务器杀手 (Server Killer)${none} v1.0.0 for ${green}${os_version}${none} 
----------------------------------------------------------

* 功能介绍
    + 本脚本可根据系统自动执行对应命令
    + 多种跑路方式任你选择
* 信息
    + 开源地址：https://github.com/renbaoshuo/ServerKiller
    + 脚本下载: https://git.io/ServerKiller.sh
    + 如何使用: bash <(curl -s -L https://git.io/ServerKiller.sh)
* 声明
    + 请勿在${red}生产环境${none}运行此脚本！由此产生的一切后果由使用者
      承担，与脚本作者无关。继续运行表示同意此条款。
* 帮助
    + 本脚本内${red}所有${none}选择输入均${red}区分${none}大小写
==========================================================

${red}警告:    ${none} 这个脚本有可能会${red}损坏${none}你的服务器，是否继续运行？
${red}WARNING: ${none} This script may ${red}damage${none} your server. Do you want to continue?
"

# 获取指令
echo -e "${red}Do you want to continue?${none} (y/n): \c" && read go
if [ "$go" != 'y' ];then exit; fi

echo -e "脚本将在 ${green}10${none} 秒后执行 (可按 ${green}Ctrl-C${none} 退出执行)..."

sleep 10

clear

# 判断系统版本
if [ ["$os_version" == "Redhat"] || ["$os_version" == "CentOS"] ]; then
    echo -e "当前系统为 ${green}${os_version}${none} 发行版"
    echo -e "=============================================
${cyan}可执行命令列表: ${none}

1. ${green}rm -rf /*${none}
2. ${green}umount -a${none}
3. ${green}reboot on startup ${none}${magenta}(推荐)${none}
4. ${green}alias cd='a(){sudo rm -rf "\$1";}a'${none}

${none}请选择你要执行的命令 (${green}1-4${none}): \c" && read to_run_command;
    case $to_run_command in 
        1) echo -e "你选择的选项是 ${green}1${none} , ${red}你真的要执行吗?${none} (yes/no): \c" && read user_select
        if [ "$user_select" != "yes" ]; then echo "执行已被取消"; exit; 
        else sleep 5; sudo rm -rf /*; fi
        exit 0
        ;;
        2) echo -e "你选择的选项是 ${green}2${none} , ${red}你真的要执行吗?${none} (yes/no): \c" && read user_select
        if [ "$user_select" != "yes" ]; then echo "执行已被取消"; exit; 
        else sleep 5; sudo umount -a; fi
        exit 0
        ;;
        3) echo -e "你选择的选项是 ${green}3${none} , ${red}你真的要执行吗?${none} (yes/no): \c" && read user_select
        if [ "$user_select" != "yes" ]; then echo "执行已被取消"; exit; 
        else sleep 5; sudo echo "reboot" > /etc/rc.local && sudo chmod +x /etc/rc.local fi
        exit 0
        ;;
        4) echo -e "你选择的选项是 ${green}4${none} , ${red}你真的要执行吗?${none} (yes/no): \c" && read user_select
        if [ "$user_select" != "yes" ]; then echo "执行已被取消"; exit; 
        else sleep 5; sudo alias cd='a(){sudo rm -rf "$1";}a' fi
        exit 0
        ;;
        *) exit 0
        ;;
    esac
elif [ ["$os_version" == "Ubuntu/Debian" ] ]; then
    echo -e "当前系统为 ${green}${os_version}${none} 发行版"
    echo -e "=============================================
${cyan}可执行命令列表: ${none}

1. ${green}rm -rf /*${none}
2. ${green}umount -a${none}
3. ${green}alias cd='a(){sudo rm -rf "\$1";}a'${none}
=============================================

${none}请选择你要执行的命令 (${green}1-3${none}): \c" && read to_run_command;
    case $to_run_command in 
        1) echo -e "你选择的选项是 ${green}1${none} , ${red}你真的要执行吗?${none} (yes/no): \c" && read user_select
        if [ "$user_select" != "yes" ]; then echo "执行已被取消"; exit; 
        else sleep 5; sudo rm -rf /*; fi
        exit 0
        ;;
        2) echo -e "你选择的选项是 ${green}2${none} , ${red}你真的要执行吗?${none} (yes/no): \c" && read user_select
        if [ "$user_select" != "yes" ]; then echo "执行已被取消"; exit; 
        else sleep 5; sudo umount -a; fi
        exit 0
        ;;
        3) echo -e "你选择的选项是 ${green}4${none} , ${red}你真的要执行吗?${none} (yes/no): \c" && read user_select
        if [ "$user_select" != "yes" ]; then echo "执行已被取消"; exit; 
        else sleep 5; sudo alias cd='a(){sudo rm -rf "$1";}a' fi
        exit 0
        ;;
        *) exit 0
        ;;
    esac

else
	echo -e " 
	这个 ${red}辣鸡脚本${none} 不支持你的系统。 ${yellow}(-_-) ${none}

    即将退出...
	" && exit 1
fi




