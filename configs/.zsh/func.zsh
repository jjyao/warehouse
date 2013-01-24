function vr() {
    vim -c "bufdo %s/$1/$2/gc | update" $(ag "$1" -l)
}

function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function muc() {
    cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30
}

function dec2hex {
    printf "%x\n" $1
}

function hex2dec {
    printf "%d\n" 0x$1
}

function myip {
    curl ifconfig.me
}

function zshreload {
    source $HOME/.zshrc 1>/dev/null
}
