#!/bin/bash

echo "======== Install Packages =======" 
yes | sudo pacman -S xsel github-cli virtualbox vagrant kubectl kubectx helm terraform ansible aws-cli docker docker-compose neovim go rust jdk-openjdk python-pip make cmake autoconf automake gcc minikube curl wget npm ripgrep lazygit bottom yay wireguard-tools

echo "====== Install Nerd Fonts ========"
yes | yay -S nerd-fonts-complete

echo "======== Docker Post Install ========"
sudo usermod -aG docker $USER && echo "User $USER added in to group docker"

echo "======== Install AstroVim ========"
npm install tree-sitter-cli
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync


echo "======== Add Aliases ========"
cat <<EOT >> ~/.zshrc
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias mypubkey="cat ~/.ssh/id_rsa.pub|pbcopy && echo 'ssh public key copied in buffer'"
alias myprivatekey="cat ~/.ssh/id_rsa|pbcopy && echo 'ssh private key copied in buffer'"

alias wg="wget"
alias kb="kubectl"
alias kbx="kubectx"
alias mk="minikube"
alias hl="helm"
alias tf="terraform"
alias vg="vagrant"
alias pt="poetry"
alias mng="python3 manage.py"
alias listen="lsof -i -P -n | grep LISTEN"
alias listen_port="lsof -i -P -n | grep LISTEN | grep $1"
alias dc="docker-compose"
alias dk="docker"
alias gp="git add -A; git commit -m '$1'; git push" 
alias dos="dosbox -conf $HOME/.dosbox.conf $HOME/DOS"
alias ytd="youtube-dl"
alias ec="nvim $HOME/.zshrc"
alias sc="source $HOME/.zshrc"


alias -s {md,json,rs,css,ts,js,html,yaml,yml,conf}=nvim
EOT

echo "======== Done ========"
