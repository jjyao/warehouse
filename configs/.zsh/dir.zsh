setopt auto_pushd
setopt autocd

alias ls="ls -F -G"
alias ll="ls -lh"
alias la="ls -a"

alias 1='cd -'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'

function mkcd() {
    mkdir -p "$@"
    cd "$@"
}

function user-ret() {
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
