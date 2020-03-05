#!/bin/bash

# 操作
action=$1

# 运行tcpdump
if [[ ${action} == "start" ]]; then
    echo "setup tcpdump"
    FILE=`adb shell ls /data/local/tmp | grep tcpdump | awk '{print $1}'`
    if [ -z "$FILE" ]; then
        DEVICE=`adb shell getprop ro.product.cpu.abi | awk '{print $1}'`
        echo $DEVICE
        if [[ ${DEVICE} == "arm64-"* ]]; then
            ABI=arm64
        elif [[ ${DEVICE} == "armeabi-"* ]]; then
            ABI=arm
        elif  [[ ${DEVICE} == "armeabi-"* ]]; then
            ABI=x86
        fi
        
        SERVER="tcpdump-$ABI"
        echo $SERVER
        echo "tcpdump  not found - Downloading"
        wget https://raw.githubusercontent.com/endlif/GitCode/master/tools/tcpdump/$SERVER
        echo "downloaded tcpdump"
        adb push $SERVER /data/local/tmp/tcpdump
        adb shell chmod 6755 /data/local/tmp/tcpdump
        echo "push tcpdump to Android"
    fi
    CHECKSTATUS=`adb shell ps | grep tcpdump | awk '{print $1}'`
    if [ -z "$CHECKSTATUS" ]; then
        echo "tcpdump not running - Starting"
        adb shell chmod 6755 /data/local/tmp/tcpdump
        adb shell 'su -c  "/data/local/tmp/tcpdump -i any -p -s 0 -w /sdcard/capture.pcap"'&
        #echo '------- FRiDA  Started running -------  '
    else
        echo "FRiDA is running - Started"
    fi
# 停止tcpdump
elif [[ ${action} == "stop" ]]; then
    CHECKSTATUS=`adb shell ps | grep tcpdump | awk '{print $1}'`
    if [ -z "$CHECKSTATUS" ]; then
        echo "tcpdump not running - "
    else
        echo "stop tcpdump"
        tcpdumpid=`adb shell ps | grep tcpdump | awk '{print $2}'`
        adb shell kill $tcpdumpid
        echo "start pull capture.pcap  "
        adb pull /sdcard/capture.pcap .
        tcpdumpid=`adb shell ps | grep tcpdump | awk '{print $1}'`
        if [ -z "$tcpdumpid" ]; then
            echo "tcpdump stop success - "
        fi
    fi
fi
        

