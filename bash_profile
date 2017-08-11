export FIGNORE=$FIGNORE:DS_Store

export TMP="/Volumes/tmp"

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

set -o vi

IP=`ip route get 8.8.8.8 | awk '{print $NF; exit}'`
export PS1="mbprh[${IP}]: "

export CDPATH=".:${HOME}:${HOME}/src/redhat"

export VISUAL=vim
export EDITOR="$VISUAL"

alias lst="ls -lt | more"
alias gpom="git push origin master"

# Add RVM to PATH for scripting
# export PATH="${PATH}:/usr/local/bin:${HOME}/bin:${HOME}/.rvm/bin:/${HOME}/src/redhat/cfme-log-tools
export PATH="${PATH}:${HOME}/bin:${HOME}/src/redhat/cfme-log-tools"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export GEM_PATH=$HOME/.gem

alias sshrdu='ssh root@10.8.99.238'
alias sshhome='ssh phd@metzger.duckdns.org'
alias sshmetzger='ssh phd@metzger'

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
