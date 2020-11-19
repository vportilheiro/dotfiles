#------------#
#   bash     #
#------------#

umask 077   # file protection no read or write for others
            # umask 022 is no write but read for others

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
ulimit -c 0
set -o noclobber
alias cp='cp -i'    # prompt before overwriting file
alias mv='mv -i'    # prompt before overwriting file
alias rm='rm -i'    # prompt before removing file

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] ; then
   . /etc/bash_completion
fi

# fancy prompt
PS1_FIRST_LINE="\[\e[0;37m\]┌─┤\[\e[0;33m\]\t\[\e[0;37m\]│\[\e[0;31m\]\u\[\e[0;32m\]@\[\e[0;96m\]\h\[\e[0;37m\]│\[\e[0;32m\]\w\[\e[0;37m\]"
PS1_LAST_LINE="\n\[\e[0;37m\]└──╼ \[\e[0m\]"
PS1=$PS1_FIRST_LINE$PS1_LAST_LINE

# Show git-prompt in git repo
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
	__GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
	GIT_PROMPT_ONLY_IN_REPO=1
	GIT_PROMPT_START=$PS1_FIRST_LINE
	GIT_PROMPT_END=$PS1_LAST_LINE
	source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# Put any local aliases or settings below this line.
alias ls="ls -G"
alias la="ls -a"
alias ll="ls -l"
