# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mrtazz"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git git-flow-completion brew rails)
# plugins=(thefuck git brew composer symfony2 heroku git-flow-completion)

# User configuration

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"
export TERMINAL="alacritty"

export PROMPT="%{$fg_bold[red]%}%n@%m%{$reset_color%}:%{$fg[cyan]%}%~%{$reset_color%} %# "

# Disable beep
unsetopt BEEP

# Fix language vars
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# Custom aliases
[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Homebrew fill the cores
# export HOMEBREW_MAKE_JOBS=8
# unless cpu is needed for something else
# alias brew="nice brew"

# iTerm
# source ~/.iterm2_shell_integration.`basename $SHELL`

# Heroku
# PATH="/usr/local/heroku/bin:$PATH"

# Android
# export ANDROID_HOME=/Users/mikol/Library/Android/sdk
# PATH="$PATH:$ANDROID_HOME/tools"

# Docker VirtualMachine
# if [[ $(ps aux | grep Virtual | grep 192.168.99.100) ]]; then
#   eval $(docker-machine env docker)
# fi

# BREW PATH
# PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# export PATH=$(echo $PATH | sed 's|/usr/local/bin||; s|/usr/local/sbin||; s|::|:|; s|^:||; s|\(.*\)|/usr/local/bin:/usr/local/sbin:\1|')
# export PATH=$(echo $PATH | sed 's|/usr/local/bin||; s|/usr/local/sbin||; s|::|:|; s|^:||; s|\(.*\)|/usr/local/bin:/usr/local/sbin:\1|')

# bin in $HOME
PATH="$PATH:$HOME/bin:$HOME/.local/bin"

# Python PATH
# export PATH=$PATH:$HOME/Library/Python/2.7/bin
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# MAMP PATH
# PATH="$PATH:/Applications/MAMP/Library/bin"
# MAMP PHP 7.0
# PATH="/Applications/MAMP/bin/php/php7.0.8/bin:$PATH"
# PATH="/Applications/MAMP/bin/php/php5.3.29/bin:$PATH"
# Brew PHP7.1
PATH="/usr/local/Cellar/php@7.1/7.1.18/bin:$PATH"

#
# MySQL prompt
export MYSQL_PS1="\u@\h [\d]> "

# source ~/.profile

# Set proxy from Location
# if [ $(networksetup -getwebproxy Ethernet | grep Yes -c) -ne 0 ]
# then
#	export HTTP_PROXY=`networksetup -getwebproxy Ethernet | awk {'print $2'} | awk {'getline l2; getline l3; print "http://"l2":"l3'} | head -n 1`
#	export http_proxy=$HTTP_PROXY
#	export HTTPS_PROXY=`networksetup -getsecurewebproxy Ethernet | awk {'print $2'} | awk {'getline l2; getline l3; print "https://"l2":"l3'} | head -n 1`
#	export https_proxy=$HTTPS_PROXY
# fi

# Composer global PATH
# PATH="$PATH:$HOME/.composer/vendor/bin"

# Amazon AWS
# complete -C aws_completer aws

# Google Cloud SDK
if [ -f '/home/mikol/google-cloud-sdk/path.zsh.inc' ]; then source '/home/mikol/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/home/mikol/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/mikol/google-cloud-sdk/completion.zsh.inc'; fi

# Intellij IDEA
# export env variable pointing to project directory
if [ -n "$IDEA" ]; then export PRJ=$PWD; fi

# Jmeter
# export PATH="$PATH:/opt/apache-jmeter-5.2.1/bin"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
  #     nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use --silent
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    nvm use default --silent
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# RVM
# export PATH="$HOME/.rvm/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# ROS
if [ -f '/opt/ros/noetic/setup.zsh' ]; then source '/opt/ros/noetic/setup.zsh'; fi

# Snap
export PATH="$PATH:/snap/bin"

# Esp32 Rust
source "$HOME/export-esp.sh"

# Ansible
# eval $(register-python-argcomplete ansible)
# eval $(register-python-argcomplete ansible-config)
# eval $(register-python-argcomplete ansible-console)
# eval $(register-python-argcomplete ansible-doc)
# eval $(register-python-argcomplete ansible-galaxy)
# eval $(register-python-argcomplete ansible-inventory)
# eval $(register-python-argcomplete ansible-playbook)
# eval $(register-python-argcomplete ansible-pull)
# eval $(register-python-argcomplete ansible-vault)

# unalias run-help
# autoload run-help
# HELPDIR=/usr/local/share/zsh/help

# Load SSH keys
eval `keychain --eval --nogui -Q -q id_rsa id_rsa_aqr-api id_rsa_treeweb` # id_rsa_aruba
# if [ -z "$SSH_AUTH_SOCK" ] ; then
#    eval `ssh-agent`
#    ssh-add $HOME/.ssh/id_rsa $HOME/.ssh/id_rsa_aruba $HOME/.ssh/id_rsa_aqr-api $HOME/.ssh/id_rsa_treeweb
# fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
# [[ -f /Users/mikol/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/mikol/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
# [[ -f /Users/mikol/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/mikol/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mikol/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mikol/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mikol/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mikol/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export PATH="$HOME/.poetry/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
