#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'


echo -e "${GREEN}Updating packages...${NC}"
sleep 3

PACKAGES=("python" "yarn" "neovim" "nodejs-lts" "npm" "python3-pip" "curl" "lua53")

for package in "${PACKAGES[@]}"
do
  echo -e "${YELLOW}Checking if $package is installed...${NC}"
  sleep 5
  if dpkg -s "$package" >/dev/null 2>&1; then
    echo -e "${GREEN}$package is installed!${NC}"
    sleeo 2
  else
    echo -e "${RED}$package is not installed!${NC}"
    sleep 3
    apt-get install "$package..."
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

//haz un spinner
echo -e "${GREEN}Installing coc extensions...${NC}"
sleep 2
cd ~/.config/coc/extensions
npm install coc-json coc-tsserver coc-html coc-css coc-pyright coc-snippets coc-vimlsp coc-sh
cd ~

echo -e "${GREEN}Installing Finished...${NC}"
sleep 2
echo -e "${GREEN}Enjoy!${NC}"
