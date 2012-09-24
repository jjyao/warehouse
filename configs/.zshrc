# bindkey
bindkey -v

# setopt
setopt extendedglob
setopt globdots
setopt correctall
setopt sunkeyboardhack
setopt auto_menu
setopt always_to_end
setopt long_list_jobs
setopt list_types

# autload
autoload -U compinit && compinit 
autoload -U colors && colors

# auto completion
zstyle ':completion:*' menu select=10
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

PROMPT="%{$fg[cyan]%}%n@%m:%~$ %{$reset_color%}%"
PATH=$PATH:/usr/local/mysql/bin
PAGER='less'
EDITOR='vim'

# frequently used hosts
alias 88yun="ssh jjyao@66.175.220.101"
alias 66yun="ssh jjyao@66.175.218.148"
alias gfw="ssh -D 8080 root@66.175.220.101"

# some useful aliases
alias tarc="tar cvf"
alias tarcz="tar cvfz"
alias tarx="tar xvf"
alias tarxz="tar xvfz"

alias del="rm -i"
alias rm="rm -i"
alias rake="nocorrect rake"
alias apt-get="sudo apt-get"

# locale
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"

# ruby
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

source ./.zsh/stat.zsh
source ./.zsh/dir.zsh
source ./.zsh/history.zsh
source ./.zsh/git.zsh
source ./.zsh/search.zsh
source ./.zsh/lang.zsh
