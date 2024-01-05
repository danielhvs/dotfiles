# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -ltrh'
alias la='ll -A'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
	
alias gg="git status"
alias gd="git diff"
alias gf="git pull"
alias gps="git push"
alias gpst="git push --tags"
alias gpss='git push --set-upstream origin `git rev-parse --abbrev-ref HEAD`'
alias glg="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=iso"
alias gla="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=iso --all"
alias gca="git commit -a -v"
alias gc="git commit -v"
alias gco="git checkout"
alias gs="git show"
alias gls='git log --stat'
alias ga='git add'
alias gdc='git diff --cached'
alias lrs='lein ring server'
alias lfg='lein figwheel'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] "

alias m2="cd /home/danielhabib/.m2/repository/br/gov/dataprev/sibepu"
alias gdf="git log --all -p -- $*"
alias gs="git show"
alias gg="git status"
alias c="cd ~/workspace_eco/eco-comum"
alias b="cd ~/workspace_eco/eco-batch"
alias grep="grep --color=auto $*"
alias gd="git diff"
alias bt="cd ~/workspace_eco/eco-batch/target"
alias es="cd ~/workspace_eco/eco-sincronizacao"
alias s="cd ~/workspace_eco/eco-servico"
alias is="cd ~/workspace_eco/eco-inss-servico"
alias n="cd ~/workspace_eco/eco-negocio"
alias v="cd ~/workspace_eco/eco-visao"
alias vc="grep eco-comum -A1 pom.xml |head -n2"
alias d="cd /home/danielhabib/sibe/demandas/DM.095204"
alias ews="cd ~/workspace_eco/eco-ws"
alias eiws="cd ~/workspace_eco/eco-inss-ws"
alias pp="cd *pom/"
alias vv="vim *pom/pom.xml"
alias t="cd ~/workspace_eco/eco-testes"
alias tw="cd ~/workspace/tailwind"
alias ti="cd ~/workspace_eco/eco-testes/eco-testes-integrados"
alias cs="cd ~/workspace_eco/gestao-projeto/consultas"
alias s="cd ~/workspace_eco/eco-servico"
alias we="cd ~/workspace_eco"
alias wd="cd ~/workspace"
alias ws="cd ~/weblogic-sibe"
alias bb="cd ~/workspace_eco/eco-batch/scripts && ./build.sh"
alias ed="cd ~/workspace_eco/eco-docs"
alias ep="cd ~/workspace_eco/eco-if-portal"
alias sb="cd ~/workspace_eco/sibe-pu-repo/"
alias sb4="cd ~/workspace_eco/sibe"
alias dn="cd ~/workspace_eco/dec-negocio/"
alias ds="cd ~/workspace_eco/dec-service/"
alias hc="cd /home/danielhabib/workspace_eco/sibe-pu-repo/negocio/sibehiscre/SIBEHiscreEjb"
alias mcb="cd /home/danielhabib/workspace_eco/sibe-pu-repo/negocio/mcb/McbEjb/"
alias u="cd /home/danielhabib/workspace/upwork/rectangle"
alias dw="cd /home/danielhabib/Downloads"

# Config para ECO
# export MW_HOME="/home/danielhabib/Oracle/Middleware/Oracle_Home/"
export JAVA_HOME="/home/danielhabib/dev/jdk/jdk1.8.0_241"
# Config para DEC
# export MW_HOME="/home/danielhabib/Oracle/Middleware12.1/Oracle_Home"
# Config para SIBE
export MW_HOME="/home/danielhabib/sibe/wls12212"
# export JAVA_HOME="/home/danielhabib/dev/jdk/jdk1.6.0_45"
export jdkhome="/home/danielhabib/dev/jdk/jdk1.6.0_45"

# wl novo
export MW_DOMAIN_NAME="eco"
# export MW_DOMAIN_HOME="eco"

# wl velho
# export MW_DOMAIN_NAME="eco"
# export MW_DOMAIN_HOME="/home/danielhabib/Oracle/Middleware12.1/Oracle_Home/user_projects/domains"
# Sibe
export MW_DOMAIN_HOME="/home/danielhabib/sibe/wls12212/user_projects/domains/d350958"

#fidati
alias fb="cd ~/workspace/fidati-back/"
alias ff="cd ~/workspace/fidati-front/"
alias fc="cd ~/workspace/fidati-carga/"
alias cf="cd ~/workspace/carga-fidati/"
alias hl="heroku logs -a fidati-back --tail"
alias hlc="heroku logs -a carga-fidati --tail"
alias sdc="tail -n1000 /home/danielhabib/bin/saida.*"

# ju 
alias j="cd /home/danielhabib/juju/niver"

# vim default
export EDITOR=nvim
export VISUAL=nvim

# hack
xset r rate 250 25

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export LD_LIBRARY_PATH=/home/danielhabib/jprofiler12/bin/linux-x64

# xmodmap -e "clear lock" #disable caps lock switch
# xmodmap -e "keysym Caps_Lock = Escape" #set caps_lock as escape
export SCRIPT_DIR=/home/danielhabib/.config/i3blocks

# copy the last file to the clipboard 
alias lldw="ls -tlr ~/Downloads"

# copy the full file to the clipboard
catcp() {
  cat $1 | xclip -selection clipboard
}

# copy the fullpath to the clipboard
lcp() {
  realpath $1 | xclip -selection clipboard
}

# copy the fullpath to the clipboard
llcp() {
  cd $1 &&
  echo `ls -tr $1 |tail -n1|xargs realpath` && 
  ls -tr $1 |tail -n1|xargs realpath| xclip -selection clipboard &&
  cd -
}


alias vi="nvim -u /home/danielhabib/.config/nvim/init.lua"
alias vim="nvim -u /home/danielhabib/.config/nvim/init.lua"
alias vd="nvim -u /home/danielhabib/.config/nvim/init.lua"
alias vf="nvim -u /home/danielhabib/.config/nvim/init.lua"
alias v="nvim -u /home/danielhabib/.config/nvim/init.lua"
alias vv="nvim -u /home/danielhabib/.config/nvim/init.lua"
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin/go/bin:$PATH"
fi

source ~/bin/fidati-env.sh
source ~/bin/sibe

# perl nvim
PATH="/home/danielhabib/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/danielhabib/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/danielhabib/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/danielhabib/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/danielhabib/perl5"; export PERL_MM_OPT;

# conversao de videos para whatsapp (WIN+SHIFT+G)
alias converte-mp4="echo 'ffmpeg -i NOME_ARQ.avi -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p NOME_ARQ.mp4'"
alias i="less ~/pessoal/as-lagrimas.pdf"
# 16 – A explosão dourada
alias clip="xclip -selection clipboard"


#initialize Z (https://github.com/rupa/z) 
source /home/danielhabib/bin/z/z-1.11/z.sh

# tmux
alias tt="nvim ~/dotfiles/.tmux.conf"
alias tn="tmux -u -f ~/dotfiles/.tmux.conf new"
alias ta="tmux -u -f ~/dotfiles/.tmux.conf attach"
alias tls="tmux ls"
