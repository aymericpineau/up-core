#!/bin/bash

dry_run=true

#################
# Prerequisites #
#################
 # 1. Download ubuntu 18.04 LTS server -> https://www.ubuntu.com/download/server
 # 2. Make a bootable usb stick using rufus -> https://rufus.ie/
 # 3. Prepare the board (keyboard / hdmi / bootable usb-stick / power)
 # 4. Fire it up and install ubuntu server (press DEL at startup to enter BIOS (press enter with empty password))
 
#############
# 1st login #
#############
 # 1. sudo apt-get update; sudo apt-get install git
 # 2. git clone https://github.com/aymericpineau/up-core.git
 # 2. cd up-core
 # 3. nano deploy.sh (switch dry_run to false)
 # 4. chmod +x deploy.sh
 # 5. sudo ./deploy.sh

# Set colors as vars
rstclr="\e[0m"
grn="\e[32m"
ylw="\e[33m"
cyn="\e[36m"
lghrd="\e[91m"

# Set commands as vars
cmd1="apt-get update"
cmd2="apt-get -y upgrade"
cmd3="apt-get -y install git dkms dnsmasq wpasupplicant wireless-tools"
cmd4="cp ./rtl8814au/ -R /usr/src/rtl8814au-4.3.21"
cmd5="dkms build -m rtl8814au -v 4.3.21"
cmd6="dkms install -m rtl8814au -v 4.3.21"
cmd7="mv /etc/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml.original"
cmd8="mv ./50-cloud-init.yaml /etc/netplan/"
cmd9="mv /etc/dnsmasq.conf /etc/dnsmasq.conf.original"
cmd10="mv ./dnsmasq.conf /etc/"
cmd11="crontab -l > crontab.lst"
cmd12="printf \"@reboot sudo iptables -t nat -A POSTROUTING -o wlx00c0ca9650cd -j MASQUERADE\" >> crontab.lst" # Ne fonctionne pas, a coder en dur
cmd13="crontab crontab.lst"
cmd14="chmod 777 /etc/sysctl.conf"
cmd15="printf \"net.ipv4.ip_forward=1\" >> /etc/sysctl.conf"
cmd16="chmod 644 /etc/sysctl.conf"
cmd17="poweroff"
echo

echo -e "$ylw This script is designed to make an up-board act as a wifi bridge using an alfa AWUS1900. $rstclr"
echo
sleep 3

echo -e "$ylw It runs the following commands: $rstclr"
echo -e "1.$cyn $cmd1 $rstclr"
echo -e "2.$cyn $cmd2 $rstclr"
echo -e "3.$cyn $cmd3 $rstclr"
echo -e "4.$cyn $cmd4 $rstclr"
echo -e "5.$cyn $cmd5 $rstclr"
echo -e "6.$cyn $cmd6 $rstclr"
echo -e "7.$cyn $cmd7 $rstclr"
echo -e "8.$cyn $cmd8 $rstclr"
echo -e "9.$cyn $cmd9 $rstclr"
echo -e "10.$cyn $cmd10 $rstclr"
echo -e "11.$cyn $cmd11 $rstclr"
echo -e "12.$cyn $cmd12 $rstclr"
echo -e "13.$cyn $cmd13 $rstclr"
echo -e "14.$cyn $cmd14 $rstclr"
echo -e "15.$cyn $cmd15 $rstclr"
echo -e "16.$cyn $cmd16 $rstclr"
echo -e "17.$cyn $cmd17 $rstclr"
echo

read -p "Ok for you? ('y' to continue...) " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]] # (if 'answer' != 'y')
  then
    echo
    echo -e "$grn Exiting... $rstclr"
	echo
	[[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
  else
	echo
	echo -e "1. Running '$cyn $cmd1 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd1; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "2. Running '$cyn $cmd2 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd2; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "3. Running '$cyn $cmd3 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd3; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "4. Running '$cyn $cmd4 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd4; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "5. Running '$cyn $cmd5 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd5; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "6. Running '$cyn $cmd6 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd6; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "7. Running '$cyn $cmd7 $rstclr'"
	sleep 3;
	if [[ "$dry_run" = false ]] ; then $cmd7; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "8. Running '$cyn $cmd8 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd8; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "9. Running '$cyn $cmd9 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd9; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "10. Running '$cyn $cmd10 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd10; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "11. Running '$cyn $cmd11 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd11; sleep 1;	fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "12. Running '$cyn $cmd12 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then printf "@reboot sudo iptables -t nat -A POSTROUTING -o wlx00c0ca9650cd -j MASQUERADE\n" >> crontab.lst; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "13. Running '$cyn $cmd13 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd13; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "14. Running '$cyn $cmd14 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd14; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "15. Running '$cyn $cmd15 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then printf "net.ipv4.ip_forward=1\n" >> /etc/sysctl.conf; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "16. Running '$cyn $cmd16 $rstclr'"
	sleep 3
	if [[ "$dry_run" = false ]] ; then $cmd16; sleep 1; fi
	echo -e "$grn ... Done $rstclr"
	echo
	echo
	
	echo -e "17. Running '$cyn $cmd17 $rstclr'"
	sleep 3
	read -p "The system needs to shutdown so you can plug the AWUS1900 wifi adapter. Ok for you? ('y' to shutdown...) " -n 1 -r
		if [[ ! $REPLY =~ ^[Yy]$ ]]
			then
				echo
				echo -e "$grn Exiting... $rstclr"
				echo
				[[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
		else
			echo
			echo
			echo -e "$ylw The system is going to shutdown... $rstclr $lghrd => Make sure to plug the AWUS1900 Wifi card before starting the up-board again. $rstclr"
			echo
			sleep 5
			if [[ "$dry_run" = false ]] ; then $cmd17; fi
		fi
fi
