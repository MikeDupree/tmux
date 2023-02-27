#!/bin/bash

echo $(pwd)
echo "Downloading mem cpu plugin"
git clone git@github.com:thewtex/tmux-mem-cpu-load.git

echo "Installing mem cpu plugin"
cd tmux-mem-cpu-load

cmake .
make

sudo make install
cd ..
echo "Backing up old config"
mv /home/$USER/.tmux.conf /home/$USER/.tmux.conf-original
echo "Linking new config"
cp $(pwd)/.tmux.conf /home/$USER/.tmux.conf
echo "Setup complete!"
