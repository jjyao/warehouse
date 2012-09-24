alias gst='git status'
alias glg='git log'
alias gps='git push' 
alias gpl='git pull'
alias ga='git add'
alias grm='git rm'
alias gcm='git commit'
alias gcmm='git commit -m'

function current_branch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo ${ref#refs/heads/}
}

function current_repo() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo $(git remote -v | cut -d':' -f 2)
}
