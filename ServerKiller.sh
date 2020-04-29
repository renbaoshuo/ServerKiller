#!/bin/bash

# 颜色定义
red='\e[91m'     # 红色
green='\e[92m'   # 绿色
yellow='\e[93m'  # 黄色
magenta='\e[95m' # 紫色
cyan='\e[96m'    # 蓝色
none='\e[0m'     # 白色

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
    + 开源地址：https://github.com/renbaoshuo/ServerKiller
* 声明
    + 请勿在${red}生产环境${none}运行此脚本！由此产生的一切后果由使用者
      承担，与脚本作者无关。继续运行表示同意此条款。
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
if [ ["$os_version" == "Redhat"] || ["$os_version" == "Redhat"] ]; then
    echo -e "当前系统为 ${green}${os_version}${none} 发行版"
    echo -e "=============================================
${cyan}可执行命令列表: ${none}

1. ${green}rm -rf /*${none}
2. ${green}umount -a${none}
3. ${green}reboot on startup ${none}${magenta}(推荐)${none}
4. ${green}alias cd='a(){sudo rm -rf \$1;}a'${none}

${none}请选择你要执行的命令 (${green}1-4${none}): \c" && read to_run_command;
    case $to_run_command in 
        1) echo "1" #sudo rm -rf /*
        ;;
        2) echo "2" #sudo umount -a
        ;;
        3) echo "3"
        echo -e "${red}你真的要执行吗?${none} (y/n): \c" && read user_select
        if [ "$user_select" != "y" ]; then echo "执行已被取消"; exit; 
        else  sudo echo "reboot" > /etc/rc.local && sudo chmod +x /etc/rc.local fi
        exit 0
        ;;
        4)
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




