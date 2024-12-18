#! /bin/bash

SYSTEM=`uname` # 用于显示操作系统名称
MY_DIR=`pwd` # 获取当前目录的绝对路径
PREFIX=${MY_DIR}/output # 输出目录，用于存放生成好的二进制文件

cpu_num=8 # 用于获取当前系统的cpu数量
if [ $SYSTEM = "Linux" ];then
    cpu_num=`grep 'processor' /proc/cpuinfo  | sort -u | wc -l`
fi

CLONE_GIT_COMMAND="git clone " # git clone

# 打印操作系统名称
echo "操作系统: $SYSTEM"
# 打印当前目录
echo "当前目录: $MY_DIR"
# 打印输出目录
echo "输出目录: $PREFIX"
# 打印 CPU 数量
echo "CPU 数量: $cpu_num"
# 打印 git clone 命令
echo "Git Clone 命令: $CLONE_GIT_COMMAND"
