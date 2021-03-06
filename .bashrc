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
alias gp="git pull"
alias glg="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias gla="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short --all"
alias gca="git commit -a -v"
alias gc="git commit -v"
alias gco="git checkout"
alias gs="git show"
alias gls='git log --stat'
alias ga='git add'
alias gdc='git diff --cached'
#alias f='cd ~/workspace/fidati-front/'
#alias b='cd ~/workspace/fidati-back/'
#alias c='cd ~/workspace/carga-fidati/'
alias lrs='lein ring server'
alias lfg='lein figwheel'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] "

export JAVA_HOME="/home/danielhabib/dev/jdk/jdk1.8.0_241"

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
alias ews="cd ~/workspace_eco/eco-ws"
alias eiws="cd ~/workspace_eco/eco-inss-ws"
alias pp="cd *pom/"
alias vv="vim *pom/pom.xml"
alias t="cd ~/workspace_eco/eco-testes"
alias ti="cd ~/workspace_eco/eco-testes/eco-testes-integrados"
alias s="cd ~/workspace_eco/eco-servico"
alias we="cd ~/workspace_eco"
alias bb="cd ~/workspace_eco/eco-batch/scripts && ./build.sh"
alias ed="cd ~/workspace_eco/eco-docs"
alias ep="cd ~/workspace_eco/eco-if-portal"
alias hl="heroku logs -a fidati-back --tail"
alias hlc="heroku logs -a carga-fidati --tail"

export MW_HOME="/home/danielhabib/Oracle/Middleware/Oracle_Home/"
export MW_DOMAIN_NAME="eco"
export MW_DOMAIN_HOME="eco"

#fidati
alias fb="cd ~/workspace/fidati-back/"
alias ff="cd ~/workspace/fidati-front/"
alias fc="cd ~/workspace/carga-fidati/"

#set -o vi
# vim default
export EDITOR=vim
export VISUAL=vim

# hack
xset r rate 250 25
#alsamixer
#pavucontrol 
