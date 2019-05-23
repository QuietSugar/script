#!/bin/bash

# scp工具

# 以下是参数
# 远程用户名
USERNAME=$1
# 密码
PASSWD=$2
# 远程IP
HOSTIP=$3
# 源文件
SRC_FILE=$4
# 目标文件
DST_FILE=$5
# 复制类别
# TYPE:0-- 从远程复制到本地; other-- 从本地复制到远程,(默认)
TYPE=$6

if [ -z ${USERNAME} ] || [ -z ${PASSWD} ] || [ -z ${HOSTIP} ] || [ -z ${SRC_FILE} ] || [ -z ${DST_FILE} ] ; then
    echo "前五个参数不能为空!"
    exit 1
fi

if  [ ${TYPE} == 0 ]; then
    # ${SRC_FILE} 一定要是绝对路径
    CMD_PARA="${USERNAME}@${HOSTIP}:${SRC_FILE} ${DST_FILE}"
else
    #  ${DST_FILE} 一定要是绝对路径
    CMD_PARA="${SRC_FILE} ${USERNAME}@${HOSTIP}:${DST_FILE}"
fi

expect -c "
        spawn scp -r ${CMD_PARA}
            expect {
                "*yes/noyes/no?" {send "yes\\r"; exp_continue }
                "*password:" { send "${PASSWD}\\r" }
        }
        expect eof
"
