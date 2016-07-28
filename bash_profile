###
# Version 1.0
###

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

export PS1="mbpRH: "

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Exit Python Virtual Environment
alias workoff='deactivate'

alias sshhome='ssh phd@metzger.duckdns.org'
alias sshmetzger='ssh phd@metzger.duckdns.org'
alias sshcfme="ssh root@cfme"
alias sshvl3cfme="ssh root@vl3cfme"
alias sshmiq="ssh root@miq"
alias sshvlmiq="ssh root@vlmiq"
alias cdmiq="cd ${HOME}/github/manageiq"
alias cdprojects="cd ${HOME}/projects;pwd"
alias cdredhat="cd ${HOME}/projects/redhat;pwd"
alias cdtmp='cd ${HOME}/tmp'

export PS1="mbpRH: "

export PATH="/usr/local/bin:$PATH:$HOME/bin:$HOME/.rvm/bin:/usr/local/git/bin" # Add RVM to PATH for scripting

export GEM_PATH=$HOME/.gem

export VISUAL=vim
export EDITOR="$VISUAL"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview

alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir

###
#  spotlight: Search for a file using MacOS Spotlight's metadata
###
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

###
#  findPid: find out the pid of a specified process
##
#  Note that the command name can be specified via a regex
#      E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#  Without 'sudo' it will only find processes of the current user
###
findPid () { lsof -t -c "$@" ; }

###
# memHogsTop, memHogsPs:  Find memory hogs
###
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

###
# cpuHogs:  Find CPU hogs
###
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

###
#  my_ps: List processes owned by my user:
###
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

###
#  cleanupDS:  Recursively delete .DS_Store files
###
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

###
#  finderShowHidden:   Show hidden files in Finder
#  finderHideHidden:   Hide hidden files in Finder
###
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

###
#  cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
###
alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

###
#  WEB DEVELOPMENT                                                 #
###

httpHeaders () { /usr/bin/curl -I -L $@ ; }             # httpHeaders:      Grabs headers from web page

###
#  httpDebug:  Download a web page and show info on what took time
#  -------------------------------------------------------------------
###
httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }
