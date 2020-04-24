#!/bin/sh
echo "Welcome to Deuces Flashing Script!"
echo "v5.0-Linux"
#to create a log, run: "script -c ./deuce-flash-all-v5.0.sh logfile.log"

echo "Checking if Fastboot binary is accessible.."


if [ -f "fastboot" ];
then
   echo "\033[32m fastboot binary exists in script directory.\033[0m"
   fb="./fastboot"
else
   echo "\033[33mfastboot binary does not exist in script directory\033[0m" >&2
   command -v fastboot | ( read fb; echo "\033[33mFound $fb. Will try to use this.\033[0m" )
   fb="fastboot"
fi


echo "Checking if Fastboot works correctly"
if $fb --version
then
    echo "\033[32m fastboot returned a version, continuing..\033[0m"
else
    echo "\033[31m fastboot not working correctly.\033[0m"
    exit 1
fi


echo "Checking if device is detected via Fastboot."
if [ -z $($fb devices -l) 2> /dev/null ]
    then
        echo "\033[31mDevice not detected in fastboot.\033[0m"
    exit 1
else
    echo "\033[32m Device detected!\033[0m"
fi


echo "Insuring unzip package is installed and accessible"
if unzip 1> /dev/null
then
    echo "\033[32m unzip detected!\033[0m"
else
    echo "\033[31m unzip is not installed, or is not working correctly!\033[0m"
    echo "\033[33mplease install via:\033[0m"
    echo "\033[33msudo apt install unzip\033[0m"
    echo "\033[33mor\033[0m"
    echo "\033[33msudo yum install unzip\033[0m"
    exit 1
fi


zipcount="$(ls *.zip 2>/dev/null | wc -l)"
if [ "${zipcount}" -eq 1 ]
    then
        zipname="$(ls *.zip)"
        echo ""
        echo "\033[32mImage to flash: ${zipname}\033[0m"
    elif [ "${zipcount}" -gt 1 ]
        then
            echo "\033[31m More than 1 zip!\033[0m"
            echo "\033[31mPlease have only 1 zip file in the script folder.\033[0m"
            zipnames="$(ls *.zip)"
            echo "\033[33m${zipnames}\033[0m"
            exit 1
    else
        echo "no zip files!"
        exit 1
fi




echo -n "Are you SURE you want to continue? (y/N) "
read answer1
if echo "$answer1" | grep -iq "^y" ;then
    echo "\033[33mThis Tool will reformat partitions in your device!\033[0m"
    echo "\033[33mIt will attempt to keep your user data!\033[0m"
    echo "\033[33mData could be lost! - Use At Your Own Risk!\033[0m"
    echo -n "Continue? (y/N) "
    read answer2
        if echo "$answer2" | grep -iq "^y" ;then
                echo "Checking if bootloader is unlocked."
                echo "Look at device to confirm if script is waiting..."
                $fb flashing unlock
                echo "There will be errors if already unlocked, ignore."
        else
            echo "Aborting..."
            exit 1
        fi
    else
        echo "Aborting..."
        exit 1
fi

echo "extracting the main image zip..."
unzip -j -o ${zipname} -d _work/
echo "setting active partition slot to A"
$fb --set-active=a
echo "flashing bootloader & radio..."
$fb flash bootloader _work/bootloader*.img
rm -rf _work/bootloader*.img
$fb reboot-bootloader
sleep 5
$fb flash radio _work/radio*.img
rm -rf _work/radio*.img
$fb reboot-bootloader
echo "extracting secondary image zip..."
zipname2="$(ls _work/*.zip)"
unzip -j -o ${zipname2} -d _work/

mkdir _work/_ 2>/dev/null
mv _work/*_other.img _work/_/ 2>/dev/null
echo "setting active partition slot to B"
$fb --set-active=b
bimgs="$(ls _work/_/*.img)"
for bimg in $bimgs
do
    part=$(ls _work/_/*_other.img | cut -d "_" -f3 | cut -d "/" -f2)
    echo $part
    $fb flash $part $bimg
    rm -rf $bimg
done
rm -rf _work/_
echo "setting active partition slot to A"
$fb --set-active=a
aimgs=$(ls _work/*.img)
for aimg in $aimgs
do
    part=$(echo $aimg | cut -d "/" -f2 | cut -d "." -f1)
    echo $part
    $fb flash $part $aimg
    rm -rf $aimg
done


echo -n "\033[33mDo you want to format user data? (y/N) \033[0m"
read answer3
if echo "$answer3" | grep -iq "^y" ;then
    echo "\033[33m!!!This will wipe all your data!!!\033[0m"
    echo -n "\033[31mAre you SURE? (y/N) \033[0m"
    read answer4
        if echo "$answer4" | grep -iq "^y" ;then
                echo "Formatting user data.."
                $fb format userdata 2>/dev/null
                $fb reboot-recovery 2>/dev/null
                echo "\033[32mDone!\033[0m"
        else
            echo "\033[36mSkipped formatting userdata.\033[0m"
            echo "\033[32mDone!\033[0m"
            exit
        fi
    else
        echo "\033[36mSkipped formatting userdata.\033[0m"
        echo "\033[32mDone!\033[0m"
        exit
fi
exit