#!/bin/bash

# DEBUGGER
set -xe 

#
# sudo variable  
#
if [[ $UID == 0 ]]; then
    SUDO=""
else
    SUDO="sudo "
fi

#
# install git, zsh, vim, tmux
#
os_type=$(cat /etc/os-release | grep "^ID=" | cut -d\= -f2 | sed -e 's/"//g')
case "$os_type" in 
	"ubuntu")
		sudo apt-get update && sudo apt-get upgrade -y
		$SUDO apt-get -y -qq install git zsh vim tmux unzip curl wget nodejs npm ruby-full python3 python3-pip bpython autojump fonts-powerline
		;;
	"amzn")
		sudo yum update -y
		$SUDO yum -y -qq install git zsh vim tmux unzip curl wget python3 python3-pip util-linux-user
		# clone
		[[ ! -d ./autojump ]] &&
                git clone https://github.com/wting/autojump.git
		[[ ! -d ./fonts ]] &&
		git clone https://github.com/powerline/fonts.git --depth=1
		# install
                cd fonts
                ./install.sh
                # clean-up a bit
                cd ..
                rm -rf fonts
                cd autojump
                ./install.py
		cd ..

		;;
	esac

#os_version=$(lsb_release -r |cut -f2)
#INT=$((os_version))
#echo "${os_version}"
#new_version=19.04


#
# install lsd
#
#if ! type lsd 2>/dev/null; then
#        DEBFILE="lsd.deb"
#        VERSION=`curl -s https://github.com/Peltoche/lsd/releases/latest | cut -d '"' -f 2 | cut -d '/' -f 8`
#	echo ${VERSION}
#	wget -q -O $DEBFILE https://github.com/Peltoche/lsd/releases/download/$VERSION/lsd_${VERSION}_amd64.deb
#        $SUDO dpkg -i $DEBFILE
#fi

#
# install gotop
#
if ! type gotop 2>/dev/null; then
        git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop
        /tmp/gotop/scripts/download.sh
        $SUDO mv gotop /usr/local/bin/
fi

#
# install bpytop
#
$SUDO pip3 install bpytop --upgrade


# install oh-my-zsh
#
if [[ ! -d ~/.oh-my-zsh ]]; then
    wget -q -O install_ohmyzsh.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
#     CHSH=no RUNZSH=no sh install_ohmyzsh.sh
    sh install_ohmyzsh.sh --unattended
    rm install_ohmyzsh.sh
fi

#
# change theme
#
#dracular theme 
#git clone https://github.com/dracula/zsh.git
#ln -s $DRACULA_THEME/dracula.zsh-theme $OH_MY_ZSH/themes/dracula.zsh-theme
#cp ~/zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme
#mv ~/zsh/lib ~/.oh-my-zsh/themes/
#sed -i 's/robbyrussell/dracula/' ~/.zshrc

#agnoster theme
#sed -i 's/robbyrussell/agnoster/' ~/.zshrc

[[ -f ~/.zshrc ]] && mv ~/.zshrc ~/.zshrc.bak
        cp .zshrc ~/.zshrc

#
# install and apply zsh-plugin 
#
[[ ! -d ~/.oh-my-zsh/custom/themes/alien-minimal ]] && \
    git clone -q --recurse-submodules https://github.com/eendroroy/alien-minimal.git \
        ~/.oh-my-zsh/custom/themes/alien-minimal
[[ ! -d ~/.oh-my-zsh/plugins/zsh-autosuggestions ]] && \
    git clone -q https://github.com/zsh-users/zsh-autosuggestions \
        ~/.oh-my-zsh/plugins/zsh-autosuggestions
[[ ! -d ~/.oh-my-zsh/plugins/zsh-syntax-highlihgting ]] && \
    git clone -q https://github.com/zsh-users/zsh-syntax-highlighting \
        ~/.oh-my-zsh/plugins/zsh-syntax-highlihgting
#exec zsh -l
$SUDO chsh -s $(which zsh)

#
# install rc files
#
for file_path in $(find $PWD -type f -name ".*" ); do 
    fname=$(basename $file_path)
    if ! [ "$fname" = ".zshrc" ] &&
       ! [ "$fname" = ".gitconfig" ]; then
        ln -sf $file_path $HOME/$fname; 
    fi
done
cat .gitconfig >> ~/.gitconfig
cat .zshrc >> ~/.zshrc

#
# tmux 2.x config
#
TMUX_VERSION=$(tmux -V | cut -d' ' -f2)
if [[ "${TMUX_VERSION:0:1}" == "2" ]]; then
    sed -i 's/bind \\\\ split-window -h/bind \\ split-window -h/g' ~/.tmux.conf
fi

#
# install vim-plug
#
if [[ ! -f ~/.vim/autoload/onedark.vim ]]; then
    curl -sfLo ~/.vim/autoload/onedark.vim --create-dirs \
        https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/onedark.vim
fi
if [[ ! -f ~/.vim/colors/onedark.vim ]]; then
    curl -sfLo ~/.vim/colors/onedark.vim --create-dirs \
        https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim
fi
if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
    curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
fi


