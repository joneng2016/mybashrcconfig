# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#Alternar para o PHP 5.6
alias tophp56='sudo update-alternatives --set php /usr/bin/php5.6 && sudo /etc/init.d/php5.6-fpm restart && sudo /etc/init.d/nginx restart'
#Alternar para o PHP 7.0
alias tophp70='sudo update-alternatives --set php /usr/bin/php7.0 && sudo /etc/init.d/php7.0-fpm restart && sudo /etc/init.d/nginx restart'
#Alternar para o PHP 7.4
alias tophp74='sudo update-alternatives --set php /usr/bin/php7.4 && sudo /etc/init.d/php7.4-fpm restart && sudo /etc/init.d/nginx restart'

alias code_root='code . --user-data-dir --no-sandbox'
alias code_root_vebose='code . --user-data-dir --no-sandbox --verbose'
alias artisan='php artisan'
alias aws_simulation='docker run --rm -it -p 4566:4566 -p 4571:4571 localstack/localstack
aws sqs create-queue --endpoint http://localhost:4566 --queue-name loyalty-events-integration'

basicInstall()
{

    apt-get install -y update
    apt-get install -y upgrade
    apt-get install -y vim
    apt-get install -y php 
    apt-get install -y php7.2-mysql
    apt-get install -y php7.2-curl 
    apt-get install -y htop
    apt-get install -y mysql-server
    apt-get install -y git 
    apt-get install -y mysql-workbench
    apt-get install -y firefox 
    apt-get install -y apache2
    apt-get install -y nodejs npm
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    dpkg -i google-chrome-stable_current_amd64.deb
    rm -rf google-chrome-stable_current_amd64.deb 
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    apt-get -y update
    apt-get install -y sublime-text
    apt-get install -y lynx
    apt-get install -y evince
    sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpgmv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    apt-get update
    apt-get install code
    apt-get instal abntex
    	
}

createPhpClass()
{
    name=$1
    touch $name."php"

    echo "<?php\n namespace \n use \n \n class{ \n \n } " $name."php"
}
