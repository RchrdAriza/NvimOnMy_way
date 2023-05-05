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
  
 echo -e "${GREEN}Dowloading vim-plug...${NC}" 
 sleep 2 
 curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \ 
 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 

 echo -e "${GREEN}Installing Lsp's...${NC}"
 sleep 2 
 npm i -g pyright
 sleep 2
 npm i -g bash-language-server
 sleep 2 
 clear
 npm i -g vscode-langservers-extracted
 sleep 2 
 npm install -g typescript typescript-language-server
 sleep 2 
 npm i -g vscode-langservers-extracted
 

 echo -e "${GREEN}Installing Packer...${NC}"
 sleep 2 
 mkdir -p ~/.config/nvim
 mv nvim/* ~/.config/nvim
 git clone https://github.com/wbthomason/packer.nvim ~/.config/nvim/packer/packer.nvim
 nvim +PackerInstall +qall



  
 echo -e "${GREEN}Installing vim plugins...${NC}" 
 sleep 2 
 nvim +PlugInstall +qall
  
  
 echo -e "${GREEN}Installation of plugins completed...${NC}" 
 sleep 2 
 clear 
 echo -e "${GREEN}Enjoy!${NC}" 
 sleep 3 

