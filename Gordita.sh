#!/bin/sh
echo "GorditaRoot 1.0 by jcase / TeamAndIRC"
echo "for the VM670 Optimus V"
echo "March 21st 2012"
echo "Follow me! http://www.twitter.com/TeamAndIRC"
echo "Donations are optional http://forum.xda-developers.com/donatetome.php?u=2376614"
echo "-"
echo "Recovery taken from http://forum.xda-developers.com/showthread.php?t=1197991"
echo "-"
echo "Pushing recovery to /data/local/"
adb push VM670NH_recovery.img /data/local/recovery.img
echo "Removing old sensor config, setting up symlink attack"
adb shell "rm /data/amit/AMI304_Config.ini"
adb shell "ln -s /dev/block/mtdblock2 /data/amit/AMI304_Config.ini"
echo "Rebooting to execute symlink attack, to chmod 666 the recovery block device"
adb reboot
adb wait-for-device
sleep 10
adb shell "rm /data/amit/AMI304_Config.ini"
adb shell "dd if=/data/local/recovery.img of=/dev/block/mtdblock2"
echo "Recovery flashed! Enjoy"
