alias df="df -h"
alias du="du -h"
alias netstat="sudo netstat -apn"
alias memory="free -t -m"
alias fdmax="cat /proc/sys/fs/file-max" # current maximum number of file descriptors total allowed to be opened simultaneously
alias ps="ps -j"

function fd() {
    ls -l "/proc/$1/fd"
}
