#!/bin/bash

show_menu(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "Parrot Distribution on WSL"
    echo -e "Idea by The4rchangel's"
    echo -e "Revision 1.0 - 2020-01-13"
	echo -e "Recompile by prodject - 2020-04-02"
    echo -e "Known Issues: Some packages have a hash mismatch. Identifying fix."
    echo -e "${MENU}**${NUMBER} 1)${MENU} Install Core Only ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} Install Headless Edition ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} Install Standard Edition ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4)${MENU} Install Full Edition ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5)${MENU} Install Home Edition ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 6)${MENU} Install Embedded Edition ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}

function select_mirror(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MIRROR}*********************************************${NORM}"
    echo -e "Select Mirror:"
    echo -e "${MIRROR}**${NUM} 1)${MIRROR} DON'T USE MIRROR ${NORM}"
    echo -e "${MIRROR}**${NUM} 2)${MIRROR} New York ${NORM}"
    echo -e "${MIRROR}**${NUM} 3)${MIRROR} California ${NORM}"
    echo -e "${MIRROR}**${NUM} 4)${MIRROR} Italy ${NORM}"
    echo -e "${MIRROR}**${NUM} 5)${MIRROR} Netherlands ${NORM}"
    echo -e "${MIRROR}**${NUM} 6)${MIRROR} Sweden ${NORM}"
    echo -e "${MIRROR}**${NUM} 7)${MIRROR} Belgium ${NORM}"
	echo -e "${MIRROR}**${NUM} 8)${MIRROR} France ${NORM}"
	echo -e "${MIRROR}**${NUM} 9)${MIRROR} Russia ${NORM}"
	echo -e "${MIRROR}**${NUM} 10)${MIRROR} Ukraine ${NORM}"
	echo -e "${MIRROR}**${NUM} 11)${MIRROR} Taiwan ${NORM}"
	echo -e "${MIRROR}**${NUM} 12)${MIRROR} Singapore ${NORM}"
	echo -e "${MIRROR}**${NUM} 13)${MIRROR} China ${NORM}"
    echo -e "${MIRROR}*********************************************${NORM}"
    echo -e "${ENTER_LINE}Please enter a MIRROR option and enter or ${RED_TEXT}enter to exit. ${NORM}"
    read mrf
        case $mrf in
        1) clear;
		MIRROR="";
		return;
        ;;
        2) clear;
		MIRROR="deb https://mirror.clarkson.edu/parrot/ rolling main contrib non-free";
		return;
        ;;
        3) clear;
		MIRROR="deb https://mirror.sfo12.us.leaseweb.net/parrot rolling main contrib non-free";
		return;
        ;;
        4) clear;
		MIRROR="deb https://parrot.mirror.garr.it/mirrors/parrot/ rolling main contrib non-free";
		return;
        ;;
		5) clear;
		MIRROR="deb https://ftp.nluug.nl/os/Linux/distr/parrot/ rolling main contrib non-free";
		return;
		;;
		6) clear;
		MIRROR="deb https://ftp.acc.umu.se/mirror/parrotsec.org/parrot/ rolling main contrib non-free";
		return;
        ;;
		7) clear;
		MIRROR="deb http://ftp.belnet.be/mirror/archive.parrotsec.org/ rolling main contrib non-free";
		return;
        ;;
		8) clear;
		MIRROR="deb https://parrot.mirror.cythin.com/parrot rolling main contrib non-free";
		return;
        ;;
		9) clear;
		MIRROR="deb https://mirror.yandex.ru/mirrors/parrot/ rolling main contrib non-free";
		return;
        ;;
		10) clear;
		MIRROR="deb https://parrotsec.volia.net/ rolling main contrib non-free";
		return;
        ;;
		11) clear;
		MIRROR="deb http://free.nchc.org.tw/parrot/ rolling main contrib non-free";
		return;
        ;;
		12) clear;
		MIRROR="deb https://mirror.0x.sg/parrot/ rolling main contrib non-free";
		return;
        ;;
		13) clear;
		MIRROR="deb https://mirrors.tuna.tsinghua.edu.cn/parrot/ rolling main contrib non-free";
		return;
        ;;
	esac
}

function option_picked() {
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE=${@:-"${RESET}Error: No message passed"}
    echo -e "${COLOR}${MESSAGE}${RESET}"
}


function core_install() {
	echo -e "# Parrot repository WSL" > /etc/apt/sources.list.d/parrot.list
  echo "# Updated by @nonymous_prodject" >> /etc/apt/sources.list.d/parrot.list
  echo "deb https://deb.parrotlinux.org/parrot/ rolling main contrib non-free" >> /etc/apt/sources.list.d/parrot.list
  echo "#deb-src https://deb.parrotlinux.org/parrot/ rolling main contrib non-free" >> /etc/apt/sources.list.d/parrot.list
  echo "deb https://deb.parrotlinux.org/parrot/ rolling-security main contrib non-free" >> /etc/apt/sources.list.d/parrot.list
  echo "#deb-src https://deb.parrotlinux.org/parrot/ rolling-security main contrib non-free" >> /etc/apt/sources.list.d/parrot.list
  echo "# Country Mirror Mirror" >> /etc/apt/sources.list.d/parrot.list
  echo "$MIRROR" >> /etc/apt/sources.list.d/parrot.list
  cp -f /etc/apt/sources.list.d/parrot.list /etc/apt/sources.list.d/parrot.list.c
	echo -e "# This file is empty, feel free to add here your custom APT repositories\n\n# The standard Parrot repositories are NOT here. If you want to\n# edit them, take a look into\n#                      /etc/apt/sources.list.d/parrot.list\n#                      /etc/apt/sources.list.d/debian.list\n\n\n\n# If you want to change the default parrot repositories setting\n# another localized mirror, then use the command parrot-mirror-selector\n# and see its usage message to know what mirrors are available\n\n\n\n#uncomment the following line to enable the Parrot Testing Repository\n#deb http://us.repository.frozenbox.org/parrot testing main contrib nonfree" > /etc/apt/sources.list
	wget --no-check-certificate -qO - https://archive.parrotsec.org/parrot/misc/parrotsec.gpg | apt-key add -
	apt-get update
	apt-get -y --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dpkg::Options::="--force-overwrite" install apt-parrot
	cp -f /etc/apt/sources.list.d/parrot.list.c /etc/apt/sources.list.d/parrot.list
	apt-get update
	apt-get -y --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dpkg::Options::="--force-overwrite" install parrot-core
	apt-get -y --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dpkg::Options::="--force-overwrite" dist-upgrade
	apt-get -y --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dpkg::Options::="--force-overwrite" autoremove
}

function headless_install() {
	apt-get -y --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dpkg::Options::="--force-overwrite" install  parrot-pico
}

function standard_install() {
	apt-get -y --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dpkg::Options::="--force-overwrite" install parrot-interface parrot-tools
}

function full_install() {
	apt-get -y --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dpkg::Options::="--force-overwrite" install parrot-interface parrot-interface-full parrot-tools-full
}

function home_install() {
	apt-get -y --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dpkg::Options::="--force-overwrite" install parrot-interface-full parrot-interface
}

function embedded_install() {
	apt-get -y --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dpkg::Options::="--force-overwrite" install parrot-interface parrot-mini
}

function generate_conf() {
	mv /etc/resolv.conf /etc/resolv.conf.bak
}

function init_function() {
clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then
            exit;
    else
        case $opt in
        1) clear;
        option_picked "Installing Core";
		select_mirror;
		core_install;
		generate_conf;
		option_picked "Operation Done!";
        exit;
        ;;
        2) clear;
		option_picked "Installing Headless Edition";
		select_mirror;
		core_install;
		headless_install;
		generate_conf;
		option_picked "Operation Done!";
		exit;
        ;;
        3) clear;
		option_picked "Installing Parrot Security OS";
		select_mirror;
		core_install;
		standard_install;
		generate_conf;
		option_picked "Operation Done!";
		exit;
        ;;
        4) clear;
		option_picked "Installing Full Edition";
		select_mirror;
		core_install;
		full_install;
		generate_conf;
		option_picked "Operation Done!";
		exit;
        ;;
		5) clear;
		option_picked "Installing Home Edition";
		select_mirror;
		core_install;
		home_install;
		generate_conf;
		option_picked "Operation Done!";
		exit;
		;;
		6) clear;
		option_picked "Installing Embedded Edition";
		select_mirror;
		core_install;
		embedded_install;
		generate_conf;
		option_picked "Operation Done!";
		exit;
	    ;;
        x)exit;
        ;;
		q)exit;
		;;
        \n)exit;
        ;;
        *)clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi
done
}

if [ `whoami` == "root" ]; then
	init_function;
else
	echo "Try with root access!"
fi