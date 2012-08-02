# bindkey
bindkey -v

# setopt
setopt extendedglob
setopt globdots
setopt correctall
setopt autocd
setopt sunkeyboardhack
setopt inc_append_history

# autload
autoload -U compinit && compinit 
autoload -U colors && colors

# auto completion
zstyle ':completion:*' menu select=10
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

PROMPT="%{$fg[cyan]%}%n@%m:%~$ %{$reset_color%}%"
PATH=$PATH:/usr/local/mysql/bin
HISTFILE=~/.zsh_history
HISTSIZE=100
SAVEHIST=100

# frequently used hosts

# some useful aliases
alias tarc="tar cvf"
alias tarcz="tar cvfz"
alias tarx="tar xvf"
alias tarxz="tar xvfz"

alias del="rm -i"
alias rm="rm -i"
alias ps="ps -f"
alias ls="ls -F -G"
alias ll="ls -lh"
alias la="ls -a"
alias grep="grep --color=auto"
alias df="df -h"

alias port="netstat -tulpn | grep"
alias memory="free -t -m"
alias fdmax="cat /proc/sys/fs/file-max" # current maximum number of file descriptors total allowed to be opened simultaneously

user-ret(){
    if [[ $BUFFER = "" ]] ;then
        BUFFER="ls"
        zle end-of-line
        zle accept-line
    elif [[ $BUFFER =~ "^cd\ \.\.\.+$" ]] ;then
        BUFFER=${${BUFFER//\./\.\.\/}/\.\.\//}
    zle end-of-line
        zle accept-line
    else
        zle accept-line
    fi
}
zle -N user-ret
bindkey "\r" user-ret

mkcd(){
    mkdir -p "$@"
    cd "$@"
}

# locale
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"

# ruby
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
