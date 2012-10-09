alias df="df -h"
alias du="du -h"
alias netstat="sudo netstat -apne"
alias memory="free -t -m"
alias fdmax="cat /proc/sys/fs/file-max" # current maximum number of file descriptors total allowed to be opened simultaneously
alias ps="ps -j"

function pfd() {
    ls -l "/proc/$1/fd"
}
