#!/bin/bash

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
PLAIN='\033[0m'

# Functions for text formatting
red() {
    echo -e "\033[31m\033[01m$1\033[0m"
}

green() {
    echo -e "\033[32m\033[01m$1\033[0m"
}

yellow() {
    echo -e "\033[33m\033[01m$1\033[0m"
}

# Function to determine the CPU architecture
archAffix(){
    case "$(uname -m)" in
        i386 | i686 ) echo '386' ;;
        x86_64 | amd64 ) echo 'amd64' ;;
        armv8 | arm64 | aarch64 ) echo 'arm64' ;;
        s390x ) echo 's390x' ;;
        * ) red "Unsupported CPU architecture!" && exit 1 ;;
    esac
}

# Function to select the best WARP endpoint IP
endpointyx(){    
    # Download the endpoint selection tool, thanks to an anonymous user for sharing
    wget https://gitlab.com/Misaka-blog/warp-script/-/raw/main/files/warp-yxip/warp-linux-$(archAffix) -O warp
    
    # Turn off the default thread limit of Linux, to enable optimal endpoint IP generation
    ulimit -n 102400
    
    # Start the WARP endpoint IP selection tool
    chmod +x warp && ./warp >/dev/null 2>&1
    
    # Display the top ten optimal endpoint IPs and usage details
    green "Current optimal endpoint IP results are as follows:"
    cat result.csv | awk -F, '$3!="timeout ms" {print} ' | sort -t, -nk2 -nk3 | uniq | head -11 | awk -F, '{print "Endpoint "$1" Loss "$2" Avg delay "$3}'
    echo ""
    yellow "Usage details are as follows:"
    yellow "1. Replace the default endpoint IP of the WireGuard node: engage.cloudflareclient.com:2408, with the locally optimal endpoint IP"

    # Delete the WARP endpoint IP selection tool and related files
    rm -f warp ip.txt result.csv
}

# Function to generate a list of optimal WARP IPv4 endpoint IP ranges
endpoint4(){
    n=0
    iplist=200
    temp=()
    while true; do
        temp[$n]=$(echo 162.159.192.$(($RANDOM % 256)))
        n=$(($n + 1))
        if [ $n -ge $iplist ]; then
            break
        fi
        temp[$n]=$(echo 162.159.193.$(($RANDOM % 256)))
        n=$(($n + 1))
        if [ $n -ge $iplist ]; then
            break
        fi
        temp[$n]=$(echo 162.159.195.$(($RANDOM % 256)))
        n=$(($n + 1))
        if [ $n -ge $iplist ]; then
            break
        fi
        temp[$n]=$(echo 188.114.96.$(($RANDOM % 256)))
        n=$(($n + 1))
        if [ $n -ge $iplist ]; then
            break
        fi
        temp[$n]=$(echo 188.114.97.$(($RANDOM % 256)))
        n=$(($n + 1))
        if [ $n -ge $iplist ]; then
            break
        fi
        temp[$n]=$(echo 188.114.98.$(($RANDOM % 256)))
        n=$(($n + 1))
        if [ $n -ge $iplist ]; then
            break
        fi
        temp[$n]=$(echo 188.114.99.$(($RANDOM % 256)))
        n=$(($n + 1))
        if [ $n -ge $iplist ]; then
            break
        fi
    done
    while true; do
        if [ $(echo ${temp[@]} | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
            break
        else
            temp[$n]=$(echo 162.159.192.$(($RANDOM % 256)))
            n=$(($n + 1))
        fi
        if [ $(echo ${temp[@]} | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
            break
        else
            temp[$n]=$(echo 162.159.193.$(($RANDOM % 256)))
            n=$(($n + 1))
        fi
        if [ $(echo ${temp[@]} | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
            break
        else
            temp[$n]=$(echo 162.159.195.$(($RANDOM % 256)))
            n=$(($n + 1))
        fi
        if [ $(echo ${temp[@]} | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
            break
        else
            temp[$n]=$(echo 188.114.96.$(($RANDOM % 256)))
            n=$(($n + 1))
        fi
        if [ $(echo ${temp[@]} | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
            break
        else
            temp[$n]=$(echo 188.114.97.$(($RANDOM % 256)))
            n=$(($n + 1))
        fi
        if [ $(echo ${temp[@]} | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
            break
        else
            temp[$n]=$(echo 188.114.98.$(($RANDOM % 256)))
            n=$(($n + 1))
        fi
        if [ $(echo ${temp[@]} | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
            break
        else
            temp[$n]=$(echo 188.114.99.$(($RANDOM % 256)))
            n=$(($n + 1))
        fi
    done

    # Put the generated IP range list into ip.txt for program to select
    echo ${temp[@]} | sed -e 's/ /\n/g' | sort -u > ip.txt

    # Start the selection program
    endpointyx
}

# Function to generate a list of optimal WARP IPv6 endpoint IP ranges
endpoint6(){
    n=0
    iplist=200
    temp=()
    while true; do
        temp[$n]=$(echo [2606:4700:d1::$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2)))])
		n=$(($n + 1))
if [ $n -ge $iplist ]; then
    break
fi
done
while true; do
    if [ $(echo ${temp[@]} | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
        break
    else
        temp[$n]=$(echo [2606:4700:d0::$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2)))])
        n=$(($n + 1))
    fi
    if [ $(echo ${temp[@]} | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
        break
    else
        temp[$n]=$(echo [2606:4700:d1::$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2)))])
        n=$(($n + 1))
    fi
done

# Put the generated IP range list into ip.txt for program optimization.
echo ${temp[@]} | sed -e 's/ /\n/g' | sort -u > ip.txt

# Start optimization program.
endpointyx
}

menu(){
clear
echo "######################################################################################"
echo -e "#        ${RED}WARP Endpoint IP One-Click Optimization Script for Mac${PLAIN}        #"
echo -e "# ${GREEN}Author${PLAIN}: MisakaNo's Little Breaking Station                         #"
echo -e "# ${GREEN}Translator${PLAIN}: YeBeKhe - https://twitter.com/yebekhe                  #"
echo -e "# ${GREEN}Blog${PLAIN}: https://blog.misaka.rest                                     #"
echo -e "# ${GREEN}GitHub Project${PLAIN}: https://github.com/Misaka-blog                     #"
echo -e "# ${GREEN}GitLab Project${PLAIN}: https://gitlab.com/Misaka-blog                     #"
echo -e "# ${GREEN}Telegram Channel${PLAIN}: https://t.me/misakanocchannel                    #"
echo -e "# ${GREEN}Telegram Group${PLAIN}: https://t.me/misakanoc                             #"
echo -e "# ${GREEN}YouTube Channel${PLAIN}: https://www.youtube.com/@misaka-blog              #"
echo "######################################################################################"
echo ""
echo -e " ${GREEN}1.${PLAIN} WARP IPv4 Endpoint IP Optimization ${YELLOW}(Default)${PLAIN}"
echo -e " ${GREEN}2.${PLAIN} WARP IPv6 Endpoint IP Optimization"
echo " -------------"
echo -e " ${GREEN}0.${PLAIN} Exit Script"
echo ""
read -rp "Please enter an option [0-2]: " menuInput
case $menuInput in
    2 ) endpoint6 ;;
    0 ) exit 1 ;;
    * ) endpoint4 ;;
esac
}

menu
