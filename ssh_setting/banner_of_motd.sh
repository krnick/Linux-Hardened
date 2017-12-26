#!/bin/bash
#define the filename to use as output
motd="/etc/motd"
# Collect useful information about your system
# $USER is automatically defined
HOSTNAME=`uname -n`
# The different colours as variables
W="\033[01;37m" # WHITE
B="\033[01;34m" # BLUE
G="\033[01;32m" # GREEN 
R="\033[01;31m" # RED
X="\033[00;37m" # Not sure...
RESET="\033[0m"
:> $motd # to clear the screen when showing up

echo -e "  $B Maintained by Nick  :sungboss2004@gmail.com                    " >> $motd
echo -e "                                                                    " >> $motd
echo -e "  _   _   _          _       _        _                             " >> $motd
echo -e " | \ | | (_)        | |     | |      (_)                            " >> $motd
echo -e " |  \| |  _    ___  | | __  | |       _   _ __    _   _  __  __     " >> $motd
echo -e " | . \` | | |  / __| | |/ /  | |      | | | '_ \  | | | | \ \/ /    " >> $motd
echo -e " | |\  | | | | (__  |   <   | |____  | | | | | | | |_| |  >  <      " >> $motd
echo -e " |_| \_| |_|  \___| |_|\_\  |______| |_| |_| |_|  \__,_| /_/\_\     " >> $motd
echo -e "                                                                    " >> $motd
echo -e "                                                                    " >> $motd
echo -e " $RESET                                                             " >> $motd
echo -e "#=============================================================================#" >> $motd
echo -e "       $W Welcome  $W to $B $HOSTNAME                    $RESET     " >> $motd
echo -e "#=============================================================================#" >> $motd
