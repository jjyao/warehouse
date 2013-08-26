# global config
Package {
    ensure => 'installed',
}

Exec {
    path => ["/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin/"]
}

package { ['git-core', 'nautilus-open-terminal', 'shutter', 'python-pip', 'htop', 'nmon', 'exuberant-ctags', 'ack-grep', 'axel' ]:
}

package { ['python-devel', 'mysql-devel', 'zlib-devel', 'openssl-devel', 'ncdu'] }

package { ['flake8']:
    provider => 'pip',
}

exec { 'git':
    command => 'git config --global user.name "姚嘉俊";
                git config --global user.email "jeromeyjj@gmail.com";
                git config --global alias.lg "log --color --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit --";
                git config --global alias.unstage "reset HEAD";
                git config --global core.editor vim;
                git config --global core.pager less;
                git config --global color.ui true;
                git config --global core.autocrlf input;',
}

exec { 'ssh':
    command => 'ssh-keygen -t rsa -C "jeromeyjj@gmail.com"',
}

notify { 'ssh':
    message => 'Add SSH key to GitHub and complete the installation of Git',
}

exec { 'neocomplcache':
    command => 'git clone https://github.com/vim-scripts/neocomplcache.git /usr/share/vim/plugins/neocomplcache',
}

class percona-toolkit {
}

Package['git-core'] -> Exec['git'] -> Exec['ssh'] -> Notify['ssh'] -> Exec['neocomplcache'] 
