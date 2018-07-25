cd
# system
sudo apt-get -y install build-essential
sudo apt-get -y install openssh-server
sudo apt-get -y install curl
sudo apt-get -y install git
# git proxy
git config --global http.proxy http://127.0.0.1:8118

# vim
if [ -d ~/.vim ]; then
    rm -rf ~/.vim
fi
sudo apt-get -y install vim
git clone https://github.com/QuantumEnergyE/.vim.git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vim/.vimrc .
cp .vim/.vimrc.bundles .
#vim +PluginInstall +qall

# tmux
if [ -d ~/.tmux ]; then
    rm -rf ~/.tmux
fi
sudo apt-get -y install tmux
git clone https://github.com/QuantumEnergyE/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# zsh
if [ -d ~/.oh-my-zsh ]; then
    rm -rf ~/.oh-my-zsh
fi
sudo apt-get -y install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/^\(plugins=(\)$/\1zsh-autosuggestions,zsh-syntax-highlighting,/' ~/.zshrc
# privoxy
echo 'alias proxyon="export http_proxy=http://127.0.0.1:8118; export https_proxy=$http_proxy"' >> ~/.zshrc
echo 'alias proxyoff="unset http_proxy; unset https_proxy"' >> ~/.zshrc

# python
sudo apt-get -y install python-pip
