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
setopt auto_param_keys
setopt auto_param_slash
setopt bad_pattern
setopt complete_in_word

# autload
autoload -U compinit && compinit 
autoload -U colors && colors

# auto completion
zstyle ':completion:*' menu select=10
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats " %b"
precmd() {
    vcs_info
}
setopt prompt_subst
PROMPT='%{$fg[cyan]%}%n@%m:%~${vcs_info_msg_0_}$ %{$reset_color%}%'
ANT_HOME='/usr/local/ant'
PATH=$PATH:/usr/local/mysql/bin:$ANT_HOME/bin:/usr/lib/jvm/jdk1.7.0/bin/
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
alias v="vim"
alias clr="clear"
alias ping="mtr"
alias mysqlsu="mysql --safe-updates"
alias rscp="rsync -av -P"

# locale
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"

# ruby
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

for f in ~/.zsh/*.zsh; do source $f; done
