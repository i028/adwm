#! /bin/bash

cd dwm && make clean &> /dev/null
sudo make clean install && make clean

cd ../dmenu && make clean &> /dev/null
sudo make clean install && make clean

cd ../st && make clean &> /dev/null
sudo make clean install && make clean
cd ../

cp xinitrc ~/.xinitrc

echo "


if [[ ! \$DISPLAY && \$XDG_VTNR -eq 1 ]]; then
  exec startx
fi" >> ~/.bash_profile

# .zprofile for zsh
