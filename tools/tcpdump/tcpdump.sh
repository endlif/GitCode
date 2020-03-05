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
    SERVER=tcpdump
    echo "tcpdumpnot found - Downloading"
    FRIDA=frida-server-$VERSION-android-$ABI
    wget https://github.com/frida/frida/releases/download/$VERSION/$FRIDA.xz
    xz -d $FRIDA.xz
    mv $FRIDA $SERVER
    adb push $SERVER /data/local/tmp/frida-server
    adb shell 'su -c chmod +x /data/local/tmp/tcpdump'
fi

CHECKSTATUS=$(frida-ps -U)
if [[ ${CHECKSTATUS} == *"Failed"* ]];then
	echo "FRiDA not running - Starting"
	adb shell 'su -c chmod +x /data/local/tmp/frida-server'
	adb shell 'su -c ./data/local/tmp/frida-server ' &
    #echo '-------'
else
    echo "FRiDA is running - Started"
fi
