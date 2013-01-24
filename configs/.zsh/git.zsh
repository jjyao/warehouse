alias gst='git status'
alias glg='git log --abbrev-commit --left-right'
alias glgg='glg --grep'
alias glgn="git log --graph --all --format=format:'%h - (%ar) %s — %an%d' --abbrev-commit --date=relative"
alias gps='git push' 
alias gpl='git pull'
alias gdf='git diff --color=auto'
alias gdfc='gdf --cached'
alias gad='git add'
alias grm='git rm'
alias gsh='git show'
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
