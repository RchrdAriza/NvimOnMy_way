#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'


echo -e "${GREEN}Updating packages...${NC}"
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

echo -e "${GREEN}Installing vim-plug...${NC}"
sleep 2
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


echo -e "${GREEN}Installing vim plugins...${NC}"
mkdir -p ~/.config/nvim
mv init.vim ~/.config/nvim
mv coc-settings.json ~/.config/nvim
sleep 2
nvim +PlugInstall +qall


echo -e "${GREEN}Installation of plugins completed...${NC}"
sleep 2
clear
echo -e "${GREEN}Enjoy!${NC}"
clear
echo -e "${GREEN}Open nvim to complete the process...${NC}"