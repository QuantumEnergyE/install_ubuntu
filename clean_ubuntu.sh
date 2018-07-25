cd
# vim
sudo apt-get -y --purge remove vim
if [ -d ~/.vim ]; then
    rm -rf ~/.vim
fi
rm ~/.vimrc
rm ~/.vimrc.bundles

# tmux
sudo apt-get -y --purge remove tmux
if [ -d ~/.tmux ]; then
    rm -rf ~/.tmux
fi
rm ~/.tmux.conf.local
rm ~/.tmux.conf

# zsh
sudo apt-get -y --purge remove zsh
if [ -d ~/.oh-my-zsh ]; then
    rm -rf ~/.oh-my-zsh
fi
rm ~/.zshrc

# shadowsocks
sudo apt-get -y --purge remove shadowsocks

# privoxy
sudo apt-get -y --purge remove privoxy
sed -i '/^alias proxyon=.*\|^alias proxyoff=.*/d' ~/.bashrc
