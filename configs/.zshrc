setopt extendedglob

# auto completion
autoload -U compinit && compinit 
zstyle ':completion:*' menu select=10

autoload -U colors && colors
# prompt
PROMPT="%{$fg[cyan]%}%n@%m:%~$ %{$reset_color%}%"

# frequently used hosts
alias 88yun="ssh jjyao@66.175.220.101"
alias gfw="ssh -D 8080 root@66.175.220.101"

# some useful aliases
alias tarc="tar cvf"
alias tarcz="tar cvfz"
alias tarx="tar xvf"
alias tarxz="tar xvfz"

alias del="rm -i"
alias rm="rm -i"

alias ls="ls -F -G"
alias ll="ls -lh"
alias grep="grep --color=auto"

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
