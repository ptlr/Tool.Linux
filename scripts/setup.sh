#!/bin/bash
# 作者：普通路人
del_package=(libreoffice-common sgt-launcher  sgt-puzzles gnome-mines gnome-sudoku xfburn pidgin transmission-common thunderbird)
install_package=(git gcc g++ tree nasm flameshot)

# 软件管理函数
# 使用：<操作命令：install/purge> <包数组>
manger(){
    cmd=$1
    package_arr=$2
    for package in "${package_arr[@]}"
    do
        sudo apt $cmd $package -y
    done
}
main(){
    # 删除无用的软件
    echo "1、卸载不需要的软件："
    manger purge "${del_package[*]}"
    # 安装需要的软件
    @echo "2、安装常用软件："
    manger install "${install_package[*]}"
    # 清除无用软件和升级
    echo "3、清除和升级："
    sudo apt autoremove -y
    sudo apt autoclean
    sudo apt update
    sudo apt upgrade -y
}

main

