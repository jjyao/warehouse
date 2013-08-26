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

function path {
    echo $PATH | tr ":" "\n" | sort
}

function portscan {
    nc -z $1 $2
}

function zombies {
    sudo ps xawo state=,pid=,cmd= | grep -w Z
}

function sshkeys {
    curl -O https://github.com/$1.keys
}

function lt {
    ls -ltrsa "$@" | tail
}

function fname {
    find . -iname "*$@*"
}

function fd {
    if [ "$#" -eq 0 ]; then
        sysctl fs.file-nr
    else
        sudo ls -l /proc/$1/fd | wc -l
    fi
}

function topp {
    top -p $(pgrep -d',' -f $1)
}

function run {
    number=$1
    shift
    for i in `seq $number`; do
        $@
    done
}

export MARKPATH=$HOME/.marks
function jump {
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
    rm -f "$MARKPATH/$1"
}
function marks {
    ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}
function _completemarks {
    reply=($(ls $MARKPATH))
}
compctl -K _completemarks jump
compctl -K _completemarks unmark
