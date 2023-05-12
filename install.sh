#!/bin/bash 
  
 # Colors 
 RED='\033[0;31m' 
 GREEN='\033[0;32m' 
 YELLOW='\033[0;33m' 
 NC='\033[0m' 
 clear 
  
 echo ' 
          ███╗░░██╗██╗░░░██╗██╗███╗░░░███╗  
          ████╗░██║██║░░░██║██║████╗░████║  
          ██╔██╗██║╚██╗░██╔╝██║██╔████╔██║  
          ██║╚████║░╚████╔╝░██║██║╚██╔╝██║  
          ██║░╚███║░░╚██╔╝░░██║██║░╚═╝░██║  
          ╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝ 
               █▀█ █▄░█ █▀▄▀█ █▄█ 
               █▄█ █░▀█ █░▀░█ ░█░ 
         ░██╗░░░░░░░██╗░█████╗░██╗░░░██╗  
         ░██║░░██╗░░██║██╔══██╗╚██╗░██╔╝  
         ░╚██╗████╗██╔╝███████║░╚████╔╝░  
         ░░████╔═████║░██╔══██║░░╚██╔╝░░  
         ░░╚██╔╝░╚██╔╝░██║░░██║░░░██║░░░  
         ░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝░░░╚═╝░░░' 
 echo "" 
 echo -e "${GREEN}Updating packages...${NC}" 
 apt-get update 
 sleep 3 
  
  
  
 PACKAGES=("python" "neovim" "nodejs-lts" "yarn" "curl" "lua53") 
  
 for package in "${PACKAGES[@]}" 
 do 
   echo -e "${YELLOW}Checking if $package is installed...${NC}" 
   sleep 3 
   if dpkg -s "$package" >/dev/null 2>&1; then 
     echo -e "${GREEN}$package is installed!${NC}" 
     sleep 2 
     clear 
   else 
     echo -e "${RED}$package is not installed!${NC}" 
     sleep 3 
     pkg install -y "$package" 
     clear 
   fi 
 done 
  
    
 echo -e "${GREEN}Installing packer...${NC}" 
 mkdir -p ~/.config/nvim 
 mv init.lua ~/.config/nvim
 mv lua ~/.config/nvim
 mv colors ~/.config/nvim 
 sleep 2 
 nvim -c ":x"
 
echo -e "${GREEN}Installing plugins...${NC}"
 nvim +PackerInstall +qall 
 
echo -e "${GREEN}Installing LSP...${NC}"
nvim -c ":lua InstallLSPs()" -c ":q"
  
 echo -e "${GREEN}Installation of plugins completed...${NC}" 
 sleep 2 
 clear 
 echo -e "${GREEN}Enjoy!${NC}" 
 sleep 3 
 
