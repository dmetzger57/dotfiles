# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc
#
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

set -o vi

# Set prompt string to the system
export PS1="djm: "

# Add RVM to PATH for scripting
export PATH="${PATH}:/usr/local/bin:$HOME/bin:$HOME/.rvm/bin:/usr/local/git/bin"

export CDPATH=".:${HOME}:${HOME}/github:${HOME}/projects:${HOME}/projects/redhat"

export GEM_PATH=$HOME/.gem

export VISUAL=vim
export EDITOR="$VISUAL"

ssh_raliegh() {
    if [ $# -eq 1 ]
    then
        ssh root@10.8.99.${1}
    elif [ $# -eq 2 ]
    then
        ssh ${1}@10.8.99.${2}
    fi
}
alias sshrdc=ssh_raliegh

ssh_home_lan() {
    if [ $# -eq 1 ]
    then
        ssh dennis@192.168.1..${1}
    elif [ $# -eq 2 ]
    then
        ssh ${1}@192.168.1.${2}
    fi
}
alias sshhome=ssh_home_lan

alias sshhome='ssh phd@metzger.duckdns.org'
alias sshmetzger='ssh phd@metzger.duckdns.org'

alias cdmiq="cd ${HOME}/github/manageiq"
alias cdprojects="cd ${HOME}/projects;pwd"
alias cdredhat="cd ${HOME}/projects/redhat;pwd"
alias cdtmp='cd ${HOME}/tmp'

# Exit Python Virtual Environment
alias workoff='deactivate'

###
#  f: Opens current directory in MacOS Finder
alias f='open -a Finder ./'

###
#  trash(): Moves a files to the OSX trash
trash () { command mv "$@" ~/.Trash ; }

###
#  spotlight: Search for a file using MacOS Spotlight's metadata
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

###
# Show hoggy processes
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

###
#  cleanupDS:  Recursively delete .DS_Store files
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

###
#  finderShowHidden:   Show hidden files in Finder
#  finderHideHidden:   Hide hidden files in Finder
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

###
#  cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

###
#  my_ps: List processes owned by my user:
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

###
#  httpHeaders: Grabs headers from web page
httpHeaders () { /usr/bin/curl -I -L $@ ; }             # httpHeaders:      Grabs headers from web page

###
#  httpDebug:  Download a web page and show info on what took time
httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }
