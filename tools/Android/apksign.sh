# AndroidResign
# Mac apk重签名脚本

# 创建一个名为resign.sh的脚本文件, 将如下脚本拷贝到其中. 按下面的解释即可对apk进行重新签名
# 中文为解释, 可以全部删除

#!/bin/bash
echo "setup resign"

# 按如下参数输入到终端: 确保有执行权限 chmod 777 resign.sh
# 导航到resign.sh脚本所在的目录, 一次输入如下参数
# tony$ ./resign.sh apk_source apk_dest keystore_path storepass keypass alias

# 源路径
apk_source=$1
# 目标路径
apk_dest=$2
# 私钥路径
keystore_path=$3
# 私钥密码
storepass=$4
# 别名密码
keypass=$5
# 别名
alias=$6

echo "Source path: ${apk_source} "
echo "Dest path: ${apk_dest} "

echo "Delete source META_INF"
# 删除之前的签名信息
zip -d $apk_source META-INF/\*

echo "Resign Start!"

echo "jarsigner -digestalg SHA1 -sigalg MD5withRSA -tsa http://timestamp.digicert.com -verbose -keystore ${keystore_path} -storepass ${storepass} -keypass ${keypass} -signedjar ${apk_dest} ${apk_source} ${alias}"

jarsigner -digestalg SHA1 -sigalg MD5withRSA -tsa http://timestamp.digicert.com -verbose -keystore $keystore_path -storepass $storepass -keypass $keypass -signedjar $apk_dest $apk_source $alias

echo "Resign Done!"
